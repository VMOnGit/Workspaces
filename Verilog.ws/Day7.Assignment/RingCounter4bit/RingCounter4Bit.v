module Ring_Counter4Bit(
    input clk , reset,
    output reg [3:0] out
    );
    
    
    initial out <= 4'b0001;
    
    always @(posedge clk) begin
        if(reset) out <= 4'b0001;
        else begin
            out[1] <= out[0];
            out[2] <= out[1];
            out[3] <= out[2];
            out[0] <= out[3];
        end
    end
    
endmodule

