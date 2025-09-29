module evenParity(
    output parityBit,parityBit1,
    input [3:0]in1
);

function parityCheck;
input [3:0]in;
reg [3:0]digitSum;

begin
    digitSum = in[3]+in[2]+in[1]+in[0];
    if(digitSum[0]==0)
        parityCheck = 1;
    else
        parityCheck =0;
end

endfunction

assign parityBit = parityCheck(in1);
assign parityBit1 = parityCheck(in1);

endmodule