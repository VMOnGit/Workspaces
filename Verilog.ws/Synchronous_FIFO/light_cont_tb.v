`timescale 1ns/1ps

module light_cont_tb;
    // Signals declaration
    reg clk;
    reg rst_n;
    reg done30;
    wire [15:0] light_con;
    wire count30;

    // Instantiate the light controller module
    light_cont uut (
        .light_con(light_con),
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test stimulus
    initial begin
        // Initialize waveform dump
        $dumpfile("light_cont_tb.vcd");
        $dumpvars(0, light_cont_tb);

        // Initialize signals
        rst_n = 1;
        done30 = 0;
        
        // Test 1: Reset test
        #10 rst_n = 0;
        #10 rst_n = 1;
        
        

        // Run for a few more cycles
        #100;

        // End simulation
        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t rst_n=%b done30=%b count30=%b light_con=%h",
                 $time, rst_n, done30, count30, light_con);
    end

endmodule