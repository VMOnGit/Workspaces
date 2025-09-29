module ODDEVEN #(parameter N=8)(
    output reg out,
    input [N-1:0]in
);
    task  OE(output OddEve , input [N-1:0]in);
        begin
            if(in[0]==1'b1)
                OddEve=1;
            else
                OddEve=0;
        end
    endtask
always @(*)begin
    OE(out,in);
end
endmodule