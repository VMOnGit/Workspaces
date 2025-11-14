module XNOR_SWITCH(
    output OUT,
    input A,B
);
wire A_bar,B_bar;
supply1 Vdd;
supply0 Gnd;
wire pwire,n1wire,n2wire;

not not1(A_bar,A);
not not2(B_bar,B);

pmos P1(pwire,Vdd,A_bar);
pmos P2(pwire,Vdd,B);

pmos P3(OUT,pwire,A);
pmos P4(OUT,pwire,B_bar);

nmos N1(n1wire,Gnd,B);
nmos N2(n2wire,Gnd,B_bar);

nmos N3(OUT,n1wire,A_bar);
nmos N4(OUT,n2wire,A);
    
endmodule
