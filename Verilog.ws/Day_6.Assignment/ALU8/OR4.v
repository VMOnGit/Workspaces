module OR4(
    output [3:0]or_op,
    input [3:0]a,b
);

or or_gate0(or_op[0], a[0], b[0]);
or or_gate1(or_op[1], a[1], b[1]);
or or_gate2(or_op[2], a[2], b[2]);
or or_gate3(or_op[3], a[3], b[3]);

endmodule