module evenParity_tb;
wire parityBit;
reg [3:0]in_seq;
integer file_handle;

evenParity ep(parityBit,in_seq);

initial begin
    file_handle = $fopen("evenParity_output.txt","w");
    in_seq = 4'h4;#10;
    $fdisplay(file_handle,"| in_seq = %h | parity bit = %b |",in_seq,parityBit);
    in_seq = 4'hf;#10;
    $fdisplay(file_handle,"| in_seq = %h | parity bit = %b |",in_seq,parityBit);

    $fclose(file_handle);
end

endmodule