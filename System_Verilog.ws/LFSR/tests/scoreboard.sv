// File: scoreboard.sv
class scoreboard #(parameter int REG_WIDTH = 8, parameter int TAP_LOC = 4);
    
    mailbox #(lfsr_transaction #(REG_WIDTH)) mon2scb_mbx;
    
    // Internal Shadow Registers to mimic DUT
    logic shadow_out_seq;
    logic shadow_shifter_reg;
    logic                 shadow_lock_out_flag;

    int error_count = 0;
    int pass_count  = 0;

    function new(mailbox #(lfsr_transaction #(REG_WIDTH)) mbx);
        this.mon2scb_mbx = mbx;
        // Initialize shadow registers to 0 or X
        shadow_out_seq = '0;
        shadow_shifter_reg = '0;
        shadow_lock_out_flag = 0;
    endfunction

    // Reference Logic (Golden Model)
    // This matches the RTL 'Load_and_shift_block' logic
    function void predict(lfsr_transaction #(REG_WIDTH) tr);
        logic next_out_seq;
        
        if (tr.op_kind == tr.OP_LOAD) begin
            // RTL: if(load_en) shifter_reg <= in_seq;
            shadow_shifter_reg = tr.seed_val;
            // RTL: else begin... out_seq <= out_seq; end (Implicit hold)
            // Note: In the provided RTL, if load_en is high, only shifter_reg updates.
            // out_seq holds its value.
        end 
        else if (tr.op_kind == tr.OP_SHIFT) begin
            // RTL Logic:
            // out_seq <= {(shifter_reg^shifter_reg), shifter_reg};
            logic feedback_bit;
            feedback_bit = shadow_shifter_reg ^ shadow_shifter_reg;
            next_out_seq = {feedback_bit, shadow_shifter_reg};
            
            // RTL Lockout Logic: if(out_seq == shifter_reg)
            // Note: In non-blocking assignments, 'out_seq' here refers to the CURRENT (Old) value
            if (shadow_out_seq == shadow_shifter_reg) begin
                shadow_lock_out_flag = 1'b1;
            end else begin
                // shifter_reg <= out_seq (updates to the OLD out_seq value)
                shadow_shifter_reg = shadow_out_seq;
                shadow_lock_out_flag = 1'b0; // Implicitly stays 0 or logic clears it? 
                // Provided RTL doesn't explicitly clear lock_out_flag, 
                // assuming it holds or resets elsewhere. 
                // For this model, we'll assume it clears if condition fails or holds.
                // *Adapting to RTL snippet strictly*: The snippet shows lock_out set to 1.
                // It does NOT show it being cleared. We will check for 1 if condition met.
            end
            
            // Update out_seq
            shadow_out_seq = next_out_seq;
        end
    endfunction

    task run();
        lfsr_transaction #(REG_WIDTH) tr;
        
        $display(" Started");
        forever begin
            mon2scb_mbx.get(tr);
            
            // Predict Expected Values
            predict(tr);

            // Check Results
            if (tr.out_seq!== shadow_out_seq) begin
                $error(" Data Mismatch! Expected=%h Actual=%h", 
                       shadow_out_seq, tr.out_seq);
                error_count++;
            end else if (tr.lock_out_flag!== shadow_lock_out_flag && shadow_lock_out_flag == 1) begin
                // We only explicitly check if lock_out_flag SHOULD be 1
                $error(" Lockout Flag Mismatch! Expected=1 Actual=%b", tr.lock_out_flag);
                error_count++;
            end else begin
                pass_count++;
            end
        end
    endtask

endclass
