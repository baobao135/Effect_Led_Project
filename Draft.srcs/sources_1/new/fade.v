`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2024 09:52:23 PM
// Design Name: 
// Module Name: fade
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


module fade(
    input clk, [3:0]freq, rst,
    output [11:0] led
    );
reg [26:0] count;
always @(posedge clk)
begin
    if(rst==1) count=0;
    if(freq==1) count=count+1;
    if(freq==2) count=count+2;
    if(freq==4) count=count+4;
end
reg [4:0] PWM;
wire [3:0] intensity= count[26] ? count[25:22] : ~count[25:22];
always @(posedge clk)
    PWM <= PWM[3:0] + intensity;
assign led = {12{PWM[4]}};
endmodule
