`timescale 1ps/1ps
module JKFLL_tb;

wire q, qbar;
reg j, k, clk;
integer file_handle;

JKFLL jkfll(q, qbar, j, k, clk);

initial begin
    clk = 1'b0;
    j = 1'b0;
    k = 1'b0;
    file_handle = $fopen("JKLL_output.txt","w");
    
    
end

always begin clk = ~clk; #10; end
always begin j = ~j; #10;end
always begin k = ~k; #15;end
   

initial begin
    $fmonitor(file_handle,"| Time = %0t | CLK : %b | J : %b | K : %b | Q : %b | Q_bar : %b |",
    $time, clk, j, k, q, qbar);

    #500;
    $fclose(file_handle);
    $finish; 
end

endmodule
