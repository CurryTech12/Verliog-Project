`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2024 11:38:42 PM
// Design Name: 
// Module Name: top_sim
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


module top_sim();
reg clk_in_tb = 0; 
wire clk_out_tb;
Slow_clk UUT(.clk_in(clk_in_tb),.clk_out(clk_out_tb));
always #5 clk_in_tb = ~clk_in_tb;
initial begin
end
endmodule
