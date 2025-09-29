module maxmin3#(parameter N = 8)(
    output [N-1:0]max,min,
    input [N-1:0]in1,in2,in3
);

function [N-1:0] maxFn;
    input [N-1:0]in1,in2,in3;
    begin
        maxFn = (in1>in2?(in1>in3?in1:in3):(in2>in3)?in2:in3);
    end
endfunction

function [N-1:0] minFn;
    input [N-1:0] in1,in2,in3;
    begin
        minFn = (in1<in2?(in1<in3?in1:in3):(in2<in3)?in2:in3);
    end
endfunction

assign max = maxFn(in1,in2,in3);
assign min = minFn(in1,in2,in3);

endmodule


