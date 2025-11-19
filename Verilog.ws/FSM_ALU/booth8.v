`include "FADDER8.v" // Assumes FADDER8.v is in the same directory

module booth_multiplier_8bit(
    output reg [15:0] product,
    output reg        done,
    input      [7:0]  multiplicand, // M
    input      [7:0]  multiplier,   // Q
    input             clk,
    input             start,
    input             rst_n
);

    // FSM state encoding
    localparam IDLE       = 2'b00;
    localparam MULT       = 2'b01;
    localparam DONE_STATE = 2'b10;

    // Internal registers
    reg  [1:0] state;
    reg  [7:0] A;           // Accumulator
    reg  [7:0] Q;           // Holds the multiplier
    reg  [7:0] M;           // Holds the multiplicand
    reg        Q_minus_1;   // Booth algorithm's extra bit
    reg  [3:0] count;       // Iteration counter (up to 8)
    reg [7:0] A_temp;
    // Wires for connecting to the FADDER8 instance
    wire [7:0] adder_sum;
    wire       adder_cout;
    wire [7:0] adder_B_in;
    wire       adder_Cin;

    // --- Control Logic ---
    // Booth algorithm requires looking at the last two bits {Q[0], Q_minus_1}
    // Case '01': Add M (A = A + M)
    // Case '10': Subtract M (A = A - M), which is A + (~M) + 1
    wire is_add = (Q[0] == 1'b1 && Q_minus_1 == 1'b0);
    wire is_sub = (Q[0] == 1'b0 && Q_minus_1 == 1'b1);

    // Set the inputs for the FADDER8 based on the operation
    // For subtraction (A-M), B input is ~M and Cin is 1 (Two's complement)
    // For addition (A+M), B input is M and Cin is 0
    assign adder_B_in = is_sub ? ~M : M;
    assign adder_Cin  = is_sub;

    // --- Datapath ---
    // Instantiate the 8-bit adder you provided
    FADDER8 u_adder (
        .sum(adder_sum),
        .Cout(adder_cout),
        .A(A),
        .B(adder_B_in),
        .Cin(adder_Cin)
    );

    // --- FSM and Sequential Logic ---
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Asynchronous reset
            state     <= IDLE;
            A         <= 8'h00;
            Q         <= 8'h00;
            M         <= 8'h00;
            Q_minus_1 <= 1'b0;
            count     <= 4'h0;
            product   <= 16'h0000;
            done      <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 1'b0; // Signal not done
                    if (start) begin
                        state     <= MULT;
                        A         <= 8'h00;          // 1. Initialize accumulator to 0
                        Q         <= multiplier;     // 2. Load the multiplier
                        M         <= multiplicand;   // 3. Load the multiplicand
                        Q_minus_1 <= 1'b0;           // 4. Clear the extra bit
                        count     <= 4'h0;           // 5. Reset counter
                    end
                end

                MULT: begin
                    // A temporary register to hold the result of the add/sub operation
                    // before the arithmetic shift.
                    

                    if (is_add || is_sub) begin
                        A_temp = adder_sum; // Result of A+M or A-M
                    end else begin
                        A_temp = A;         // No operation, pass A through
                    end

                    // Perform the arithmetic right shift on the combined {A, Q} register
                    // The MSB of A_temp is shifted into A[7] to preserve the sign.
                    A         <= {A_temp[7], A_temp[7:1]};
                    Q         <= {A_temp[0], Q[7:1]};
                    Q_minus_1 <= Q[0]; // Update the extra bit

                    count <= count + 1;

                    // After 8 iterations (count from 0 to 7), move to DONE
                    if (count == 4'd7) begin
                        state <= DONE_STATE;
                    end
                end

                DONE_STATE: begin
                    product <= {A, Q}; // Latch the final 16-bit result
                    done    <= 1'b1;   // Signal completion
                    // Wait for start to go low before returning to IDLE
                    if (!start) begin
                        state <= IDLE;
                    end
                end

                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule