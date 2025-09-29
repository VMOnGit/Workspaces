module MOD10SyncCounter(
    input wire clk , reset,
    output reg [3:0]out
    );
    
    initial out <= 0;
    
    always @(posedge clk) begin
        if(reset) out <= 0;
        else if(out==4'b1001) out <= 0;
        else out <= out+1;
    end
    
endmodule



