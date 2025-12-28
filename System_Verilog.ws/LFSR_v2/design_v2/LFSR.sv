
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

    bit [REG_WIDTH-1:0] in_seq;
    logic [REG_WIDTH-1:0] shifter_reg;
    logic xor_out,iter;
    
    
    //Shifter Block
    always_ff @(posedge clock or negedge reset_n) begin : Load_and_shift_block
        
        if(!reset_n) begin
            out_seq <= in_seq ;
        end

        else begin
    
            if(load_en)begin //Load block, has highest priority
               out_seq <= load_seq;
               iter <= 1'b1;
            end
    
            else if(shift_en)begin //Shifter block
                out_seq <= shifter_reg;
               end
    
            else begin //if no load or shift operation maintain previous value
                out_seq <= out_seq;
            end 
    
        end
        
    end : Load_and_shift_block
    assign shifter_reg = {(out_seq[0]^out_seq[TAP_LOC-1]),out_seq[REG_WIDTH-1:1]};
    assign lock_out_flag = ((out_seq == shifter_reg) && iter && (~shift_en))?1'b1:1'b0;

endmodule
