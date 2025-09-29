module circShift#(parameter N=8)(
    output [N-1:0]shiftedR,shiftedL,
    input [N-1:0]in_seq
);


function [N-1:0]rightShift;
    input [N-1:0]in_seq;
    reg temp;
    begin
        
        temp = in_seq[0];
        rightShift = in_seq>>1;
        rightShift[N-1] = temp;

    end
endfunction

function [N-1:0]leftShift;
    input [N-1:0]in_seq;
    reg temp;
    begin
        
        temp = in_seq[N-1];
        leftShift = in_seq<<1;
        leftShift[0] = temp;

    end
endfunction

assign shiftedR = rightShift(in_seq);
assign shiftedL = leftShift(in_seq);

endmodule

