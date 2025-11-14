module led_contr(
    output reg [15:0] led,
    input wire clk,
    input wire rst,
    input wire mode,
    input wire load_en,
    input wire [3:0] addr,
    input wire [1:0] speed
);

wire [15:0]led_temp_rom_out,led_temp_shifter_out;
reg [15:0] led_temp;
wire time_done;
reg count_en,shift_en;

shiftreg sr1(
    .q(led_temp_shifter_out),
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .din(led_temp_rom_out),
    .load_en(load_en),
    .shift_en(shift_en)
);

timer tim1(
    .done(time_done),
    .clk(clk),
    .rst(rst),
    .count_en(count_en),
    .speed(speed)

);

rom_16x4 rom1(
    .q(led_temp_rom_out),
    .addr(addr),
    .clk(clk)
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        led <= 16'b0000_0000_0000_0001; // Initialize with the first LED on
        shift_en <= 1'b0;
        count_en <= 1'b0;       
    end else begin
        count_en <= 1'b1;
        led <= led_temp_shifter_out;
        if(time_done) begin
            shift_en <= 1'b1;
            count_en <= 1'b0;
        end else begin
            shift_en <= 1'b0;
        end
    end
end
endmodule