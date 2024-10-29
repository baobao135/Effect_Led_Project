`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 01:39:59 AM
// Design Name: 
// Module Name: Effect_3_tb
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


module Effect_3_tb();
    reg clk, rst, button;
    wire [11:0] ledstring;
    
Effect_3 uut(.clk(clk), .rst(rst), .button(button), .ledstring(ledstring));

initial
begin
    clk=0;
    forever
    begin
        #1clk=~clk;
    end
end

initial
begin
    button=0;
    rst=0;
    #10
    button=0;
    #300
    button=1;
    #10
    button=0;
    #750
    
    $finish;
end

endmodule
