// File: top.sv
`include "includes.sv"
`include "LFSR.sv"
module top;
    
    // Parameters matching your RTL
    parameter REG_WIDTH = 8;
    parameter TAP_LOC   = 4;

    logic clock;
    
    // Clock Generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    // Interface
    lfsr_if #(REG_WIDTH) intf(clock);

    // DUT Instance
    LFSR #(
       .REG_WIDTH(REG_WIDTH),
       .TAP_LOC(TAP_LOC)
    ) dut (
       .clock(intf.clock),
       .reset_n(intf.reset_n),
       .load_en(intf.load_en),
       .shift_en(intf.shift_en),
       .load_seq(intf.load_seq),
       .out_seq(intf.out_seq),
       .lock_out_flag(intf.lock_out_flag)
    );

    environment #(REG_WIDTH, TAP_LOC) env;

    initial begin
        env = new(intf);
        env.run();
    end

endmodule
