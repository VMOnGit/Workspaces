`timescale 1ps/1ps
`include "FA_HA.v"

module FA_HA_tb;
reg A,B,C;
wire SUM,CARRY;
integer i;

FA_HA F1(SUM,CARRY,A,B,C);

initial begin
    $monitor("| TIME = %1t | SUM = %b | CARRY= %b| A = %b | B = %b | C = %b | ",$time,SUM,CARRY,A,B,C);
    for(i=8;i>0;i=i-1)begin
        {A,B,C}=i;
        #10;
    end
end

endmodule