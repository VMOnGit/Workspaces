module tb_jk;
   reg j;
   reg k;
   reg clk;

   jk_ff    jk0 ( .j(j),
                  .k(k),
                  .clk(clk),
                  .q(q));
    always #5 clk <= ~clk;
    initial begin
        clk <= 0; // Initialize clk
        $dumpfile("my_waveform.vcd"); // or "my_waveform.fst" for FST format
        $dumpvars(0, tb_jk);
        j <= 0;
        k <= 0;

        #5 j <= 0;
            k <= 1;
        #20 j <= 1;
            k <= 0;
        #20 j <= 1;
            k <= 1;
        #20 $finish;
    end

   initial
      $monitor ("j=%0d k=%0d q=%0d", j, k, q);
endmodule