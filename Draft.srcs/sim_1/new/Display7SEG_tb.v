`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2024 02:27:30 PM
// Design Name: 
// Module Name: Display7SEG_tb
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


module Display7SEG_tb();

    reg [3:0] inNum;
    wire [0:6] Num7SEG;
    Display7SEG uut(.inNum(inNum), .Num7SEG(Num7SEG));
    
    initial
    begin
    inNum=4'b0001;
    #300
    inNum=4'b0100;
    #200
    inNum=4'b0010;
    $finish;
    end
endmodule
