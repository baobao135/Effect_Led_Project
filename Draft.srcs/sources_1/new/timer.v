`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 11:17:52 PM
// Design Name: 
// Module Name: timer
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


module timer(
    input clk, rst, button,
    output reg onesecond
    );
    reg [31:0] count;
    wire [3:0]freq;
    
frequency freq1(.button(button),.rst(rst),.freq(freq));

////////////////////////////for test bench/////////////////////////////////////

always @(posedge clk)
begin
    if (rst==1 || button==1) count<=0;
    else
    begin
    count<=count+1;
        if (freq==1)
        begin
            if(count>=0 && count<=63) onesecond<=1;
            else if(count>63 && count<=125) onesecond<=0;
            else if (count>125)
            begin
                onesecond<=1;
                count<=0;
            end
        end
        else if(freq==2)
        begin
            if(count>=0 && count<=32) onesecond<=1;
            else if (count>32 && count<=63) onesecond<=0;
            else if (count>63 && count <=94) onesecond<=1;
            else if (count>94 && count<=125) onesecond<=0;
            else if (count>125)
            begin
                onesecond<=1;
                count<=0;
            end
        end
        else if(freq==4)
        begin
            if(count>=0 && count<=16) onesecond=1;
            else if (count>16 && count<=32) onesecond<=0;
            else if (count>32 && count <=47) onesecond<=1;
            else if (count>47 && count<=63) onesecond<=0;
            else if (count>63 && count <=78) onesecond<=1;
            else if (count>78 && count<=94) onesecond<=0;
            else if (count>94 && count <=109) onesecond<=1;
            else if (count>109 && count<=125) onesecond<=0;
            else if (count>125)
            begin
                onesecond<=1;
                count<=0;
            end
        end
    end
end
////////////////////////////real time//////////////////////////////////////////
//always @(posedge clk or posedge rst)
//begin
//    if (rst==1) count<=0;
//    else if(button==1) count<=0;
//    else
//    begin
//    count=count+1;
//        if (freq==1)
//        begin
//            if(count<=62499999) onesecond=1;
//            else if(count>62499999 && count<=124999999) onesecond=0;
//            else
//            begin
//                onesecond=0;
//                count=0;
//            end
//        end
//        else if(freq==2)
//        begin
//            if(count<=31249999) onesecond=1;
//            else if (count>31249999 && count<=62499999) onesecond=0;
//            else if (count>62499999 && count <=93749999) onesecond=1;
//            else if (count>93749999 && count<=124999999) onesecond=0;
//            else
//            begin
//                onesecond=0;
//                count=0;
//            end
//        end
//        else if(freq==4)
//        begin
//            if(count<=15624999) onesecond=1;
//            else if (count>15624999 && count<=31249999) onesecond=0;
//            else if (count>31249999 && count <=46874999) onesecond=1;
//            else if (count>46874999 && count<=62499999) onesecond=0;
//            else if (count>62499999 && count <=78124999) onesecond=1;
//            else if (count>78124999 && count<=93749999) onesecond=0;
//            else if (count>93749999 && count <=109374999) onesecond=1;
//            else if (count>109374999 && count<=124999999) onesecond=0;
//            else
//            begin
//                onesecond=0;
//                count=0;
//            end
//        end
//    end
//end
endmodule
