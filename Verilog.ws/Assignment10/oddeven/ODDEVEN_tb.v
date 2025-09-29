module ODDEVEN_tb;

    reg [7:0]in;
    wire out;
    integer i,file_handle;

    ODDEVEN od(out,in);

    initial begin
        file_handle=$fopen("ODDEVEN.txt","w");
        for(i=0;i<128;i=i+1)begin
            in=i;#10;
            $fdisplay(file_handle,"| in=%b | out=%b | 0-even and 1-odd |",in,out);
        end
        $fclose(file_handle);
    end

endmodule