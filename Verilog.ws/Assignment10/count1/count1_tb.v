module count1_tb;
reg [7:0]in_seq;
wire [4:0]opcount;
integer i,file_handle;

count1 c1(opcount,in_seq);

initial begin
    file_handle = $fopen("count1_output.txt","w");
    for(i=0;i<128;i=i+1)begin
        in_seq = i;#10;
        $fdisplay(file_handle,"| input sequence = %b | count 1s = %d |",in_seq,opcount);
    end
    $fclose(file_handle);
    
end

endmodule