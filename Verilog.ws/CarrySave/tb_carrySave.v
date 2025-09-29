module tb_carrySave;
reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] sum;
wire cout;

carrySave cs1(a,b,cin,sum,cout);

initial begin
    $dumpfile("tb_carrySave.vcd");
    $dumpvars(0, tb_carrySave);
    $monitor("a=%b, b=%b, cin=%b => sum=%b, cout=%b", a, b, cin, sum, cout);
    // Test case 1
    #10 a = 4'b1101; b = 4'b1011; cin = 1'b0;
    // Test case 2
    #10 a = 4'b0110; b = 4'b0011; cin = 1'b1;
    // Test case 3
    #10 a = 4'b1111; b = 4'b1111; cin = 1'b0;
    // Test case 4
    #10 a = 4'b0000; b = 4'b0000; cin = 1'b1;
    // Test case 5
    #10 a = 4'b1001; b = 4'b0101; cin = 1'b0;
    // End simulation
    #10 $finish;
    
end
endmodule