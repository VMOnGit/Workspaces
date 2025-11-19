module MUX41
(
    input [7:0]I1, I2, I3,  
    input [15:0]I4,
    input enable,clk,
    input [1:0]sel,
    output reg [15:0]out
);

reg [7:0]ir1, ir2, ir3;
reg[15:0] ir4;
reg[1:0] selReg;


always @(posedge clk ) begin

    ir1 <= I1;
    ir2 <= I2;
    ir3 <= I3;
    ir4 <= I4;
    selReg <= sel;
    
end


always @(posedge clk) begin
    if (enable == 1'b1)
    begin
        


      case (selReg)

        2'b00 : out <= ir1;
        2'b01 : out <= ir2;
        2'b10 : out <= ir3;
        2'b11 : out <= ir4; 
        default:  out <= 1'bz;
      endcase
    end

    else 
        out <= 16'bz;
end

endmodule