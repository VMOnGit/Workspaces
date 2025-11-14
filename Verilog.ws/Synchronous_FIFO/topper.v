`timescale 1ns/1ps 

// top_pro_fifo_con (topper)
// Top-level wrapper connecting producer -> fifo -> consumer
// - Instantiates a parameterized FIFO, a producer that writes to the FIFO,
//   and a consumer that reads from the FIFO.
// - Exposes a single output 'dout' which is driven by the consumer's read data.

module top_pro_fifo_con#(parameter DWIDTH = 8,DEPTH=8)(
    output reg[DWIDTH-1:0]dout,
    input clk,rst_n
);

// Internal interconnect signals
wire full,empty,wr_en,rd_en;
wire [DWIDTH-1:0]dout_temp,din;

// -----------------------------------------------------------------------------
// FIFO instance: acts as the buffered queue between producer and consumer
// -----------------------------------------------------------------------------
fifo8x32 #(
    .DWIDTH(DWIDTH),
    .DEPTH(DEPTH)
) fifo_inst (
    .clk(clk),
    .rst_n(rst_n),
    .din(din),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .dout(dout_temp),
    .full(full),
    .empty(empty)
);

// -----------------------------------------------------------------------------
// Producer instance: generates data and asserts write enable when appropriate
// Producer observes the FIFO 'full' signal to avoid writing when full
// -----------------------------------------------------------------------------
producer  #(
    .DWIDTH(DWIDTH),
    .DEPTH(DEPTH)
) p1 (
    .clk(clk),
    .wr_en(wr_en),
    .din(din),
    .rst_n(rst_n),
    .full(full)
);

// -----------------------------------------------------------------------------
// Consumer instance: issues read requests and consumes FIFO output
// Consumer observes the FIFO 'empty' signal to avoid reading when empty
// -----------------------------------------------------------------------------
consumer #(
    .DWIDTH(DWIDTH),
    .DEPTH(DEPTH)
) c1 (
    .clk(clk),
    .rd_en(rd_en),
    .rst_n(rst_n),
    .dout(dout_temp),
    .empty(empty)
);

// Drive the top-level dout from the FIFO/consumer data path
always@(*)
    dout <= dout_temp;

endmodule