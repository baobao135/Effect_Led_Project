`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 11:17:52 PM
// Design Name: 
// Module Name: EffectLed
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


module EffectLed(
    input clk, rst, switch,
    input [1:0] button,
    output reg [11:0] Led
    );
    wire [7:0]mode;
    wire [3:0] freq;
    wire [11:0] ledstring1, ledstring2, ledstring3, ledstring4, ledstring5;

effectMode modeNum(.button(button[1]) ,.mode(mode[3:0]));
Effect_3 effect3(.clk(clk), .rst(rst), .button(button[0]) ,.ledstring(ledstring3));


always @(posedge clk)
begin
    case (mode)
    4'b0001:begin
        Led<=ledstring1;
    end
    4'b0010:begin
        Led<=ledstring2;
    end
    4'b0011:begin
        Led<=ledstring3;
    end
    4'b0100:begin
        Led<=ledstring4;
    end
    4'b0101:begin
        Led<=ledstring5;
    end
    default: Led<=0;
    endcase
end
endmodule
