module tb_Mod10SyncCounter();

    reg clk, reset;
    wire [3:0]out;
    integer file_handle;
    
    MOD10SyncCounter M (clk , reset , out);
    
    
    always #5 clk = ~clk;
    initial
        file_handle = $fopen("mod10count_output.txt","w");
    
    initial begin
        $fmonitor(file_handle,"| Out = %h \t | Reset = %b |\t" , out , reset);
        clk = 0;
        reset = 0;
        #130;
        reset = 1;
        #10;
        reset = 0;
        #100;
        $fclose(file_handle);
        $finish;
    end
    
    
endmodule