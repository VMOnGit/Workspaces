`timescale 1ns/1ps
module top_module(
    output [15:0]led,
    output [7:0]segment,
    output [3:0]digit,
    input clk, en
);

wire [7:0]read_address,read_data;
wire [7:0]write_address,write_data,o1,o2,o3,o4;
wire read_enable,rst,write_enable,done;
wire [4:0] FSM_STATE;
wire [31:0] counter;

// Create an internal active-low reset signal expected by instantiated modules

// Instantiate modules (behavioral stubs used by the testbench / simulation)
counter c1(done, counter, write_data, write_address, increment, write_enable, clk, rst);
decoder d1(FSM_STATE, o1, o2, o3, o4);
displayer dis1(clk, o1, o2, o3, o4, digit, segment);
PROGMEM PM1(clk, read_enable, read_address, read_data);
CU cu1(clk, en, rst, read_enable, increment, read_address, read_data, counter, write_enable, write_address, write_data, FSM_STATE);
led_peripheral ledp1(.led(led),.wr_en(write_enable), .addr(write_address), .din(write_data), .rst(rst), .clk(clk));

endmodule