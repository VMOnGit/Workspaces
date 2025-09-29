module hamming_tb;
reg [7:0]in1;
reg [7:0]in2;
wire [4:0]out;
integer i,file_handle;

hamming h1(out,in1,in2);

initial begin
    file_handle=$fopen("HAMMING_output.txt","w");
    for(i=0;i<128;i=i+1)begin
        in1=i;
        in2=~i;#10;
        $fdisplay(file_handle,"| in1=%b | in2=%b | Hamming Distance=%b |",in1,in2,out);
    end
end

endmodule