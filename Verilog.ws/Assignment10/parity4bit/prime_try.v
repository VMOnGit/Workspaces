module prime(input [3:0] a, output reg y);
    task prime_tsk(input [3:0] a0, output y0);
        integer i;
        begin
        y0=0;
        for(i=2; i<=(a/2); i=i+1)begin
        if(a%i==0) begin
            y0=1;
        end
        end
        end
    endtask
    always @(*)
    begin
        prime_tsk (a,y);
    end
endmodule