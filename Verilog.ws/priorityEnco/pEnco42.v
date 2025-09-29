module pEnco42(
    input [3:0]d,
    output [1:0]out
);

assign out[0] = d[3]|((~d[2])&d[1]);
assign out[1] = d[2]|d[3];

endmodule
