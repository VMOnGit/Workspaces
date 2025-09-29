`timescale 1ns / 1ps

module tb_Ring_Counter4Bit();

    reg clk , reset;
    wire [3:0]out;
    integer file_handle;

    Ring_Counter4Bit RC (clk , reset , out);
    
    always #5 clk = ~clk;
    initial 
        file_handle = $fopen("RingCounter4bit_output.txt","w");
    
    initial begin
        $fmonitor(file_handle,"| Out = %b%b%b%b | \t| reset = %b |\t" , out[3] , out[2] , out[1] , out[0] , reset);
        reset = 0;
        clk = 0;
        #50;
        reset = 1;
        #10;
        reset = 0;
        #50;
        $fclose(file_handle);
        $finish;
    end

endmodule
