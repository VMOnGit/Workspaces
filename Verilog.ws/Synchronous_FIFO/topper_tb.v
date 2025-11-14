`timescale 1ns/1ps

// topper_tb.v
// Testbench for the top-level `top_pro_fifo_con` module.
// - Generates clock and reset
// - Instantiates the top-level design (producer -> fifo -> consumer)
// - Dumps VCD for waveform inspection
// - Monitors internal signals and performs simple sanity checks

module topper_tb;

parameter DWIDTH = 8;
parameter DEPTH  = 8;
parameter CLK_PERIOD = 10; // 10 ns -> 100 MHz

reg clk;
reg rst_n;
wire [DWIDTH-1:0] dout;

// Instantiate top module
top_pro_fifo_con #(
    .DWIDTH(DWIDTH),
    .DEPTH(DEPTH)
) uut (
    .clk(clk),
    .rst_n(rst_n),
    .dout(dout)
);

// Clock generation
initial begin
    clk = 1'b0;
end
always #(CLK_PERIOD/2) clk = ~clk;

// Reset and stimulus
initial begin
    // VCD dump for waveform viewers
    $dumpfile("topper_tb.vcd");
    $dumpvars(0, uut);

    // Initialize
    rst_n = 1'b1;
    #(CLK_PERIOD*2);

    // Assert reset (active low)
    rst_n = 1'b0;
    #(CLK_PERIOD*5);
    rst_n = 1'b1;

    // Let the design run for a while to observe many producer/consumer/fifo interactions
    #(CLK_PERIOD*500);

    $display("Testbench: Simulation completed at time %0t", $time);
    $finish;
end

// Human readable monitor for key signals
initial begin
    $display("Starting simulation - monitoring top-level and internal signals");
    $display("Time   rst  dout  p_wr  c_rd  full empty  p_state c_state");
    $monitor("%4t   %b    %h    %b     %b     %b    %b     %0d      %0d",
             $time, rst_n, dout,
             uut.p1.wr_en, uut.c1.rd_en,
             uut.fifo_inst.full, uut.fifo_inst.empty,
             uut.p1.state, uut.c1.state);
end

// Simple checks: don't allow write when FIFO full or read when FIFO empty
always @(posedge clk) begin
    if (uut.p1.wr_en && uut.fifo_inst.full) begin
        $display("ERROR: Producer attempted write while FIFO full at time %0t", $time);
        $stop;
    end
    if (uut.c1.rd_en && uut.fifo_inst.empty) begin
        $display("ERROR: Consumer attempted read while FIFO empty at time %0t", $time);
        $stop;
    end
end

endmodule
