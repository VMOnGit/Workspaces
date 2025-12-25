// File: lfsr_if.sv
interface lfsr_if #(parameter int REG_WIDTH = 8) (input logic clock);
    
    // Signals matching the DUT ports
    logic                   reset_n;
    logic                   load_en;
    logic                   shift_en;
    logic   load_seq;
    logic   out_seq;
    logic                   lock_out_flag;

    // Clocking block for Testbench Driver/Monitor to ensure race-free timing
    // Sample inputs #1step before clock, drive outputs #1ns after clock
    clocking cb @(posedge clock);
        default input #1step output #1ns;
        
        output reset_n;
        output load_en;
        output shift_en;
        output load_seq;
        
        input  out_seq;
        input  lock_out_flag;
    endclocking

    // Modport for Testbench Driver
    modport tb (
        clocking cb
    );

    // Modport for Monitor 
    modport mon (
        clocking cb
    );

endinterface
