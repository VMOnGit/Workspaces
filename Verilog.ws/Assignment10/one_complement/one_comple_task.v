module one_complement(
    output reg [3:0]result,
    input [3:0]a
);

task ones
(input [3:0]a, output [3:0]result);

begin
    result=~(a);
end

endtask

always @(*) 
begin
    ones(a, result);
end

endmodule

module complement_tb;
reg [3:0]A;
wire [3:0]RES;
one_complement a1(.a(A),.result(RES));
integer i, file_handle;

initial begin

    file_handle = $fopen("ones.txt", "w");    

        for(i=0;i<16;i=i+1)begin
            A=i;#10
            $fdisplay(file_handle,"1's Complement of %b\t is %b\n ",A,RES);
        end

    $fclose(file_handle);
end 
endmodule
