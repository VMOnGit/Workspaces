module bitrev_tb;
reg [7:0]in;
wire [7:0]out;
wire palind;
integer i,file_handle;

bitrev br(palind,out,in);

initial begin
    file_handle=$fopen("BITREV_output.txt","w");
    for(i=0;i<128;i=i+1)begin
        in=i;#10;
        $fdisplay(file_handle,"| INPUT=%b | REVERSE=%b | Palindrome=%b |",in,out,palind);
    end    
    $fclose(file_handle);
end

endmodule