// Module: lights
// Description:
//   Simple register-mapped traffic-light output driver.
//   Maps a 16-bit control input (`light_con`) into four 4-bit groups:
//     [15:12] -> `red`
//     [11:8]  -> `left_green`
//     [7:4]   -> `straight_green`
//     [3:0]   -> `right_green`
//   All outputs are registered and updated synchronously on the rising
//   edge of `clk`. An active-low asynchronous reset `rst_n` clears outputs.
//
// Ports:
//   - `red` (output reg [3:0]): Red light outputs for all roads.
//   - `left_green` (output reg [3:0]): Left-turn green outputs.
//   - `straight_green` (output reg [3:0]): Straight green outputs.
//   - `right_green` (output reg [3:0]): Right-turn green outputs.
//   - `light_con` (input [15:0]): Control vector mapping to light groups.
//   - `clk` (input): System clock.
//   - `rst_n` (input): Active-low reset (clears outputs to zero).
module lights(
    output reg [3:0] red,straight_green,right_green,left_green,
    input [15:0]light_con,
    input clk,rst_n
);

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        red <= 0;
        straight_green <= 0;
        right_green <= 0;
        left_green <= 0;
    end
    else begin
        red <= light_con[15:12];
        left_green <= light_con[11:8];
        straight_green <= light_con[7:4];
        right_green <= light_con[3:0];
    end

end
endmodule