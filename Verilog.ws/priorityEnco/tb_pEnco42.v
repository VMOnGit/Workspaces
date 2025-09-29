module tb_pEnco42;

reg [3:0]d;
wire [1:0]out;

pEnco42 pE(d,out);
initial begin
    $dumpfile("tb_pEnco42.vcd");
    $dumpvars(0,tb_pEnco42);
    $monitor("d=%b out=%b",d,out);
    d=4'b0000; #10;
    d=4'b0001; #10;
    d=4'b0010; #10;
    d=4'b0100; #10;
    d=4'b1000; #10;

    $finish;
end
endmodule