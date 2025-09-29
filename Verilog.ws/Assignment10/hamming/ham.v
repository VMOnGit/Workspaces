module hamming #(parameter N=8)(
    output [N/2:0]count,
    input [N-1:0]in1,in2
);

    function [N/2:0] ham;
    input [N-1:0]in1;
    input [N-1:0]in2;
    reg [N-1:0]op;
    integer i;

    begin
        ham = 0;
        op=in1^in2;
        for(i=0;i<N;i=i+1)begin
            if (op[i]==1)
            ham=ham+1;
        end
    end
    endfunction

    assign count = ham(in1,in2);

endmodule

