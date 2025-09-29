module alu4(
    input [3:0] a,
    input [3:0] b,
    input [2:0] sel,
    output reg [3:0] out,
    output reg c, z, v
);

wire [3:0]sum, sub, sum_inv,a_inv, and_op, or_op, xor_op, xnor_op,sum_incr,cout_sum_incr;
wire cout_sum, cout_sub, cout_sum_inv;

FullAdderVector adder1 (
    .a(a),
    .b(b),
    .cin(1'b0),
    .sum(sum),
    .cout(cout_sum)
);

FullAdderVector incr1 (
    .a(a),
    .b(4'b0001),
    .cin(1'b0),
    .sum(sum_incr),
    .cout(cout_sum_incr)
);

FullSubtractorVector subb1 (
    .a(a),
    .b(b),
    .bin(1'b0),
    .diff(sub),
    .bout(cout_sub)
);

FullSubtractorVector subb2 (
    .a(b),
    .b(a),
    .bin(1'b0),
    .diff(sum_inv),
    .bout(cout_sum_inv)
);

NOT4 not1 (
    .inverted_op(a_inv),
    .in(a)
);

AND4 and1 (
    .andop(and_op),
    .in1(a),
    .in2(b)
); 

OR4 or1 (
    .or_op(or_op),
    .a(a),
    .b(b)
);

XOR4 xor1 (
    .xor_op(xor_op),
    .a(a),
    .b(b)
);

XNOR4 xnor1 (
    .xnor_op(xnor_op),
    .a(a),
    .b(b)
);


always@(sel)begin
    case (sel)
        3'b000 : begin out = 4'h0; c = 1'b0; v = 1'b0; end
        3'b001:begin out = sum_inv;c = cout_sum_inv;v = cout_sum_inv;end
        3'b010:begin out = sub;c = cout_sub;v = cout_sub; end
        3'b011:begin out = sum;c = cout_sum;v = cout_sum; end
        3'b100:begin out = xor_op; c = 1'b0; v = 1'b0; end
        3'b101:begin out = or_op; c = 1'b0; v = 1'b0; end
        3'b110:begin out = and_op; c = 1'b0; v = 1'b0; end
        3'b111:begin out = 4'hf;c = 1'b1;v = 1'b1;end
        default: begin out = 4'b0000;c = 1'b0;v = 1'b0; end
    endcase

    z = |out;
end
endmodule

module alu4_case_tb;
    reg [3:0] a;
    reg [3:0] b;
    reg [2:0] sel;
    wire [3:0] out;
    wire c, z, v;
    integer i,file_handle;
    
    alu4 alu1(.a(a),.b(b),.sel(sel),.out(out),.c(c),.z(z),.v(v));
    initial begin
        file_handle = $fopen("alu_output.txt","w");
        
    end
    initial begin
        $monitor("in1 = %b,in2 = %b,sel = %b,out = %b,cout = %b",a,b,sel,out,c);
        $fmonitor(file_handle,"| in1 = %b | in2 = %b | sel = %b | out = %b | cout = %b |",a,b,sel,out,c);
        a = 4'b0010;
        b = 4'b1111;
        for(i=0;i<8;i = i+1)begin
            sel = i;#100;
            $display("Operation is %4b",i);
        end
        $fclose(file_handle);
        $finish;
    end
endmodule
