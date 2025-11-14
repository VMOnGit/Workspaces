module HA_NOR(
    output SUM,CARRY,
    input A,B
);
wire NW1,NW2,NW3;

nor n1(NW1,A,A);
nor n2(NW2,B,B);

nor n3(CARRY,NW1,NW2);

nor n4(NW3,A,B);
nor n5(SUM,CARRY,NW3);

endmodule