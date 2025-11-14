// Module: light_cont
// Description:
//   State machine that sequences traffic lights across four roads.
//   It drives a 16-bit packed `light_con` vector which is consumed by the
//   `lights` module. The controller asserts `count30` while a 30s timer
//   should run; the timer produces `done30` (wired into this module) which
//   causes the state machine to advance.
//
// Bit packing (in `light_con`):
//   [15:12] = red
//   [11:8]  = left_green
//   [7:4]   = straight_green
//   [3:0]   = right_green
//
// Ports:
//   - `light_con` (output reg [15:0]): Packed light control vector.
//   - `clk` (input): System clock.
//   - `rst_n` (input): Active-low reset.
module light_cont(
    output reg [15:0] light_con,
    input clk,rst_n
);
/*
red <= light_con[15:12]
left_green <= light_con[11:8]
straight_green <= light_con[7:4]
right_green <= light_con[3:0]
*/

wire done30;
reg count30;
reg [1:0]ROAD;

localparam R1 = 2'b00,R2 = 2'b01,R3 = 2'b10,R4 = 2'b11;//Whichever has greens will be the state
localparam R1G = 16'b0111_1000_1000_0000,R2G = 16'b1011_0100_0100_0100,R3G = 16'b1101_0010_0010_0010,R4G = 16'b1110_0001_0001_0001;

//Instatiate the timer and lights
timer t1(done30,count30,clk,rst_n);


//Block changes whichever road has greens based on a timer
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        count30 <= 0;
        light_con <= 0;
        ROAD = R1;
    end
    else begin
        case (ROAD)
            R1:begin
                light_con <= R1G;
                count30 <= 1;
                if(done30)begin
                    ROAD <= R2;
                    count30 <= 0;
                end
            end
            R2:begin
                light_con <= R2G;
                count30 <= 1;
                if(done30)begin
                    ROAD <= R3;
                    count30 <= 0;
                end
            end
            R3:begin
                light_con <= R3G;
                count30 <= 1;
                if(done30)begin
                    ROAD <= R4;
                    count30 <= 0;
                end
            end
            R4:begin
                light_con <= R4G;
                count30 <= 1;
                if(done30)begin
                    ROAD <= R1;
                    count30 <= 0;
                end
            end
        endcase
    end
end

endmodule