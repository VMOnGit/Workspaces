module graytob#(parameter N=8)(
    output [N-1:0]outgray,
    output reg [N-1:0]outbin,
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
    
    task gray2b( input [N-1:0]in, output [N-1:0]gray2b);
        integer i;

        begin
            gray2b[N-1]=in[N-1];
            for(i=N-2;i>=0;i=i-1)begin
                gray2b[i]=gray2b[i+1]^in[i];
            end
        end
    
    endtask

    assign outgray=bin2gray(in);
    always@(*)begin
    gray2b(outgray,outbin);
    end
endmodule

module graybin_tb;
    reg [7:0]in;
    wire [7:0]outgray,outbin;
    integer i,file_handle;

    graytob gg(outbin,outgray,in);

    initial begin
        file_handle=$fopen("GRAY2B_OUTPUT.txt","w");
        for(i=0;i<128;i=i+1)begin
            in=i;#10;
            $fdisplay(file_handle,"| in = %b | OP gray = %b | OP bin = %b |",in,outgray,outbin);
        end
    end


endmodule