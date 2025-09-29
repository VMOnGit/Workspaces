module FullSubtractor(
    input a,
    input b,
    input bin,
    output diff,
    output bout
);
    assign diff = a ^ b ^ bin;
    assign bout = (~a & (b | bin)) | (b & bin);
endmodule

module FullSubtractorVector(
    input  [3:0] a,
    input  [3:0] b,
    input        bin,
    output [3:0] diff,
    output       bout
);
    wire [2:0] borrow;

    FullSubtractor FS0 (
        .a(a[0]),
        .b(b[0]),
        .bin(bin),
        .diff(diff[0]),
        .bout(borrow[0])
    );

    FullSubtractor FS1 (
        .a(a[1]),
        .b(b[1]),
        .bin(borrow[0]),
        .diff(diff[1]),
        .bout(borrow[1])
    );

    FullSubtractor FS2 (
        .a(a[2]),
        .b(b[2]),
        .bin(borrow[1]),
        .diff(diff[2]),
        .bout(borrow[2])
    );

    FullSubtractor FS3 (
        .a(a[3]),
        .b(b[3]),
        .bin(borrow[2]),
        .diff(diff[3]),
        .bout(bout)
    );
endmodule