module AND4(
    output [3:0]andop,
    input [3:0]in1,in2
);

and and_gate0(andop[0], in1[0], in2[0]);
and and_gate1(andop[1], in1[1], in2[1]);
and and_gate2(andop[2], in1[2], in2[2]);
and and_gate3(andop[3], in1[3], in2[3]);

endmodule