module JohnsonCounter8Bit(
    input wire clk , reset,
    output reg [7:0]out 
    );
    
    initial out <= 0;
    
    always @(posedge clk) begin
        if(reset) out <= 0;
        else begin
            out[7] <= ~out[0];
            out[6] <= out[7];
            out[5] <= out[6];
            out[4] <= out[5];
            out[3] <= out[4];
            out[2] <= out[3];
            out[1] <= out[2];
            out[0] <= out[1];
        end
    end
    
endmodule



