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
    input button, rst,
    output reg [3:0] freq
    );
    wire [0:6] Led7SEG_1;

initial freq=1;
always @(posedge button)
begin
    if(rst==1) freq<=1;
    else
    begin
        if (freq>=4  || freq<=0 ) freq<=1;
        else freq<=freq*2;            
    end
end

Display7SEG Display7SEG1(.inNum(freq), .Num7SEG(Led7SEG_1));

endmodule
