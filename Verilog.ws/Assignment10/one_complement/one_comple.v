module one_complement(
    output [3:0]result,
    input [3:0]a
);

function [3:0]ones
(input [3:0]a
    );

begin
    ones=~(a);
end

endfunction

assign result = ones(a);
endmodule

module complement_tb;
reg [3:0]A;
wire [3:0]RES;
one_complement a1(.a(A),.result(RES));
integer i;

initial begin

        for(i=0;i<16;i=i+1)begin
            A=i;#10
            $display("1's Complement of %b\t is %b\n ",A,RES);
        end
end 
endmodule
