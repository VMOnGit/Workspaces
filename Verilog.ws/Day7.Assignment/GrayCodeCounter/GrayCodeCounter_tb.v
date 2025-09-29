module tb_GrayCodeCounter();

    reg clk , reset;
    wire [3:0]out;
    integer file_handle;
    GrayCodeCounter GCC (clk , reset , out);
    
    always #5 clk = ~clk;
    initial
        file_handle = $fopen("GrayCodeCounter_output.txt","w");
        
    initial begin
        $fmonitor(file_handle,"| Out = %b%b%b%b |\t| Reset = %b |\t" , out[3] , out[2] , out[1] , out[0] , reset);
        clk = 0;
        reset = 0;
        
        #160;
        
        reset = 1;
        #10;
        reset = 0;
        #40;
        
        $fclose(file_handle);
        $finish;
    end

endmodule