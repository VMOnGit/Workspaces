
module counter(
    output reg done,
    output reg [31:0]count,
    input [7:0] write_data,
    input [7:0] write_address,
    input increment,write_enable,clk,rst
);

reg [31:0]max_count = 0;

always@(posedge clk or posedge rst)begin
    if(rst)begin
        done <= 0;
       
    end
    else begin
        if(write_enable)begin
            case (write_address)
                8'b0000_0100   :   begin
                        max_count[31:24] <= write_data; 
                        count <= 0;
                        done <= 0;
                end 
                8'b0000_0101   :   begin
                        max_count[23:16] <= write_data; 
                end
                8'b0000_0110   :   begin
                        max_count[15:8] <= write_data; 
                end
                8'b0000_0111   :   begin
                        max_count[7:0] <= write_data; 
                end
                default: max_count <= max_count;
            endcase
        end
        else if(increment) begin
            if (count == max_count)begin
                done <= 1;
                count <= 0;
            end
            else begin
                count <= count + 1'b1;
            end
        end
        else begin
            count <= count;
        end
    end
end

endmodule

