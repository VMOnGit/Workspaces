module two_complement(
    output [3:0]result,
    input [3:0]a
);

function [3:0]twos
(input [3:0]a
    );

begin
    twos=(~(a)+1'b1);
end

endfunction

assign result = twos(a);
endmodule

module complement_tb;
reg [3:0]A;
wire [3:0]RES;
two_complement a1(.a(A),.result(RES));
integer i;

initial begin

        for(i=0;i<16;i=i+1)begin
            A=i;#10
            $display("1's Complement of %b\t is %b\n ",A,RES);
        end
end 
endmodule
