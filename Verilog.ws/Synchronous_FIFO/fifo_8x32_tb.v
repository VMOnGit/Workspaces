`timescale 1ns/1ps

// fifo8x32_tb.v
// Testbench for the `fifo8x32` module.
// - Generates clock and reset
// - Exercises write, read, simultaneous read/write, full and empty conditions
// - Uses random input data for writes and monitors fifo flags and outputs

module fifo8x32_tb();

// Parameters
parameter DWIDTH = 8;
parameter DEPTH = 25;
parameter CLK_PERIOD = 10; // 10ns clock period (100MHz)

// Signals
reg clk;
reg rst_n;
reg [DWIDTH-1:0] din;
reg wr_en;
reg rd_en;
wire [DWIDTH-1:0] dout;
wire full;
wire empty;
reg [24:0]counter_tb;

// Instantiate FIFO module
fifo8x32 #(
    .DWIDTH(DWIDTH),
    .DEPTH(DEPTH)
) fifo_inst (
    .clk(clk),
    .rst_n(rst_n),
    .din(din),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .dout(dout),
    .full(full),
    .empty(empty)
);
//wire[DWIDTH-1:0] fifo[DEPTH-1:0];
// Clock generation

always begin
    clk = 1'b0;
    #(CLK_PERIOD/2);
    clk = 1'b1;
    #(CLK_PERIOD/2);
    counter_tb <= fifo_inst.counter;
end
//assign fifo = fifo_inst.fifo;
// Test stimulus
initial begin
    // Initialize signals
    rst_n = 1'b1;
    din = 8'h00;
    wr_en = 1'b0;
    rd_en = 1'b0;
    
    // Apply reset
    #(CLK_PERIOD*2);
    rst_n = 1'b0;
    #(CLK_PERIOD*2);
    rst_n = 1'b1;
    
    // Test case 1: Write operations
    // Write 5 data values
    repeat(5) begin
        @(posedge clk);
        wr_en = 1'b1;
        din = $random;
        #(CLK_PERIOD);
    end
    wr_en = 1'b0;
    
    // Test case 2: Read operations
    // Read 3 values
    #(CLK_PERIOD*2);
    repeat(3) begin
        @(posedge clk);
        rd_en = 1'b1;
        #(CLK_PERIOD);
    end
    rd_en = 1'b0;
    
    // Test case 3: Simultaneous read and write
    #(CLK_PERIOD*2);
    repeat(3) begin
        @(posedge clk);
        wr_en = 1'b1;
        rd_en = 1'b1;
        din = $random;
        #(CLK_PERIOD);
    end
    wr_en = 1'b0;
    rd_en = 1'b0;
    
    // Test case 4: Fill FIFO to test full condition
    #(CLK_PERIOD*2);
    wr_en = 1'b1;
    repeat(DEPTH) begin
        @(posedge clk);
        din = $random;
        #(CLK_PERIOD);
    end
    wr_en = 1'b0;
    
    // Test case 5: Empty the FIFO to test empty condition
    #(CLK_PERIOD*2);
    rd_en = 1'b1;
    repeat(DEPTH) begin
        @(posedge clk);
        #(CLK_PERIOD);
    end
    rd_en = 1'b0;
    
    // End simulation
    #(CLK_PERIOD*5);
    $display("Simulation completed");
    $finish;
end 

// Monitor changes
initial begin
    $monitor("Time=%0t rst_n=%b wr_en=%b rd_en=%b din=%h dout=%h full=%b empty=%b",
             $time, rst_n, wr_en, rd_en, din, dout, full, empty);
end

endmodule
