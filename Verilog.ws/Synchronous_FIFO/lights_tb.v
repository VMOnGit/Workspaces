module lights_tb;
    // Signals declaration
    reg clk;
    reg rst_n;
    reg [15:0] light_con;
    wire [3:0] red, straight_green, right_green, left_green;

    // Instantiate the lights module
    lights uut (
        .red(red),
        .straight_green(straight_green),
        .right_green(right_green),
        .left_green(left_green),
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
        $dumpfile("lights_tb.vcd");
        $dumpvars(0, lights_tb);

        // Initialize signals
        rst_n = 1;
        light_con = 16'h0000;
        
        // Test 1: Reset test
        #10 rst_n = 0;
        #10 rst_n = 1;
        
        // Test 2: All lights off
        #10 light_con = 16'h0000;
        
        // Test 3: All reds on
        #10 light_con = 16'hF000;
        
        // Test 4: All left green on
        #10 light_con = 16'h0F00;
        
        // Test 5: All straight green on
        #10 light_con = 16'h00F0;
        
        // Test 6: All right green on
        #10 light_con = 16'h000F;
        
        // Test 7: Mixed pattern
        #10 light_con = 16'hA5A5;
        
        // Test 8: Another mixed pattern
        #10 light_con = 16'h5A5A;

        // End simulation
        #10 $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t rst_n=%b light_con=%h red=%h left=%h straight=%h right=%h",
                 $time, rst_n, light_con, red, left_green, straight_green, right_green);
    end

endmodule