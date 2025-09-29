module SyncUpDownCounter4Bit(
    input wire clk , reset , up_downbar,
    output reg [3:0]out
    );
    
    
    initial out <= 0;
    
    always @(posedge clk) begin
        if(reset) out <= 0;
        else begin
            if(up_downbar) out <= out+1;
            else out <= out-1;
        end
    end
    
    
endmodule
