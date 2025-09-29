module circShift_tb;
    reg [7:0]in;
    wire [7:0]outR;
    wire [7:0]outL;
    integer i,file_handle;

    circShift RL(outR,outL,in);

    initial begin
        file_handle=$fopen("CIRCHSHIFT_ouutput.txt","w");
        for(i=0;i<128;i=i+1)begin
            in=i;#10;
            $fdisplay(file_handle,"| in=%b | Rshift=%b | Lshift=%b |", in,outR,outL);
        end
        $fclose(file_handle);
    end
endmodule