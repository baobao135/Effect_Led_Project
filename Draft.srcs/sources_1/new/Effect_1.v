`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2024 11:52:28 PM
// Design Name: 
// Module Name: Effect_1
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


module Effect_1(
    input clk, rst, button,
    output reg [11:0] ledstring
    );

    wire onesecond;
    reg RoL; //1=left 0=right
    
timer timer1(.clk(clk), .rst(rst),.button(button),.onesecond(onesecond));

initial RoL = 0;
always @(posedge onesecond)
begin
    if(RoL ==  0)
        begin 
        ledstring <= (ledstring<<1) + 12'b000000000001;
        if(ledstring == 12'b111111111111)
        RoL <= 1;
        end
    else
        begin
        ledstring <= 12'b000000000000;
        ledstring <= (ledstring >>1)  + 12'b111111111111;
        RoL <=0;
        end
end
endmodule

