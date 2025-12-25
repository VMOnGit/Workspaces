// File: driver.sv
class driver #(parameter int REG_WIDTH = 8);
    
    virtual lfsr_if#(REG_WIDTH).tb vif;
    mailbox #(lfsr_transaction #(REG_WIDTH)) gen2drv_mbx;

    function new(virtual lfsr_if#(REG_WIDTH).tb vif, mailbox #(lfsr_transaction #(REG_WIDTH)) mbx);
        this.vif = vif;
        this.gen2drv_mbx = mbx;
    endfunction

    // Task to drive Reset
    task reset_dut();
        $display(" Asserting Reset");
        vif.cb.reset_n  <= 0;
        vif.cb.load_en  <= 0;
        vif.cb.shift_en <= 0;
        vif.cb.load_seq <= '0;
        repeat(2) @(vif.cb);
        vif.cb.reset_n  <= 1;
        $display(" Reset Released");
    endtask

    // Task to drive Load
    task drive_load(logic seed);
        vif.cb.load_en  <= 1;
        vif.cb.shift_en <= 0;
        vif.cb.load_seq <= seed;
        @(vif.cb); // 1 clock cycle to load
        vif.cb.load_en  <= 0; // Deassert
    endtask

    // Task to drive Shift
    task drive_shift(int cycles);
        vif.cb.load_en  <= 0;
        vif.cb.shift_en <= 1;
        // Hold shift_en high for the requested number of cycles
        repeat(cycles) @(vif.cb);
        vif.cb.shift_en <= 0; // Deassert
    endtask

    task run();
        lfsr_transaction #(REG_WIDTH) tr;
        reset_dut();

        forever begin
            gen2drv_mbx.get(tr);
            
            case (tr.op_kind)
                tr.OP_LOAD: begin
                    drive_load(tr.seed_val);
                end
                tr.OP_SHIFT: begin
                    drive_shift(tr.cycles_to_shift);
                end
            endcase
        end
    endtask

endclass
