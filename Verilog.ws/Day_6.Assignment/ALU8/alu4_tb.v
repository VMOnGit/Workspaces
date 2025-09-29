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