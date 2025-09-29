module DigitalLockSystem_tb;

wire [3:0]unlock;

reg [3:0]in_seq;
integer file_handle,i;

DigitalLockSystem DLS(.unlock(unlock),.in_seq(in_seq));
initial begin
    
    file_handle = $fopen("DigitalLockSystem_output.txt","w");
    
end
initial begin
    $fmonitor(file_handle,"| input_seq = %b | unlock = %b |",in_seq,unlock);
    for(i=0;i<16;i=i+1)begin
        in_seq = i;#10;
    end

$fclose(file_handle);
end

endmodule