module maxmin3_tb;

wire [7:0]op1,op2;
reg [7:0]in1,in2,in3;
integer i,file_handle;

maxmin3 mm1(op1,op2,in1,in2,in3);

initial begin
    file_handle = $fopen("maxmin3_output.txt","w");

    for(i=0;i<128;i=i+1)begin
        in1 = i;#10;
        in2 = ~i;#10;
        in3 = in1+i;#10;
        $fdisplay(file_handle,"| in1 = %d | in2 = %d | in3 = %d | max = %d | min = %d |",in1,in2,in3,op1,op2);
    end
    $fclose(file_handle);
end

endmodule