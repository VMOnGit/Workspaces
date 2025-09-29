module two_complement(
    output reg [3:0]result,
    input [3:0]a
);

task twos
(input [3:0]a, output [3:0]result
    );

begin
    result=(~(a)+1'b1);
end

endtask

always @(*)
begin
   twos(a, result); 
end

endmodule

module complement_tb;
reg [3:0]A;
wire [3:0]RES;
two_complement a1(.a(A),.result(RES));
integer i, file_handle;

initial begin

        file_handle = $fopen("twos.txt", "w");    

        for(i=0;i<16;i=i+1)begin
            A=i;#10
            $fdisplay(file_handle,"2's Complement of %b\t is %b\n ",A,RES);
        end

        $fclose(file_handle);
end 
endmodule
