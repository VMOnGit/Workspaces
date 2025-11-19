module GrayCodeCounter(
    input wire clk , reset,
    output reg [3:0]out
    );
    
    reg [3:0]count;
    
    initial begin
        count <= 0;
        out <= 0;
    end
    
    always @(posedge clk) begin
        if(reset) begin
            out <= 0;
            count <= 0;
        end
        else begin
            out[3] <= count[3];
            out[2] <= count[3]^count[2];
            out[1] <= count[2]^count[1];
            out[0] <= count[1]^count[0];
            count <= count+1;
        end
    end
    
endmodule



