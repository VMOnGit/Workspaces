// File: environment.sv
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment #(parameter int REG_WIDTH = 8, parameter int TAP_LOC = 4);
    
    // Components
    generator                       gen;
    driver      #(REG_WIDTH)        drv;
    monitor     #(REG_WIDTH)        mon;
    scoreboard  #(REG_WIDTH, TAP_LOC) scb;
    
    // Mailboxes
    mailbox #(lfsr_transaction #(REG_WIDTH)) gen2drv_mbx;
    mailbox #(lfsr_transaction #(REG_WIDTH)) mon2scb_mbx;
    
    virtual lfsr_if#(REG_WIDTH) vif;
    
    function new(virtual lfsr_if#(REG_WIDTH) vif);
        this.vif = vif;
        gen2drv_mbx = new();
        mon2scb_mbx = new();
        
        gen = new(gen2drv_mbx);
        drv = new(vif.tb, gen2drv_mbx);
        mon = new(vif.mon, mon2scb_mbx);
        scb = new(mon2scb_mbx);
    endfunction

    task run();
        fork
            gen.run();
            drv.run();
            mon.run();
            scb.run();
        join_any
        wait(gen.gen_done.triggered);
        repeat(20) @(vif.cb); // Drainage time
        $display("TEST DONE. Passed: %0d Failed: %0d", scb.pass_count, scb.error_count);
        $finish;
    endtask
endclass
