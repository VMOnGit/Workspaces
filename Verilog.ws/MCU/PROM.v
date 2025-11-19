`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 14.11.2025 22:46:38
// Design Name: 
// Module Name: PROGMEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PROGMEM(
    input wire clk,
    input wire read_enable,
    input wire [7:0] read_address,
    output reg [7:0] read_data
    );
    
    reg [7:0] PROM [0:63];

    
    initial
    begin
        PROM[0]  <= 8'h11;
        PROM[1]  <= 8'h12;
        PROM[2]  <= 8'h01;
        PROM[3]  <= 8'h13;
        PROM[4]  <= 8'h12;
        PROM[5]  <= 8'h14;
        PROM[6]  <= 8'h12;
        PROM[7]  <= 8'h15;
        PROM[8]  <= 8'h00;
        PROM[9]  <= 8'h00;
        PROM[10] <= 8'h00;
        PROM[11] <= 8'h00;
        PROM[12] <= 8'h17;
        PROM[13] <= 8'h05;
        PROM[14] <= 8'hF5;
        PROM[15] <= 8'hE0;
        PROM[16] <= 8'hFF;
        PROM[17] <= 8'h20;
        PROM[18] <= 8'h16;
        PROM[19] <= 8'h18;
        PROM[20] <= 8'h0C;
        
        PROM[32] <= 8'h13;
        PROM[33] <= 8'hAA;
        PROM[34] <= 8'h14;
        PROM[35] <= 8'hAA;
        PROM[36] <= 8'h15;
        PROM[37] <= 8'h00;
        PROM[38] <= 8'h00;
        PROM[39] <= 8'h00;
        PROM[40] <= 8'h00;
        PROM[41] <= 8'h17;
        PROM[42] <= 8'h05;
        PROM[43] <= 8'hF5;
        PROM[44] <= 8'hE0;
        PROM[45] <= 8'hFF;
        PROM[46] <= 8'h01;
        PROM[47] <= 8'h16;
        PROM[48] <= 8'h18;
        PROM[49] <= 8'h29;
    end
    
    
    always @(posedge clk)
    begin //
        if(read_enable == 1)
        begin //-//
            read_data <= PROM[read_address];
        end //-//
        
        else read_data <= read_data;
    end //
    

endmodule