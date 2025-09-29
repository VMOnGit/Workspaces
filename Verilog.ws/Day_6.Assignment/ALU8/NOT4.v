module NOT4(
    output [3:0]inverted_op,
    input [3:0]in
);


not not_gate0(inverted_op[0], in[0]);
not not_gate1(inverted_op[1], in[1]);
not not_gate2(inverted_op[2], in[2]);
not not_gate3(inverted_op[3], in[3]);

endmodule