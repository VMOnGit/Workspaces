module fadder#(parameter N = 8)(
    output reg sum,
    output reg Cout,
    input A,B,
    input Cin
);

reg axorb;

always @(*)begin
    axorb <= A^B;
    sum <= axorb^Cin;
    Cout <= (A&B)|(Cin&(axorb));
end

endmodule

