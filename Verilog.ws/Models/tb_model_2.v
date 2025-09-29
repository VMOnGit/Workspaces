module tb_traffic_controller;

    // 1. Declare testbench variables
   reg cur_state;
   reg prev_state;
   wire [2:0] next_state;
   integer i;

    // 2. Instantiate the design and connect to testbench variables
   traffic_controller  rm1 ( .cur_state(cur_state),
                  .prev_state(prev_state),
                  .next_state(next_state)
                  );
   
    // 3. Provide stimulus to test the design
   initial begin
      cur_state <= 0;
      prev_state <= 0;
      $dumpfile("tb_traffic_controller.vcd");
      $dumpvars(0, tb_traffic_controller);
      $monitor ("cur_state=0x%0h prev_state=0x%0h next_state=0x%0h", cur_state, prev_state, next_state);

        // Use cur_state for loop to apply random values to the input
      for (i = 0; i < 5; i = i+1) begin
         #5 cur_state <= $random;
             prev_state <= $random;
      end
   end

endmodule