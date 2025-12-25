// File: lfsr_transaction.sv
class lfsr_transaction #(parameter int REG_WIDTH = 8);
    
    // Operation Type
    typedef enum {OP_LOAD, OP_SHIFT} op_t;
    rand op_t op_kind;

    // Stimulus Data
    rand logic seed_val;
    rand int unsigned          cycles_to_shift;

    // Captured Response (from DUT)
    logic out_seq;
    logic                 lock_out_flag;

    // Constraints
    constraint c_op_dist {
        // Shift more often than Load (80% Shift, 20% Load)
        op_kind dist { OP_SHIFT := 80, OP_LOAD := 20 };
    }

    constraint c_shift_len {
        // When shifting, shift for a burst of 1 to 20 cycles
        cycles_to_shift inside {[1:20]};
    }

    constraint c_seed_nonzero {
        // Avoid loading 0 if possible, though the DUT logic might handle it
        seed_val!= 0;
    }

    // Utility to copy objects
    function lfsr_transaction #(REG_WIDTH) copy();
        lfsr_transaction #(REG_WIDTH) tr = new();
        tr.op_kind         = this.op_kind;
        tr.seed_val        = this.seed_val;
        tr.cycles_to_shift = this.cycles_to_shift;
        tr.out_seq         = this.out_seq;
        tr.lock_out_flag   = this.lock_out_flag;
        return tr;
    endfunction

    function void print(string tag = "");
        $display("[%s] Time=%0t Op=%s Seed=%h Out=%h Lock=%b", 
                 tag, $time, op_kind.name(), seed_val, out_seq, lock_out_flag);
    endfunction

endclass
