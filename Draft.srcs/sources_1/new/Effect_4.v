`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2024 12:02:29 AM
// Design Name: 
// Module Name: Effect_5
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


module Effect_4(
    input onesecond, button,
    output reg [11:0] ledstring
    );
    reg tmp; // 0 in -> out
    reg [3:0] left;
    reg [3:0] right;
    
initial begin
    tmp = 0;
    left = 0;
    right =11;
    ledstring = 12'b00000000000;
end
always @(posedge onesecond)
begin //1
    if(button == 1)
    begin
        tmp = 0;
        left = 0;
        right =11;
        ledstring = 12'b00000000000;
    end
    else
    begin
        if(tmp == 0)
        begin  //2
            if(right >=6)
            begin //3
                ledstring[left] <= 1;
                ledstring[right]<= 1;
                left <= left +1;
                right <= right -1;
            end //3
            else 
            begin //4
                ledstring <= 12'b000000000000;
                tmp <=1;
                left <= 5;
                right <= 6;
            end  //4
        end  //2
        else
        begin //5
            if(right <= 11)
            begin //6
                ledstring[left] <= 1;
                ledstring[right]<= 1;
                left <= left -1;
                right <= right +1;
            end //6
            else 
            begin  //7
                ledstring <= 12'b000000000000;
                tmp <=0;
                left <= 0;
                right <= 11;
            end  //7
        end //5
    end
end  //1
endmodule