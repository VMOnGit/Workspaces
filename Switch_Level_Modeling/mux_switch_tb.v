`timescale 1ps/1ps
`include "mux_switch.v"

module mux_switch_tb;

reg I0, I1, Spin;
wire OUT;
integer i;

MUX_SWTICH MUX1 (I0, I1, Spin, OUT);

initial 
begin
    $monitor("Time: %1t | OUT: %b | I0: %b | I1: %b | Sel: %b", $time, OUT, I0, I1, Spin);

    for (i = 8; i > 0; i = i - 1)
    begin
        {I1, I0, Spin} = i;
        #10;
    end
end    
endmodule