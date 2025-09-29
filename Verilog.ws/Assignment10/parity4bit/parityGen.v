module parityGen(
    output reg parityBit,
    input [3:0]in_seq
);

task pg(output pb, input [3:0] seq);
    begin
        pb = ((seq[3]^seq[2])^seq[1])^seq[0];
    end
endtask
always @(*)begin
pg (parityBit, in_seq);
end
endmodule
module parityGen_tb;
wire op;
reg [3:0]in_seq;
integer i,file_handle;

parityGen pg(op,in_seq);

initial begin
    file_handle = $fopen("parityGen_output.txt","w");
    //$monitor(op,in_seq);
    for(i = 0;i<16;i=i+1)begin
            in_seq = i;#10; 
            $fdisplay(file_handle,"| parity bit = %b | input sequence = %b |",op,in_seq);
    end
    $fclose(file_handle);
end

endmodule