`timescale 1ns/1ps

// Simple testbench for `led_peri`
// This testbench demonstrates synchronous single-cycle writes to the peripheral
// - Clock period is 10 ns (toggle every 5 ns)
// - Writes assert `wr_en` for one full clock period (one cycle) using time delays
//   so each write is sampled on the following rising clock edge inside the DUT.
module led_peri_tb;

    // Testbench signals
    reg wr_en;
    reg [7:0] addr, din;
    reg clk, rst_n;
    wire [15:0] led;

    // Instantiate the DUT (Device Under Test)
    led_peri uut (
        .led(led),
        .wr_en(wr_en),
        .addr(addr),
        .din(din),
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation: 10 ns period (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        wr_en = 0;
        addr = 8'b0;
        din = 8'b0;

        // Release reset after one clock period
        #10 rst_n = 1;

        // Each write below asserts `wr_en` for one #10 delay which equals one clock period
        // (wr_en asserted between two rising edges). This models a single-cycle write.

        // Write to CTRL_WRITE register to enable LED drive
        #10 wr_en = 1; addr = 8'b0000_0001; din = 8'b0000_0001; // Enable LED control
        #10 wr_en = 0; // deassert after one clock period

        // Write to LED_MSB_WRITE register (upper byte)
        #10 wr_en = 1; addr = 8'b0000_0010; din = 8'b1010_1010; // MSB data
        #10 wr_en = 0;

        // Write to LED_LSB_WRITE register (lower byte)
        #10 wr_en = 1; addr = 8'b0000_0011; din = 8'b0101_0101; // LSB data
        #10 wr_en = 0;

        // Wait some time for the DUT to propagate and for observation
        #50;

        // End simulation (could use $finish if running batch simulations)
        $stop;
    end

endmodule