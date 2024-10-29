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
    reg clk,rst, switch;
    reg [1:0]button;
    wire [11:0] Led;
    wire [3:0] Led7SEG_1, Led7SEG_2;
    
    EffectLed uut(.clk(clk), .rst(rst), .switch(switch), .button(button), .Led(Led));
                    
    initial begin
        clk =0;
        forever begin
            #1clk=~clk;
        end
    end
    
    initial begin
    rst=0;
    switch=0;
    button[1]=0;
    button[0]=0;
    #10
    button[1]=0;
    #10
    button[1]=1;
    #10
    button[1]=0;
    #10
    button[1]=1;
    #10
    button[1]=0;
    #500;
    rst=0;
    button[0]=0;
    #200;
    rst=0;
    button[0]=1;
    #200;
    rst=0;
    #800;
    $finish;
    end
endmodule
