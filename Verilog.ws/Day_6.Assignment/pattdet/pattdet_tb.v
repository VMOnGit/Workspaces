module pattern_tb;
reg [2:0]A;
wire OUT;
integer i,filehandle;

pattern p1 (A,OUT);

initial begin
    filehandle=$fopen("simple_pattern_detector.txt","w");
end
initial begin
for(i=0;i<8;i=i+1)begin
    A=i;#10
    $fdisplay(filehandle,"|A= %b |OUT= %b |",A,OUT);
end
$fclose(filehandle);
$finish;
end
endmodule
    