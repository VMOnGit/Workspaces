`timescale 1ns/1ps

// consumer.v
// Consumer FSM that issues read requests to the FIFO and captures read data.
// Behavior summary:
// - Maintains an internal clock-edge counter like the producer
// - When FIFO is not empty, it may perform bursts of reads:
//     * WRITE3: perform 3 consecutive reads when counter % 3 == 0
//     * WRITE5: perform 5 consecutive reads when counter % 5 == 0
// - Ports:
//   - rd_en (output reg): asserted to request a read from the FIFO
//   - dout  (input): data coming from the FIFO
//   - clk, rst_n, empty: clock, reset and FIFO empty indicator

module consumer#(parameter DWIDTH = 8,DEPTH=8)(
    output reg rd_en,
    input clk,empty,rst_n,
    input [DWIDTH-1:0]dout
);

integer i;
localparam CHECK = 2'b00,WRITE5 = 2'b01,IDLE = 2'b10,WRITE3 = 2'b11;
reg [1:0]state;
reg[2:0]counter_5;
reg[DWIDTH-1:0]counter,cons;

// -----------------------------------------------------------------------------
// Main FSM: decides when to assert rd_en and captures data into 'cons'
// - IDLE: default state, clears outputs and moves to CHECK
// - CHECK: if FIFO is empty, remain idle; otherwise, allow read and decide
//   which burst size to perform based on the edge counter
// - WRITE5 / WRITE3: perform the specified number of reads, capture 'dout'
// -----------------------------------------------------------------------------
always@(posedge(clk) or negedge(rst_n))begin
    if(!rst_n)begin
        state <= IDLE; 
        counter_5 <= 0;
    end
    else begin
        case(state)
            IDLE:begin
                rd_en <= 0;
                cons <= 0;
                state <= CHECK;
                counter_5 <= 0;
            end
            CHECK:begin
                if(empty)
                    // Nothing to read
                    state <= IDLE;
                else
                    // Allow read and pick a burst length based on 'counter'
                    rd_en <= 1;
                    if(counter%3 == 0)//checking if number of clock edges is divisble by 3 for 3 consecutive writes
                        state <= WRITE3;
                    else if(counter%5 == 0)//checking if number of clock edges is divisble by 5 for 5 consecutive writes
                        state <= WRITE5;
                    else
                        state <=IDLE;
            end
            WRITE5:begin //5 consecutive reads
                if(counter_5 == 5)begin                
                    state <= IDLE;
                end
                else begin
                    // Capture the data presented by the FIFO
                    counter_5 <= counter_5 + 1;
                    cons <= dout;
                    state <= WRITE5;
                end
            end
            WRITE3:begin //3 consecutive reads
                if(counter_5 == 3)begin                
                    state <= IDLE;
                end
                else begin
                    counter_5 <= counter_5 + 1;
                    cons <= dout;
                    state <= WRITE3;
                end
            end
        endcase     
    end
end

// -----------------------------------------------------------------------------
// Edge counter: increments every clock cycle (used to trigger read bursts)
// -----------------------------------------------------------------------------
always@(posedge(clk) or negedge(rst_n))begin//Counting clock edges
    if(!rst_n)
        counter <= 0;
    else
        counter <= counter + 1;
end

endmodule