module majority_tb;
reg [2:0] in_seq;
wire majority;
integer i,file_handle;


majority m(majority,in_seq);

initial begin
    file_handle = $fopen("majority_output.txt", "w");
    for(i=0;i<8;i=i+1)begin
        in_seq = i;#10;
        $fdisplay(file_handle,"| in_seq=%b | majority=%b |",in_seq,majority);
    end
    $fclose(file_handle);
end

endmodule