`timescale 1ns / 1ps

module tb_SyncUpDownCounter4Bit();

    reg clk , reset , up_downbar;
    wire [3:0]out;
    integer file_handle;
    
    SyncUpDownCounter4Bit SYNC (clk , reset , up_downbar , out);
    
    always #5 clk = ~clk;
    initial
        file_handle = $fopen("updown4bit_output.txt","w");
        
        
    initial begin
        $fmonitor(file_handle,"| Count = %h |\t| Up/Down_bar = %b |\t| Reset = %b |\t" , out , up_downbar , reset);
        clk = 0;
        up_downbar = 1;
        reset = 0;
        #140;
        up_downbar = 0;
        #40;
        reset = 1;
        #10;
        reset = 0;
        #60;
        
        $fclose(file_handle);
        $finish;
    end

endmodule