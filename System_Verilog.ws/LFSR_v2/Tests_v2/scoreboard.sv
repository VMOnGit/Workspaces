// // File: scoreboard.sv
// class scoreboard #(parameter int REG_WIDTH = 8, parameter int TAP_LOC = 4);
    
//     mailbox #(lfsr_transaction #(REG_WIDTH)) mon2scb_mbx;
    
//     // Internal Shadow Registers to mimic DUT
//     logic [REG_WIDTH-1:0] shadow_out_seq;
//     logic [REG_WIDTH-1:0] shadow_shifter_reg;
//     logic                 shadow_lock_out_flag;

//     int error_count = 0;
//     int pass_count  = 0;

//     function new(mailbox #(lfsr_transaction #(REG_WIDTH)) mbx);
//         this.mon2scb_mbx = mbx;
//         // Initialize shadow registers to 0 or X
//         shadow_out_seq = '0;
//         shadow_shifter_reg = '0;
//         shadow_lock_out_flag = 0;
//     endfunction

//     // Reference Logic (Golden Model)
//     // This matches the RTL 'Load_and_shift_block' logic
//     function void predict(lfsr_transaction #(REG_WIDTH) tr);
//         logic next_out_seq;
        
//         if (tr.op_kind == tr.OP_LOAD) begin
//             // RTL: if(load_en) shifter_reg <= in_seq;
//             shadow_shifter_reg = tr.seed_val;
//             // RTL: else begin... out_seq <= out_seq; end (Implicit hold)
//             // Note: In the provided RTL, if load_en is high, only shifter_reg updates.
//             // out_seq holds its value.
//         end 
//         else if (tr.op_kind == tr.OP_SHIFT) begin
//             // RTL Logic:
//             // out_seq <= {(shifter_reg^shifter_reg), shifter_reg};
//             logic feedback_bit;
//             feedback_bit = shadow_shifter_reg ^ shadow_shifter_reg;
//             next_out_seq = {feedback_bit, shadow_shifter_reg};
            
//             // RTL Lockout Logic: if(out_seq == shifter_reg)
//             // Note: In non-blocking assignments, 'out_seq' here refers to the CURRENT (Old) value
//             if (shadow_out_seq == shadow_shifter_reg) begin
//                 shadow_lock_out_flag = 1'b1;
//             end else begin
//                 // shifter_reg <= out_seq (updates to the OLD out_seq value)
//                 shadow_shifter_reg = shadow_out_seq;
//                 shadow_lock_out_flag = 1'b0; // Implicitly stays 0 or logic clears it? 
//                 // Provided RTL doesn't explicitly clear lock_out_flag, 
//                 // assuming it holds or resets elsewhere. 
//                 // For this model, we'll assume it clears if condition fails or holds.
//                 // *Adapting to RTL snippet strictly*: The snippet shows lock_out set to 1.
//                 // It does NOT show it being cleared. We will check for 1 if condition met.
//             end
            
//             // Update out_seq
//             shadow_out_seq = next_out_seq;
//         end
//     endfunction

//     task run();
//         lfsr_transaction #(REG_WIDTH) tr;
        
//         $display(" Started");
//         forever begin
//             mon2scb_mbx.get(tr);
            
//             // Predict Expected Values
//             predict(tr);

//             // Check Results
//             if (tr.out_seq!== shadow_out_seq) begin
//                 $error(" Data Mismatch! Expected=%h Actual=%h", 
//                        shadow_out_seq, tr.out_seq);
//                 error_count++;
//             end else if (tr.lock_out_flag!== shadow_lock_out_flag && shadow_lock_out_flag == 1) begin
//                 // We only explicitly check if lock_out_flag SHOULD be 1
//                 $error(" Lockout Flag Mismatch! Expected=1 Actual=%b", tr.lock_out_flag);
//                 error_count++;
//             end else begin
//                 pass_count++;
//             end
//         end
//     endtask

// endclass
// File: scoreboard.sv
class scoreboard #(parameter int REG_WIDTH = 8, parameter int TAP_LOC = 4);
    
    mailbox #(lfsr_transaction #(REG_WIDTH)) mon2scb_mbx;
    
    // Internal Shadow Registers
    logic [REG_WIDTH-1:0] shadow_out_seq;
    logic [REG_WIDTH-1:0] shadow_shifter_reg;
    logic                 shadow_lock_out_flag;
    logic                 shadow_iter;
    int error_count = 0;
    int pass_count  = 0;

    function new(mailbox #(lfsr_transaction #(REG_WIDTH)) mbx);
        this.mon2scb_mbx = mbx;
        shadow_out_seq = '0;
        shadow_iter    = 0;
    endfunction

    function void check_results(lfsr_transaction #(REG_WIDTH) tr);
        
        // --- 1. DECLARATIONS MUST BE FIRST ---
        logic [REG_WIDTH-1:0] next_shifter_reg_val;
        logic                 feedback_bit;
        logic [REG_WIDTH-1:0] expected_out_seq;
        logic                 expected_iter;
        logic                 expected_lock_out;
        logic [REG_WIDTH-1:0] current_shifter_val;
        bit                   is_shifting;

        // --- 2. CALCULATE NEXT STATE CANDIDATE ---
        // DUT Logic: assign shifter_reg = {(out_seq^out_seq),out_seq};
        feedback_bit = shadow_out_seq ^ shadow_out_seq;
        next_shifter_reg_val = {feedback_bit, shadow_out_seq};

        // --- 3. DETERMINE EXPECTED SEQUENTIAL STATE ---
        expected_out_seq = shadow_out_seq; // Default hold
        expected_iter    = shadow_iter;    // Default hold

        if (tr.op_kind == tr.OP_LOAD) begin
            expected_out_seq = tr.seed_val;
            expected_iter    = 1'b1;
        end 
        else if (tr.op_kind == tr.OP_SHIFT) begin
            expected_out_seq = next_shifter_reg_val;
        end
        
        // --- 4. DETERMINE EXPECTED LOCK OUT FLAG ---
        // Recalculate 'shifter_reg' based on the NEW expected state
        feedback_bit = expected_out_seq ^ expected_out_seq;
        current_shifter_val = {feedback_bit, expected_out_seq};
        
        is_shifting = (tr.op_kind == tr.OP_SHIFT);

        if ((expected_out_seq == current_shifter_val) && expected_iter &&!is_shifting) begin
            expected_lock_out = 1'b1;
        end else begin
            expected_lock_out = 1'b0;
        end

        // --- 5. CHECK RESULTS ---
        if (tr.out_seq!== expected_out_seq) begin
            $error(" Data Mismatch! Time=%0t | Expected=%h Actual=%h", 
                   $time, expected_out_seq, tr.out_seq);
            error_count++;
        end else begin
            pass_count++;
        end

        // Check Lockout Flag (only on mismatch to avoid noise, or strictly check 1)
        if (tr.lock_out_flag!== expected_lock_out) begin
             // We allow a mismatch if expected is 0 but actual is X during reset/init
             if (expected_lock_out === 1'b1 |

| tr.lock_out_flag === 1'b1) begin
                $error(" LockFlag Mismatch! Time=%0t | Expected=%b Actual=%b", 
                       $time, expected_lock_out, tr.lock_out_flag);
                error_count++;
             end
        end 

        // --- 6. UPDATE SHADOW STATE ---
        shadow_out_seq = expected_out_seq;
        shadow_iter    = expected_iter;

    endfunction

    task run();
        lfsr_transaction #(REG_WIDTH) tr;
        $display(" Started");
        forever begin
            mon2scb_mbx.get(tr);
            check_results(tr);
        end
    endtask

endclass