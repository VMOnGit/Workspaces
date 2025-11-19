`include "FADDER.v"

module FADDER8(
    output [7:0]sum,
    output Cout,
    input [7:0] A,B,
    input Cin
);
wire [8:0]carry;



fadder fa1(sum[0],carry[1],A[0],B[0],Cin);
fadder fa2(sum[1],carry[2],A[1],B[1],carry[1]);
fadder fa3(sum[2],carry[3],A[2],B[2],carry[2]);
fadder fa4(sum[3],carry[4],A[3],B[3],carry[3]);
fadder fa5(sum[4],carry[5],A[4],B[4],carry[4]);
fadder fa6(sum[5],carry[6],A[5],B[5],carry[5]);
fadder fa7(sum[6],carry[7],A[6],B[6],carry[6]);
fadder fa8(sum[7],Cout,A[7],B[7],carry[7]);



endmodule