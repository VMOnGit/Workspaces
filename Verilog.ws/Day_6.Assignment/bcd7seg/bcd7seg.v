module BCD7SEG(
    output reg a,b,c,d,e,f,g,
    input i3,i2,i1,i0
);

always @(i0,i1,i2,i3)begin
    casez({i3,i2,i1,i0})

            4'b0000 : {a,b,c,d,e,f,g}= 7'b 1111110;
            4'b0001 : {a,b,c,d,e,f,g}= 7'b 0110000;
            4'b0010 : {a,b,c,d,e,f,g}= 7'b 1101101;
            4'b0011 : {a,b,c,d,e,f,g}= 7'b 1111001;
            4'b0100 : {a,b,c,d,e,f,g}= 7'b 0110011;
            4'b0101 : {a,b,c,d,e,f,g}= 7'b 1011011;
            4'b0110 : {a,b,c,d,e,f,g}= 7'b 1011111;
            4'b0111 : {a,b,c,d,e,f,g}= 7'b 1110000;
            4'b1000 : {a,b,c,d,e,f,g}= 7'b 1111111;
            4'b1001 : {a,b,c,d,e,f,g}= 7'b 1111011;
            4'b1?1? : {a,b,c,d,e,f,g}= 7'b 0000000;
            4'b1??1 : {a,b,c,d,e,f,g}= 7'b 0000000;
            4'b111? : {a,b,c,d,e,f,g}= 7'b 0000000;
    endcase

end
endmodule

