`include "ALU8.v"

module fadder_tb();
wire [7:0] addout,subout,incout;
wire [15:0]mulout,muxout;
wire cFlagAdd,cFlagSub,cFlagInc,cFlagDec,done;
reg [1:0] opcode;
reg [7:0] in1,in2;
reg clk,cin,enable,rst;


ALU8 al(addout,subout,incout,mulout,muxout,cFlagAdd,cFlagSub,cFlagInc,cFlagMul,done,opcode,in1,in2,clk,cin,enable,rst);

initial clk = 0;

always #5 clk = ~clk;

initial begin
    enable = 1;
    opcode = 2'b11;

    in1 = 8'h03;
    in2 = 8'h05;
    cin = 1'b0;#5;
    $monitor(" A = %d | B = %d | Cin = %b | sum = %d | muxout = %d | cout = %b |",in1,in2,cin,addout,muxout,cFlagSub);   
    #100;
    $finish;   
end



endmodule