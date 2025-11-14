`timescale 1ps/1ps
`include "HA_NOR.v"

module HA_NOR_tb;
reg A,B;
wire SUM,CARRY;
integer i;

HA_NOR H1(SUM,CARRY,A,B);

initial begin
    $monitor("| TIME = %1t | SUM = %b | CARRY= %b| A = %b | B = %b |",$time,SUM,CARRY,A,B);
    for(i=5;i>0;i=i-1)begin
        {A,B}=i;
        #10;
    end
end

endmodule