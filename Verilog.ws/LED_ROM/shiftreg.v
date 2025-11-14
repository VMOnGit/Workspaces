module shiftreg(
    output reg [15:0] q,
    input wire clk,
    input wire rst,
    input wire mode,
    input wire [15:0] din,
    input wire load_en,
    input wire shift_en
);


always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 16'b0000_0000_0000_0001; // Initialize with the first bit set
    end else if(load_en)begin
        q <= din;
    end    
    else if (shift_en) begin
        if (mode) begin
            // Shift left
            q <= {q[14:0], q[15]};
        end else begin
            // Shift right
            q <= {q[0], q[15:1]};
        end
    end else begin
        q <= q;
    end
end

endmodule