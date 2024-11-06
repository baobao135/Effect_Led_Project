`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 11:17:52 PM
// Design Name: 
// Module Name: frequency
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


module frequency(
    input clk, button, rst,
    output reg [3:0] freq
    );
    
initial 
begin
    freq=1;
end
always @(posedge clk or posedge rst)
begin
    if(rst==1) freq<=1;
    else
    begin
        if(button==1)
        begin
            freq<=freq*2;
            if (freq>=4  || freq<=0 ) freq<=1;
        end
    end
end

endmodule
