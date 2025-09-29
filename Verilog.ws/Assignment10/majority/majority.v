module majority(
    output majo,
    input [2:0]in_seq
);

function major;
    input [2:0]in_seq;
    begin
    if(in_seq == 3'b110 | in_seq == 3'b011 | in_seq == 3'b111 | in_seq == 3'b101)
        major = 1'b1;

    else
        major = 1'b0;
    end

endfunction

assign majo = major(in_seq);

endmodule

