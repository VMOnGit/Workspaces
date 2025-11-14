`include "nand_switch.v"

module HA_NAND (
    output SUM,CARRY,
    input A,B
);
wire NW1 ,NW2,NW3;

NAND_SWITCH N1(NW1 ,A , B);
NAND_SWITCH N2(NW2 ,A ,NW1);
NAND_SWITCH N3(NW3 ,B ,NW1);
NAND_SWITCH N4(SUM ,NW2 ,NW3);
NAND_SWITCH N5(CARRY , NW1 ,NW1);
    
endmodule