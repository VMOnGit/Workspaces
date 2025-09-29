module pattern(
    input wire [2:0]a,
    output reg out
);

always @(a)begin

    casex(a)
        3'b1xx : out=1'b1;
        default: out=1'b0;

    endcase

end
endmodule

