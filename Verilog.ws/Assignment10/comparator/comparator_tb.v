module comparator_tb;
reg [7:0]in1,in2;
wire [2:0]out;
integer file_handle;

comparator c1(out,in1,in2);

initial begin
    file_handle = $fopen("comparator_output.txt","w");
    in1 = 8'h55;
    in2 = 8'h03;#10;
    $fdisplay(file_handle,"| in1=%h | in2=%h | out=%b |",in1,in2,out);
    in1 = 8'h03;
    in2 = 8'h55;#10;
    $fdisplay(file_handle,"| in1=%h | in2=%h | out=%b |",in1,in2,out);
    in1 = 8'h55;
    in2 = 8'h55;#10;
    $fdisplay(file_handle,"| in1=%h | in2=%h | out=%b |",in1,in2,out);

    $fclose(file_handle);
end

endmodule