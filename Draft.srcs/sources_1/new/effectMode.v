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
    input button,
    output reg [3:0]mode
    );
    wire [0:6] Led7SEG_2;

initial mode=1;
always @(posedge button)
begin
    if(button==1)
    begin
        mode<=mode+1;
        if(mode>5) mode<=1;
    end
end    
 
Display7SEG Display7SEG2(.inNum(mode), .Num7SEG(Led7SEG_2));

endmodule
