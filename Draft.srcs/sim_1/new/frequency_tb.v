`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 12:05:01 AM
// Design Name: 
// Module Name: frequency_tb
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


module frequency_tb();
    reg button, rst;
    wire [3:0]freq;
    
frequency uut(.button(button), .rst(rst), .freq(freq));

initial
begin
    button=0;
    rst=0;
    #50;
    button=1;
    rst=0;
    #50
    button=0;
    rst=0;
    #50
    button=1;
    rst=0;
    #50
    button =0;
    rst=0;
    #50
    button=1;
    rst=0;
    #50
    button=0;
    #50
    button=1;
    #50
    rst=1;
    button=0;
    #50
    button=1;
    $finish;
    
end
endmodule
