module XNOR4(
    output [3:0]xnor_op,
    input [3:0]a,b
);

xnor xnor_gate0(xnor_op[0], a[0], b[0]);
xnor xnor_gate1(xnor_op[1], a[1], b[1]);
xnor xnor_gate2(xnor_op[2], a[2], b[2]);
xnor xnor_gate3(xnor_op[3], a[3], b[3]);

endmodule