module demux18_tb;
reg IN;
reg [2:0]SEL;
wire [7:0]OUT;
integer i,filehandle;

demux18 d1 (.in(IN),.out(OUT),.sel(SEL));
    initial begin
        filehandle = $fopen("demux18_output.txt","w");
        $fmonitor("|int= %b |sel= %b |out= %b |",IN,SEL,OUT);
    end
    initial begin
        for(i=0;i<65;i=i+1)begin
            SEL = i;

        end
        $fclose(filehandle);
        $finish;
    end
endmodule
    
