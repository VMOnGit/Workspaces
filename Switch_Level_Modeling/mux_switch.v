module MUX_SWITCH (
    input I0, I1, Spin,
    output OUT
);

wire Spin_bar;

not N1 (Spin_bar, Spin);

cmos C1 (OUT, I0, Spin_bar, Spin);
cmos C2 (OUT, I1, Spin, Spin_bar);
    
endmodule