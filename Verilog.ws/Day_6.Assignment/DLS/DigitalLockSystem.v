module DigitalLockSystem(
    output reg [3:0]unlock,
    input wire [3:0]in_seq
);

always@(in_seq)begin
    casez(in_seq)
        4'b1?1?:unlock = 4'b1111;
        default:unlock = 4'b0000;
    endcase
end
endmodule    