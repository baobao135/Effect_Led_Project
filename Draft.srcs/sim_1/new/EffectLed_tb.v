`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 11:18:21 PM
// Design Name: 
// Module Name: EffectLed_tb
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


module EffectLed_tb();
    reg clk, rst, switch;
    reg [1:0]button;
    wire [11:0] Led;
    wire [0:6] Led7SEG_2;
    
    EffectLed uut(.clk(clk), .rst(rst), .switch(switch), .button(button), .Led(Led),.Led7SEG_2(Led7SEG_2));
                    
    initial begin
        clk =0;
        forever begin
            #1clk=~clk;
        end
    end
    
    initial begin
    rst=0;
    button[0]=0;
    button[1]=0;
    #20
    button[1]=1;
    #30
    button[1]=0;
    
   
    #2000
    $finish;
    end
endmodule
