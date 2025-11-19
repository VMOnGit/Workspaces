`include "mxu41.v"

`include "booth8.v"
module ALU8(
    output [7:0] addout,subout,incout,
    output [15:0] muxout,mulout,
    output cFlagAdd,cFlagSub,cFlagInc,oFlagMul,done,
    input [1:0] opcode,
    input [7:0] in1,in2,
    input clk,cin,enable,rst
);

wire [7:0] subin,tempoutSub;
wire cFlagTemp;
MUX41 mx1(addout,subout,incout,mulout,enable,clk,opcode,muxout);

FADDER8 fa81(addout,cFlagAdd,in1,in2,cin);

//sub
FADDER8 two81(subin,cFlagTemp,(~in1),8'b00000001,1'b0);
FADDER8 sub81(tempoutSub,cFlagSub,in1,subin,cin);
//checking for Borrow for two's complement
FADDER8 two82(subout,cFlagTemp,((cFlagSub)?(tempoutSub):(~tempoutSub)),((cFlagSub)?(8'b00000000):(8'b00000001)),1'b0);
//inc
FADDER8 inc81(incout,cFlagInc,in1,8'b00000001,cin);
//multiplier
booth_multiplier_8bit mul8(mulout,done,in1,in2,clk,enable,rst);

endmodule