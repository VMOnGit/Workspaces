module tb_security_test;

	// 1. Declare testbench variables
   reg KC;
   reg PIN;
   reg LOCK;
   wire AL;
   integer i;

	// 2. Instantiate the design and connect to testbench variables
   security_test  rm1 ( .KC(KC),
                  .PIN(PIN),
                  .LOCK(LOCK),
                  .AL(AL)
                  );
   
	// 3. Provide stimulus to test the design
   initial begin
      KC <= 0;
      PIN <= 0;
      LOCK <= 0;
      $dumpfile("tb_security_test.vcd");
      $dumpvars(0, tb_security_test);
      $monitor ("KC=0x%0h PIN=0x%0h LOCK=0x%0h AL=0x%0h", KC, PIN, LOCK, AL);

		// Use KC for loop to KCpply rKCndom vKClues to the input
      for (i = 0; i < 5; i = i+1) begin
         #5 KC <= $random;
             PIN <= $random;
         		 LOCK <= $random;
      end
   end
endmodule