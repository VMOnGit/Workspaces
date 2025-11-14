`timescale 1ns/1ps
   // fifo8x32
    // Simple parameterized FIFO (data width and depth configurable)
    // - DWIDTH: width of each data word
    // - DEPTH: number of entries in the FIFO
    // Ports:
    //  - din      : input data to be written
    //  - wr_en    : write enable (when asserted and FIFO not full, write occurs)
    //  - rd_en    : read enable (when asserted and FIFO not empty, read occurs)
    //  - dout     : output data read from FIFO
    //  - full/empty: status flags
    //  - clk, rst_n: clock and active-low reset
    // Note: This file contains comments indicating some potential issues found in the original source
    // (left intentionally unchanged to preserve original behavior). See inline notes.

    module fifo8x32#(parameter DWIDTH = 8,DEPTH=8)(
        output reg [DWIDTH-1:0]dout,
        output reg full,empty,
        input [DWIDTH-1:0]din,
        input wr_en,rd_en,clk,rst_n
    );

    // rd_ptr, wr_ptr: read and write pointers (index into the memory array)
    // counter: number of valid entries currently stored in the FIFO
    reg[DEPTH-1:0]rd_ptr,wr_ptr,counter;

    // The memory array for the FIFO
    reg[DWIDTH-1:0] fifo[DEPTH-1:0];

    // -----------------------------------------------------------------------------
    // Write Block
    // - On reset: initialize flags and pointers
    // - If FIFO is full and a read occurs (rd_en), clear the full flag
    // - If write enabled and not full: store 'din' at write pointer and increment pointer
    // -----------------------------------------------------------------------------
    always@(posedge clk or negedge rst_n)begin//Write Block

        if(!rst_n)begin
            full <= 0;
            wr_ptr <= 0;
        end
        else if(full & rd_en)begin
            // When FIFO was full and a read happens, clear full flag
            full <= 0;
        end
        else begin
            if(counter == DEPTH)begin
                // When counter equals DEPTH, FIFO should be considered full
                full <= 1;
            end
            else if(wr_en & !full)begin
                // Perform write: store data and increment write pointer
                fifo[wr_ptr] <= din;
                wr_ptr <= wr_ptr+1;
            end else begin
                // No write: retain pointer value
                wr_ptr<=wr_ptr;
            end
        end

    end

    // -----------------------------------------------------------------------------
    // Read Block
    // - On reset: initialize empty flag and read pointer
    // - If FIFO is empty and a write happens (wr_en), clear empty flag
    // - If read enabled and not empty: output data from read pointer and increment
    // -----------------------------------------------------------------------------
    always@(posedge clk or negedge rst_n)begin//Read Block

        if(!rst_n)begin
            empty <= 0;
            rd_ptr <= 0;
        end
        else if(empty & wr_en)
                // A write when FIFO was empty will clear the empty flag
                empty <= 0;
        else begin
            if(counter == 0)begin
                // No valid entries: FIFO empty
                empty<=1;
            end 
            else if(rd_en & !empty)begin
                // Perform read: present data at dout and increment read pointer
                dout <= fifo[rd_ptr];
                rd_ptr <= rd_ptr+1;
            end 
            else begin
                rd_ptr<=rd_ptr;
            end
        end
    end

    // -----------------------------------------------------------------------------
    // Counter Block
    // - Tracks number of valid entries in the FIFO
    // - Increment on successful write, decrement on successful read
    // -----------------------------------------------------------------------------
    always@(posedge clk or negedge rst_n)begin//Counter Block
        if(!rst_n)begin
            counter <= 0;
        end
        else begin
            if(wr_en && !full)begin
                
                counter <= counter + 1;
            end
            else if(rd_en & !empty)begin
                counter <= counter - 1;
            end
            else begin
                counter <= counter;
            end
        end
    end
    endmodule