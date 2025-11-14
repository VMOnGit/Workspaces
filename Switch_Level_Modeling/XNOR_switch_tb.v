`timescale 1ps/1ps
`include "XNOR_switch.v"

module XNOR_SWITCH_tb;
reg A,B;
wire OUT;
integer i;

XNOR_SWITCH X1(OUT,A,B);

initial begin
    $monitor("Time: %1t | OUT: %b | A: %b | B: %b", $time, OUT, A, B);

        for (i = 5; i > 0; i = i - 1)
        begin
            {B,A} = i;
            #10;
        end
end

    
endmodule