`timescale 1ns / 1ps

module tb_JohnsonCounter8Bit();

    reg clk , reset;
    wire [7:0]out;
    integer file_handle;
    
    JohnsonCounter8Bit JHC (clk , reset , out);
    
    always #5 clk = ~clk;
    initial
        file_handle = $fopen("JohnsonCounter8bit_output.txt","w");
    initial begin
        $fmonitor(file_handle,"| Out = %b%b%b%b%b%b%b%b |\t| reset = %b |" , out[7] , out[6] , out[5] , out[4] , out[3] , out[2] , out[1] , out[0] , reset);
        clk = 0;
        reset = 0;
        #190;
        reset = 1;
        #10;
        reset = 0;
        #30
        $fclose(file_handle);
        $finish;
    end
    
    

endmodule