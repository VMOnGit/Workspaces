module PRI83_tb;

reg [7:0]in;
wire [2:0]out;
integer i,file_handle;
PRI83 p1(
    .out(out),
    .in(in)
);
initial begin
    file_handle = $fopen("PRI38_output.txt","w");
    $monitor(file_handle,"| In = %b | Out = %b |", in, out);
end

initial begin
    in = 8'h0;
    
    for(i = 0; i < 256; i = i + 1) begin
        in = i;#10;
        
    end
    
    $finish;
    $fclose(file_handle);
end

endmodule