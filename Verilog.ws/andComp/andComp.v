module andComp(
    input a1,a2,b1,b2,
    output great, equal, less
);

    assign great = (a1 & ~b1) | (a1 & a2 & ~b2) | (~b1 & a2 & ~b2);
    assign equal = ((a1&b1) ~^ (a2&b2)) | ((a1&a2) ~^ (b1&b2));
    assign less = (~a1 & b1) | (~a1 & ~a2 & b2) | (~a2 & b1 & b2);



endmodule