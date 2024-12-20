`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2024 12:29:33 PM
// Design Name: 
// Module Name: autoSwitch
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


module autoSwitch(
    input onesecond, rst,
    output reg [3:0] autoSwitch
    );
    reg [4:0] countSwitch;
    
initial
begin
    countSwitch =0;
    autoSwitch=1;
end
    
always @(posedge onesecond or posedge rst)
begin
    if(rst==1) autoSwitch <= 1;
    else
    begin
        countSwitch = countSwitch + 1;
        if(countSwitch==25)
        begin
            autoSwitch <= autoSwitch + 1;
            countSwitch <= 0;
            if (autoSwitch >= 6)
                autoSwitch <= 1;
        end
    end
end
endmodule
