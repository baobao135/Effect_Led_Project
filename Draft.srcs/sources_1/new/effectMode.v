`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 02:37:21 AM
// Design Name: 
// Module Name: effectMode
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


module effectMode(
    input clk, button, rst,
    output reg [3:0]mode
    );
initial 
begin
    mode=1;
end
always @(posedge clk or posedge rst)
begin
    if(rst==1) mode<=1;
    else
    begin
        if(button==1)
        begin
            mode<=mode+1;
        end
        if(mode>5) mode<=1;
    end
end    


endmodule
