class generator;

mailbox #(lfsr_transaction) gen2drv_mbx;
event gen_done;
int num_transactions = 800;

function new(mailbox #(lfsr_transaction) mbx);
    this.gen2drv_mbx = mbx;
endfunction   
// Inside generator.sv
task run();
    for (int i = 0; i < num_transactions; i++) begin
        lfsr_transaction tr = new();

        // THIS IS THE GENERATION STEP
        // The solver calculates random values for load_en, seed, etc.
        if (!tr.randomize()) begin 
            $error("[Generator] Randomization failed!");
            $finish;
        end

        // Send the generated inputs to the Driver
        gen2drv_mbx.put(tr);
    end
    -> gen_done;
endtask


endclass
