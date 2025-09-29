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