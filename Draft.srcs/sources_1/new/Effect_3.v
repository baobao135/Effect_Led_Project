`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 11:17:52 PM
// Design Name: 
// Module Name: Effect_3
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


module Effect_3(
    input clk, rst, button,
    output reg [11:0] ledstring
    );
    wire onesecond;
    reg [1:0]flag;
    
timer timer3(.clk(clk), .rst(rst),.button(button),.onesecond(onesecond));
initial flag=0;
always @(posedge onesecond)
begin
    if(flag==0)
    begin
        ledstring<=12'b010101010101;
        flag<=1;
    end
    else 
    begin
        ledstring<=12'b101010101010;
        flag<=0;
    end
end
    
endmodule
