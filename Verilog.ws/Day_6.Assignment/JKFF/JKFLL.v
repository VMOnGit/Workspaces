module JKFLL(
    output reg q,
    output wire qbar,
    input wire j,k,clk
); 

always @(posedge clk)
begin
    case({j,k})
        2'b00:q<=q;
        2'b01:q<=0;
        2'b10:q<=1;
        2'b11:q<=~q;
        //default: q<=~q;
    endcase 
   
end

assign qbar=~q;

endmodule
