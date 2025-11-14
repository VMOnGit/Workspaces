// Module: timer
// Description:
//   Simple down/up counter-based timer that asserts `ch_tick` when the
//   configured maximum count is reached while `start_tick` is high.
//
// Behavior:
//   - When `start_tick` is low the internal counter and `ch_tick` are reset.
//   - When `start_tick` is high the counter increments on each `clk`.
//   - When the counter reaches `MAX_COUNT` it resets to 0 and pulses `ch_tick`.
//
// Ports:
//   - `ch_tick` (output reg): One-clock pulse when the timer completes.
//   - `start_tick` (input): Enable for counting (active high).
//   - `clk` (input): System clock.
//   - `rst_n` (input): Active-low reset.
module timer(
    output reg ch_tick,
    input start_tick,clk,rst_n
);

localparam MAX_COUNT = 599_999;
reg [20:0]counter;

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        counter <= 0;
        ch_tick <= 0;
    end
    else begin
        if(!start_tick)begin
            counter <= 0;
            ch_tick <= 0;
        end
        else begin
            if(counter == MAX_COUNT)begin
                counter <= 0;
                ch_tick <= 1;
            end
            else begin
                counter <= counter + 1;
                ch_tick <= 0;
            end
        end
    end    
end
endmodule