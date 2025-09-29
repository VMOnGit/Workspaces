module graytob#(parameter N=8)(
    output [N-1:0]outbin,outgray,
    input [N-1:0]in
);
    function [N-1:0] bin2gray;
    
        input [N-1:0]in;
        integer i;

        begin
            bin2gray[N-1]=in[N-1];
            for(i=N-2;i>=0;i=i-1)begin
                bin2gray[i]=in[i]^in[i+1];
            end
        end
    
    endfunction
    
    function [N-1:0] gray2b;
    
        input [N-1:0]in;
        integer i;

        begin
            gray2b[N-1]=in[N-1];
            for(i=N-2;i>=0;i=i-1)begin
                gray2b[i]=gray2b[i+1]^in[i];
            end
        end
    
    endfunction

    assign outgray=bin2gray(in);
    assign outbin=gray2b(outgray);
endmodule

