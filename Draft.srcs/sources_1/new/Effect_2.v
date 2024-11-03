`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2024 11:55:03 PM
// Design Name: 
// Module Name: Effect_2
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


module Effect_2(
    input clk, rst, button,
    output reg [11:0] ledstring
    );
    wire onesecond;
    reg RoL; //1=left 0=right
    reg [3:0] index;
    
timer timer2(.clk(clk), .rst(rst),.button(button),.onesecond(onesecond));
 initial RoL = 0;
always @(posedge onesecond)
begin
    if(RoL == 0)
    begin
         index <= index + 1;
         ledstring <= 12'b000000000001 << index;
         if(index == 11)
         begin
             RoL <=1;
         end
         else
         begin
             index <= index - 1;
             ledstring <= 12'b000000000001 << index;
             if(index == 0)
             begin
                 RoL <= 0;
             end
         end
    end
end 
endmodule

