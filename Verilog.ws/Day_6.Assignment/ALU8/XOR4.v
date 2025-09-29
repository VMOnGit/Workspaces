module XOR4(
    output [3:0]xor_op,
    input [3:0]a,b
);

xor xor_gate0(xor_op[0], a[0], b[0]);
xor xor_gate1(xor_op[1], a[1], b[1]);
xor xor_gate2(xor_op[2], a[2], b[2]);
xor xor_gate3(xor_op[3], a[3], b[3]);

endmodule