module comparator#(parameter N = 8)(
    output [2:0]res,
    input [N-1:0]in1,in2
);

function [2:0]compare;
    input [N-1:0]in1;
    input [N-1:0]in2;

    begin
        if(in1>in2)
            compare = 3'b001;
        else if(in1<in2)
            compare = 3'b101;
        else    
            compare = 3'b000;
    end

endfunction

assign res = compare(in1,in2);

endmodule

