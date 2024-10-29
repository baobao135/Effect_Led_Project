`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 12:05:01 AM
// Design Name: 
// Module Name: timer_tb
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


module timer_tb();
    reg clk, button, rst;
    wire onesecond;
    
timer uut(.clk(clk), .rst(rst), .button(button), .onesecond(onesecond));
initial
begin
    clk =0;
    forever begin
        #1clk=~clk;
    end
end

initial 
begin
    button=0;
    rst=0;
    #250
    button=0;
    #10
    button=0;
    #250
    button=0;
    #10
    button=0;
    #250
    button=0;
    rst=1;
    #10
    button=0;
   
    
  $finish;
end
    
endmodule
