module bitrev #(parameter N=8)(
    output reg palind,
    output [N-1:0]rev,
    input [N-1:0]in
);

    function [N-1:0]reverse;
    input [N-1:0]in;

    integer i;
    begin

        for(i=0;i<N;i=i+1)begin
            reverse[N-i-1]=in[i];
        end
    end  
    endfunction

    task palindrome1;
    input [N-1:0]in;
    output palindrome;
    integer i;
    reg [N-1:0]op;

    begin
       
        op=reverse(in);
        if(op==in)
            palindrome=1;
            else
            palindrome=0;
    end
    endtask
    always@(*)begin
    palindrome1(in,palind);
    end
    assign rev=reverse(in);  

endmodule

