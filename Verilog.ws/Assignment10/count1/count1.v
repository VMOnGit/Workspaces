module count1#(parameter N = 64)(
    output [N/2:0]count,
    input [N-1:0]in_seq
);

function [N/2:0]counter;
    input [N-1:0] in_seq;
    integer i;
    begin
    
    counter = 0;
    
    for(i = 0;i<N;i=i+1)begin
        if(in_seq[i] == 1'b1)
            counter = counter+1'b1; 
    end
    end
endfunction

assign count = counter(in_seq);

endmodule

