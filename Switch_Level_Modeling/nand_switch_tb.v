`timescale 1ps/1ps
`include "nand_switch.v"

module NAND_SWITCH_TB;

    reg A, B;
     wire OUT;
    integer i;

    NAND_SWITCH NA1 (OUT, A, B);

    initial 
    begin
        $monitor("Time: %1t | OUT: %b | A: %b | B: %b", $time, OUT, A, B);

        for (i = 5; i > 0; i = i - 1)
        begin
            {B,A} = i;
            #10;
        end
            

    end    
endmodule