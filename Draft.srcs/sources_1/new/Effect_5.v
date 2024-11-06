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


module Effect_5(
    input onesecond,
    output reg [11:0] ledstring
    );
    reg tmp; // 0 in -> out
    reg [3:0] left;
    reg [3:0] right;
    
initial begin
tmp = 0;
left = 11;
right = 5;
ledstring = 12'b00000000000;
end
always @(posedge onesecond)
begin //1
    if(tmp == 0)
    begin  //2
        if(left >=6)
        begin //3
            ledstring[left] <= 1;
            ledstring[right]<= 1;
            left <= left -1;
            right <= right -1;
        end //3
        else 
        begin //4
            ledstring <= 12'b000000000000;
            tmp <=1;
            left <= 6;
            right <= 0;
        end  //4
    end  //2
    else
    begin //5
        if(left <= 11)
        begin //6
            ledstring[left] <= 1;
            ledstring[right]<= 1;
            left <= left +1;
            right <= right +1;
        end //6
        else 
        begin  //7
            ledstring <= 12'b000000000000;
            tmp <=0;
            left <= 11;
            right <= 5;
        end  //7
    end //5
end  //1
endmodule

