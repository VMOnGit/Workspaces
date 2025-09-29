module demux18(
    output reg [7:0]out,
    input wire in,
    input [2:0]sel
    );

    always@(sel[0] or sel[1] or sel[2])begin
        case(sel)
        3'b000:out[0]= in;
        3'b001:out[1]= in;
        3'b010:out[2]= in;
        3'b011:out[3]= in;
        3'b100:out[4]= in;
        3'b101:out[5]= in;
        3'b110:out[6]= in;
        3'b111:out[7]= in;
        default: out = 8'h00; 
        endcase
    end
endmodule

