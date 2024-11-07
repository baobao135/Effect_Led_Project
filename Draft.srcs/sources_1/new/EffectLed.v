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
    input [1:0]button,
    output reg [11:0] Led,
    output reg [3:0] Led7SEG_1,
    output reg [3:0] Led7SEG_2
    );
    wire [0:6] freqLed;
    wire [0:6] modeLed;
    wire [3:0]freq;
    wire onesecond;
    wire [3:0]mode;
    wire [3:0] autoSwitch;
    wire [11:0] ledstring1, ledstring2, ledstring3, ledstring4, ledstring5;
    
frequency freq1(.button(button[0]), .rst(rst), .freq(freq), .clk(clk));  
  
timer timer1(.clk(clk), .rst(rst),.freq(freq) ,.onesecond(onesecond));

effectMode modeNum(.button(button[1]) ,.mode(mode), .rst(rst), .clk(clk));

autoSwitch(.onesecond(onesecond), .autoSwitch(autoSwitch), .rst(rst));

Effect_1 effect1(.onesecond(onesecond) ,.ledstring(ledstring1), .rst(rst), .button(button[1]));
Effect_2 effect2(.onesecond(onesecond) ,.ledstring(ledstring2), .button(button[1]));
Effect_3 effect3(.onesecond(onesecond) ,.ledstring(ledstring3), .button(button[1]));
Effect_4 effect4(.onesecond(onesecond) ,.ledstring(ledstring4), .button(button[1]));
Effect_5 effect5(.onesecond(onesecond) ,.ledstring(ledstring5), .button(button[1]));

initial begin
    Led = 12'b0;
end

always @(*)
begin
    if(switch==0)
    begin
        Led7SEG_2=mode;
        case (mode)
        4'b0001:begin
            Led=ledstring1;
        end
        4'b0010:begin
            Led=ledstring2;
        end
        4'b0011:begin
            Led=ledstring3;
        end
        4'b0100:begin
            Led=ledstring4;
        end
        4'b0101:begin
            Led=ledstring5;
        end
        default: 
            Led = 12'b0; // Gán giá tr? m?c ??nh
        endcase
    end
    else
    begin
        Led7SEG_2=autoSwitch;
        case (autoSwitch)
        4'b0001:begin
            Led=ledstring1;
        end
        4'b0010:begin
            Led=ledstring2;
        end
        4'b0011:begin
            Led=ledstring3;
        end
        4'b0100:begin
            Led=ledstring4;
        end
        4'b0101:begin
            Led=ledstring5;
        end
        default: 
            Led = 12'b0;
        endcase
    end
    Led7SEG_1=freq;
end

endmodule
