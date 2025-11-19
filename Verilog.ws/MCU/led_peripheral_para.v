`timescale 1ns/1ps

// led_peri - Parameterized LED peripheral with register write interface
module led_peripheral #(
    parameter ADDR_WIDTH = 8,  // Address bus width
              DATA_WIDTH = 8, // Data bus width
              LED_WIDTH = 16  // LED output width
)(
    output reg [LED_WIDTH-1:0] led, // LED output
    input wr_en,                   // Write enable
    input [ADDR_WIDTH-1:0] addr,   // Address bus
    input [DATA_WIDTH-1:0] din,    // Data input
    input clk,                     // Clock
    input rst                    // Active-low reset
);

// Internal registers
reg [DATA_WIDTH-1:0] LED_control; // Control register
reg [DATA_WIDTH-1:0] led_data_1;  // Upper byte of LED output
reg [DATA_WIDTH-1:0] led_data_2;  // Lower byte of LED output

// Address map constants
parameter LED_CONTROL_WRITE    = 8'b0000_0001, // Address for control register
           LED_DATA1_WRITE = 8'b0000_0010, // Address for MSB register
           LED_DATA2_WRITE = 8'b0000_0011; // Address for LSB register

// Reset and write logic
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Reset all registers
        LED_control <= 0;
        led_data_1 <= 0;
        led_data_2 <= 0;
    end else begin
        if (wr_en) begin
        // Handle write operations based on address
        case (addr)
            LED_CONTROL_WRITE:    LED_control <= din;       // Write to control register
            LED_DATA1_WRITE: led_data_1 <= din;        // Write to MSB register
            LED_DATA2_WRITE: led_data_2 <= din;        // Write to LSB register
            default: begin
                    // No operation for other addresses; preserve current values
                    LED_control <= LED_control;
                    led_data_1 <= led_data_1;
                    led_data_2 <= led_data_2;
                end
        endcase
        end
    end
end

// Drive LED output based on control register
always @(posedge clk or posedge rst) begin
    if (rst) begin
        led <= 0;
    end else begin
        if (LED_control[0] == 1'b1) // Check drive enable bit
            led <= {led_data_1, led_data_2}; // Concatenate MSB and LSB
        else
            led <= 0; // Drive low when disabled
    end
end

endmodule