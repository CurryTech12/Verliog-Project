`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2024 02:58:44 PM
// Design Name: 
// Module Name: display_tb
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


module display_tb(

    );
    reg clk_tb = 0;
    reg [26:0] number_tb;
    wire [7:0] anode_tb;
    integer i;
    localparam period = 200;
    display_number UUT0(.clk(clk_tb),.number(number_tb),.anode(anode_tb));
    always begin
        #20 clk_tb = ~clk_tb;
    end
    initial begin
    for(i = 0; i <= 100; i = i +1)begin
        {number_tb} = i;
        #period;
    end
    $finish;
    end
endmodule
