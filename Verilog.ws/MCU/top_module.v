`timescale 1ns/1ps
module top_module(
    output [15:0]led,
    input clk, en
);

wire [7:0]read_address,read_data;
wire [7:0]write_address,write_data;
wire read_enable,rst,write_enable,finsh;
wire [4:0] FSM_STATE;

// Create an internal active-low reset signal expected by instantiated modules

// Instantiate modules (behavioral stubs used by the testbench / simulation)
PROGMEM PM1(clk, read_enable, read_address, read_data);
CU cu1(clk, en, rst, read_enable, read_address, read_data, write_enable, write_address, write_data, FSM_STATE);
led_peripheral ledp1(.led(led),.wr_en(write_enable), .addr(write_address), .din(write_data), .rst(rst), .clk(clk));

endmodule