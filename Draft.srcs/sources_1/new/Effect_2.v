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
    input  onesecond, button,
    output reg [11:0] ledstring
    );
    reg RoL; //1=left 0=right
    reg [3:0] index;
    
    
initial 
begin
    RoL = 0;
    ledstring=12'b000000000001;
end
always @(posedge onesecond)
begin
    if(button == 1)
    begin
        RoL = 0;
        ledstring=12'b000000000001;
    end
    else
    begin
        if(RoL==0)
        begin
            ledstring <= (ledstring << 1);
            if(ledstring==12'b0)
            begin
                RoL <= 1;
                ledstring<=12'b100000000000;
            end
        end
        else
        begin
            ledstring <= (ledstring >> 1);
            if(ledstring==12'b0)
            begin
                RoL <= 0;
                ledstring <= 12'b000000000001;
            end
        end
    end
end 
endmodule