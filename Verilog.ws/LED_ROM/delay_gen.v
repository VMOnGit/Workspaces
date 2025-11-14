module timer(
    output reg done,
    input wire clk,
    input wire rst,
    input wire count_en,
    input wire [1:0] speed
);

parameter speed_0 = 0_000_000;
parameter speed_1 = 9_999_999;
parameter speed_2 = 19_999_999;
parameter speed_3 = 29_999_999;
parameter speed_4 = 39_999_999;

reg [30:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 31'd0;
        done <= 1'b0;
    end else if (count_en) begin
        case (speed)
            2'b00: begin
                if (count == speed_1) begin
                    done <= 1'b1;
                    count <= 31'd0;                                  
                end else begin
                    count <= count + 1;
                    done <= 1'b0;
                end
            end
            2'b01: begin
                if (count == speed_2) begin
                    done <= 1'b1;
                    count <= 31'd0;
                end else begin
                    count <= count + 1;
                    done <= 1'b0;
                end
            end
            2'b10: begin
                if (count == speed_3) begin
                    done <= 1'b1;
                    count <= 31'd0;
                end else begin
                    count <= count + 1;
                    done <= 1'b0;
                end
            end
            2'b11: begin
                if (count == speed_4) begin
                    done <= 1'b1;
                    count <= 31'd0;
                end else begin
                    count <= count + 1;
                    done <= 1'b0;
                end
            end
            default: begin
                count <= 31'd0;
                done <= 1'b0;
            end
        endcase
    end
end

endmodule