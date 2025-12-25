// File: monitor.sv
class monitor #(parameter int REG_WIDTH = 8);
    
    virtual lfsr_if#(REG_WIDTH).mon vif;
    mailbox #(lfsr_transaction #(REG_WIDTH)) mon2scb_mbx;

    function new(virtual lfsr_if#(REG_WIDTH).mon vif, mailbox #(lfsr_transaction #(REG_WIDTH)) mbx);
        this.vif = vif;
        this.mon2scb_mbx = mbx;
    endfunction

    task run();
        forever begin
            @(vif.cb);
            // We capture activity if either Reset, Load, or Shift is active,
            // or if we just want to monitor the output continuously.
            // Here, we capture every cycle where reset is not active to track state.
            if (vif.cb.reset_n) begin
                lfsr_transaction #(REG_WIDTH) tr = new();
                
                // Sample Control Signals
                // We infer the operation type based on signal state
                if (vif.cb.load_en) begin
                    tr.op_kind = tr.OP_LOAD;
                    tr.seed_val = vif.cb.load_seq;
                end else if (vif.cb.shift_en) begin
                    tr.op_kind = tr.OP_SHIFT;
                end 
                
                // Sample Outputs
                tr.out_seq       = vif.cb.out_seq;
                tr.lock_out_flag = vif.cb.lock_out_flag;

                mon2scb_mbx.put(tr);
            end
        end
    endtask

endclass
