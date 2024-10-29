`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2024 12:05:08 AM
// Design Name: 
// Module Name: Display7SEG
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


module Display7SEG(
    input [3:0] inNum,
    output reg Num7SEG
    );

always @(*)
begin
    case(inNum)
    4'b0000: Num7SEG = 7'b1111110;
    4'b0001: Num7SEG = 7'b0110000;
    4'b0010: Num7SEG = 7'b1101101;
    4'b0011: Num7SEG = 7'b1111001;
    4'b0100: Num7SEG = 7'b0110011;
    4'b0101: Num7SEG = 7'b1011011;
    4'b0110: Num7SEG = 7'b1011111;
    4'b0111: Num7SEG = 7'b1110000;
    4'b1000: Num7SEG = 7'b1111111;
    4'b1001: Num7SEG = 7'b1111011;
    default: Num7SEG = 7'b1111110;
    endcase
end
endmodule
