module majority(
    output reg   majo,
    input [2:0]in_seq
);

task majori(output major, input [2:0]in_seq );
    begin
    if(in_seq == 3'b110 | in_seq == 3'b011 | in_seq == 3'b111 | in_seq == 3'b101)
        major = 1'b1;
    else
        major = 1'b0;
    end
endtask

always @(*)begin
 majori(majo,in_seq);
end
endmodule