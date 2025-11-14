`timescale 1ns/1ps

module producer#(parameter DWIDTH = 8,DEPTH=8)(
    output reg [DWIDTH-1:0]din,
    output reg wr_en,
    input clk,full,rst_n
);




integer i;
localparam CHECK = 2'b00,WRITE5 = 2'b01,IDLE = 2'b10,WRITE3 = 2'b11;
reg [1:0]state;
reg[2:0]counter_5;
reg[DWIDTH-1:0]counter;

always@(posedge(clk) or negedge(rst_n))begin
    if(!rst_n)begin
        state <= IDLE; 
        counter_5 <= 0;
    end
    else begin
        `timescale 1ns/1ps

        // producer.v
        // Producer FSM that generates data and write requests to the FIFO.
        // Behavior summary:
        // - Maintains an internal clock-edge counter.
        // - On certain counts, enters a state to perform consecutive writes:
        //     * WRITE3: perform 3 consecutive writes when counter % 3 == 0
        //     * WRITE5: perform 5 consecutive writes when counter % 5 == 0
        // - Honors the 'full' input: does not write when FIFO is full
        // Ports:
        // - din  (output reg): data produced onto the FIFO input
        // - wr_en(output reg): asserted while producing write bursts
        // - clk, rst_n, full: clock, active-low reset, and FIFO full indicator

        module producer#(parameter DWIDTH = 8,DEPTH=8)(
            output reg [DWIDTH-1:0]din,
            output reg wr_en,
            input clk,full,rst_n
        );

        // integer for potential loops (not used in FSM logic but left present)
        integer i;

        // State encoding
        localparam CHECK = 2'b00,WRITE5 = 2'b01,IDLE = 2'b10,WRITE3 = 2'b11;
        reg [1:0]state;

        // counter_5: tracks the number of writes performed in a WRITE3/WRITE5 burst
        reg[2:0]counter_5;

        // counter: counts clock edges to decide when to enter write bursts
        reg[DWIDTH-1:0]counter;

        // -----------------------------------------------------------------------------
        // Main FSM: decides when to assert wr_en and what data to drive on 'din'
        // - IDLE: default state, clears outputs and moves to CHECK
        // - CHECK: if FIFO is full, stay idle; otherwise check the edge counter to
        //   determine whether to do a 3-write or 5-write burst.
        // - WRITE5 / WRITE3: produce the specified number of writes, setting 'din'
        //   using a simple arithmetic progression (counter_5 * 3 or *5)
        // -----------------------------------------------------------------------------
        always@(posedge(clk) or negedge(rst_n))begin
            if(!rst_n)begin
                state <= IDLE; 
                counter_5 <= 0;
            end
            else begin
                case(state)
                    IDLE:begin
                        // Drive outputs to safe defaults
                        wr_en <= 0;
                        din <= 0;
                        state <= CHECK;
                        counter_5 <= 0;
                    end
                    CHECK:begin
                        // If FIFO is full we do not attempt writes
                        if(full)
                            state <= IDLE;
                        else
                            // Give wr_en permission in CHECK (FSM will assert it in write states)
                            wr_en <= 1;
                            // Decide which burst to perform based on the edge counter
                            if(counter%3 == 0)//checking if number of clock edges is divisble by 3 for 3 consecutive writes
                                state <= WRITE3;
                            else if(counter%5 == 0)//checking if number of clock edges is divisble by 5 for 5 consecutive writes
                                state <= WRITE5;
                            else
                                state <=IDLE;
                    end
                    WRITE5:begin //5 consecutive writes
                        if(counter_5 == 5)begin                
                            // Finished burst
                            state <= IDLE;
                        end
                        else begin
                            // Assert write enable and present data
                            counter_5 <= counter_5 + 1;
                            din <= counter_5*3;
                            state <= WRITE5;
                        end
                    end
                    WRITE3:begin //3 consecutive writes
                        if(counter_5 == 3)begin                
                            state <= IDLE;
                        end
                        else begin
                            counter_5 <= counter_5 + 1;
                            din <= counter_5*5;
                            state <= WRITE3;
                        end
                    end
                endcase     
            end
        end

        // -----------------------------------------------------------------------------
        // Edge counter: increments every clock cycle (used to trigger write bursts)
        // -----------------------------------------------------------------------------
        always@(posedge(clk) or negedge(rst_n))begin//Counting clock edges
            if(!rst_n)
                counter <= 0;
            else
                counter <= counter + 1;
        end
        endmodule