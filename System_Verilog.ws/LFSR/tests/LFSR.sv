
module LFSR #(
    parameter REG_WIDTH = 8,
    parameter TAP_LOC = 4
) (
    output logic [REG_WIDTH-1:0] out_seq,
    output logic lock_out_flag,
    input logic [REG_WIDTH-1:0] load_seq,
    input logic load_en,
    input logic shift_en,
    input logic clock,
    input logic reset_n
);

    logic [REG_WIDTH-1:0] in_seq,shifter_reg;
    logic [7:0] checker_reg;
    logic xor_out;
    logic [REG_WIDTH-1:0] iterator_var,max_iters;
    
    
    //Shifter Block
    always_ff @(posedge clock or negedge reset_n) begin : Load_and_shift_block
        
        if(!reset_n) begin
            out_seq = in_seq;
        end

        else begin
    
            if(load_en)begin //Load block, has highest priority
               shifter_reg <= in_seq;
            end
    
            else if(shift_en)begin //Shifter block
                    out_seq <= {(shifter_reg[REG_WIDTH-1]^shifter_reg[TAP_LOC-1]),shifter_reg[REG_WIDTH-1:1]};
                    
                    if(out_seq == shifter_reg)begin // lockout_check
                        lock_out_flag <= 1'b1;
                    end
                    else begin
                        shifter_reg <= out_seq;    
                    end
               end
    
            else begin //if no load or shift operation maintain previous value
                out_seq <= out_seq;
                shifter_reg <= shifter_reg;
            end 
    
        end
        
    end : Load_and_shift_block

endmodule
