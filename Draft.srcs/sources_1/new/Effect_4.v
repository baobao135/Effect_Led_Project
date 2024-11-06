`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2024 12:00:00 AM
// Design Name: 
// Module Name: Effect_4
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
    input onesecond,
    output reg [11:0] ledstring
    );
    reg IorO; // 0 in -> out
    reg [3:0] left;
    reg [3:0] right;
    
initial 
begin
    IorO = 0;
    left = 0;
    right = 11;
    ledstring = 12'b00000000000;
end
always @(posedge onesecond)
begin //7
    if(IorO == 0)
    begin  //6
        if(left <= 5)
        begin  //5
            ledstring[right] <= 1;
            ledstring[left] <= 1;
            left <= left + 1;
            right <= right -1;
        end  //5
        else
        begin  //4
            ledstring <= 12'b0;
            IorO <= 1;
            left <= 5;
            right <= 6;
        end  //4
    end  //6
    else 
    begin //3
        if(left>=0)
        begin // 1
            ledstring[left] <=1;
            ledstring[right] <= 1;
            left <= left - 1;
            right <= right + 1;
        end  // 1
        else
        begin //2
            IorO <= 0;
            left <=0;
            right <=11;
            ledstring <= 12'b0;
        end  //2
    end  //3
end  //7
endmodule

