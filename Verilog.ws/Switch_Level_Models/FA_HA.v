`include "HA_NAND.v"
module FA_HA(
    output SUM,CARRY,
    input A,B,C
);

wire NW1,NW2,NW3;

HA_NAND H1(NW1,NW2,A,B);
HA_NAND H2(SUM,NW3,NW1,C);

or o1(CARRY,NW3,NW2);

endmodule