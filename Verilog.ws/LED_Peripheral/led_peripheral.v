`timescale 1ns/1ps

// led_peri - Simple LED peripheral with register write interface
// Ports:
//  - led    : 16-bit output that drives the LEDs (MSB:led[15], LSB:led[0])
//  - wr_en  : write enable (synchronous write on rising clock edge)
//  - addr   : 8-bit register address used to select target register
//  - din    : 8-bit data input for writes
//  - clk    : system clock
//  - rst_n  : active-low synchronous reset (clears outputs/registers)
module led_peri(
    output reg [15:0] led,
    input wr_en,
    input [7:0]addr,din,
    input clk,rst_n
);

// Internal byte registers:
//  - LED_control : control register (bit-0 used as "drive enable")
//  - led_data_1  : upper byte (MSB) of the 16-bit LED output
//  - led_data_2  : lower byte (LSB) of the 16-bit LED output
reg [7:0]LED_control,led_data_1,led_data_2;

// Address map constants - used to decode writes
parameter IDLE = 8'b0000_0000,
          CTRL_WRITE = 8'b0000_0001,
          LED_MSB_WRITE = 8'b0000_0010,
          LED_LSB_WRITE = 8'b0000_0011;

// Main synchronous block: handles writes and output update
// - On reset (active low) the `led` output is cleared to zero
// - On a rising clock edge, if `wr_en` is asserted the selected
//   internal register is updated based on `addr` and `din`.
// - After register updates the module updates the `led` output:
//   if LED_control[0] == 1 then `led` is driven with concatenated
//   `{led_data_1, led_data_2}`, otherwise `led` is driven low.
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        // Asynchronous reset path: clear output (registers not explicitly cleared here)
        // Note: registers LED_control/led_data_* retain their power-up value unless reset
        led <= 0;
    end
    else begin
        // Handle write operations (synchronous to rising clock)
        if(wr_en) begin
            case (addr)
                CTRL_WRITE: begin
                    // Write control byte; bit 0 used as enable for driving `led`
                    LED_control <= din;
                end
                LED_MSB_WRITE: begin
                    // Write MSB (upper 8 bits) of the 16-bit LED value
                    led_data_1[7:0] <= din;
                end
                LED_LSB_WRITE: begin
                    // Write LSB (lower 8 bits) of the 16-bit LED value
                    led_data_2[7:0] <= din;
                end
                default: begin
                    // No operation for other addresses; preserve current values
                    LED_control <= LED_control;
                    led_data_1 <= led_data_1;
                    led_data_2 <= led_data_2;
                end
            endcase
        end

        // Drive the output based on the enable bit in LED_control
        if(LED_control[0] == 1'b1)
            led <= {led_data_1, led_data_2};
        else
            led <= 0; // drive low when disabled
    end
end

endmodule