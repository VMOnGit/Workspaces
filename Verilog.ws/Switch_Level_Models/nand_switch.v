module NAND_SWITCH (
    output out,
    input A, B
);

    wire C;

    supply1 vdd;
    supply0 gnd;

    pmos P1 (out, vdd, A);
    pmos P2 (out, vdd, B);

    nmos N1 (out, C, A);
    nmos N2 (C, gnd, B);

endmodule