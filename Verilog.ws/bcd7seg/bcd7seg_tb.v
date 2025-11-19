module tb_BCD7SEG;
wire a,b,c,d,e,f,g;
reg i0,i1,i2,i3;
integer i,file_handle;

BCD7SEG b1(a,b,c,d,e,f,g,i3,i2,i1,i0);
initial begin
    file_handle = $fopen("bcd7seg_output.txt","w");
end
initial begin
    $dumpfile("A.vcd");
    $dumpvars(0,tb_BCD7SEG);
    $fmonitor(file_handle,"| input=%b%b%b%b | OP: | a=%b | b=%b | c=%b | d=%b | e=%b | f=%b | g = %b |",i3,i2,i1,i0,a,b,c,d,e,f,g);
    for(i=0;i<16;i=i+1) begin
            {i3,i2,i1,i0}=i;#10;
        end
    $fclose(file_handle);
end
endmodule