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
    input onesecond, rst, button,
    output reg [11:0] ledstring
    );
    reg RoL; //1=left 0=right

initial 
begin
    RoL = 0;
    ledstring=12'b0;
end
always @(posedge onesecond or posedge rst)
begin
    if(rst==1 || button ==1)
    begin
        RoL = 0;
        ledstring=12'b0;
    end
    else
    begin
        if(RoL ==  0)
        begin 
        ledstring <= (ledstring<<1) + 12'b000000000001;
            if(ledstring == 12'b111111111111)
            begin
                RoL <= 1;
                ledstring <= 12'b0;
            end
        end
        else
        begin
        ledstring <= (ledstring >>1)  + 12'b100000000000;
        if(ledstring == 12'b111111111111)
            begin
                RoL <=0;
                ledstring <= 12'b0;
            end
        end
    end
end
endmodule

