`timescale 1ns/1ps
`include "producer.v"

// producer_tb.v
// Testbench for the `producer` module.
// - Generates clock and reset
// - Toggles the 'full' input to exercise behavior when FIFO is full/available
// - Observes producer FSM state and validates basic invariants

module producer_tb();

// Parameters
parameter DWIDTH = 8;
parameter DEPTH = 8;
parameter CLK_PERIOD = 10; // 10ns clock period (100MHz)

// Signals
reg clk;
reg rst_n;
reg full;
wire [DWIDTH-1:0] din;
wire wr_en;

// Instantiate producer module
producer #(
    .DWIDTH(DWIDTH),
    .DEPTH(DEPTH)
) producer_inst (
    .clk(clk),
    .rst_n(rst_n),
    .full(full),
    .din(din),
    .wr_en(wr_en)
);

// Clock generation
always begin
    clk = 1'b0;
    #(CLK_PERIOD/2);
    clk = 1'b1;
    #(CLK_PERIOD/2);
end

// Test stimulus
initial begin
    // Initialize signals
    rst_n = 1'b1;
    full = 1'b0;
    
    // Apply reset
    #(CLK_PERIOD*2);
    rst_n = 1'b0;
    #(CLK_PERIOD*2);
    rst_n = 1'b1;
    
    // Test case 1: Normal operation (let it run for a while to see both WRITE3 and WRITE5 cases)
    #(CLK_PERIOD*20);
    
    // Test case 2: Test full condition
    full = 1'b1;
    #(CLK_PERIOD*10);
    full = 1'b0;
    
    // Test case 3: Continue normal operation
    #(CLK_PERIOD*30);
    
    // Test case 4: Reset during operation
    rst_n = 1'b0;
    #(CLK_PERIOD*2);
    rst_n = 1'b1;
    
    // Test case 5: Final operation period
    #(CLK_PERIOD*20);
    
    // End simulation
    $display("Simulation completed");
    $finish;
end

// Monitor state changes and outputs
initial begin
    $monitor("Time=%0t rst_n=%b full=%b wr_en=%b din=%h state=%s", 
             $time, rst_n, full, wr_en, din,
             producer_inst.state == producer_inst.IDLE ? "IDLE" :
             producer_inst.state == producer_inst.CHECK ? "CHECK" :
             producer_inst.state == producer_inst.WRITE5 ? "WRITE5" :
             producer_inst.state == producer_inst.WRITE3 ? "WRITE3" : "UNKNOWN");
end

// Additional checks and verification
always @(posedge clk) begin
    // Verify that wr_en is never active when full is asserted
    if (full && wr_en) begin
        $display("Error at time %0t: wr_en is active while full is asserted!", $time);
        $stop;
    end
    
    // Monitor consecutive writes
    if (producer_inst.state == producer_inst.WRITE5) begin
        if (producer_inst.counter_5 > 5) begin
            $display("Error at time %0t: WRITE5 counter exceeded 5!", $time);
            $stop;
        end
    end
    if (producer_inst.state == producer_inst.WRITE3) begin
        if (producer_inst.counter_5 > 3) begin
            $display("Error at time %0t: WRITE3 counter exceeded 3!", $time);
            $stop;
        end
    end
end

endmodule