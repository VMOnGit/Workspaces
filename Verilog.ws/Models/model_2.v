module traffic_controller(input cur_state, input prev_state, output reg [2:0] next_state);
/* 01 - G-Y
   10 - Y-G
   11 - Y-R
   00 - R-G
*/

always @(cur_state or prev_state) begin
    case ({cur_state, prev_state})
        2'b00: next_state <= 2'b01; // R-G to Y-G
        2'b01: next_state <= 2'b10; // Y-G to R-G
        2'b10: next_state <= 2'b11; // G-Y to Y-G
        2'b11: next_state <= 2'b00; // Y-R to R-G
        default: next_state <= 2'b00;
    endcase
end
endmodule