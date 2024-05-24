`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 11:01:40 PM
// Design Name: 
// Module Name: vga_sim
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


module vga_sim(

    );
    reg [3:0] red_change_tb;
    reg [3:0] green_change_tb;
    reg [3:0] blue_change_tb;
    reg [26:0] dutyValue_tb = 50;
    reg clk_tb = 0;
    wire Hsync_tb;
    wire Vsync_tb;
    wire [3:0] BLUE_tb;
    wire [3:0] green_tb;
    wire [3:0] red_tb;
    
        
        horizontal_vertical_counter UUT0 (.mhz_clk(clk_tb),.red_change(red_change_tb),.green_change(green_change_tb),.blue_change(blue_change_tb),.dutyValue(dutyValue_tb),.hsync(Hsync_tb),.vsync(Vsync_tb),.blue(BLUE_tb),.green(green_tb),.red(red_tb));
        always#20 clk_tb = ~clk_tb;
        initial begin
            red_change_tb = 16;
            green_change_tb = 16;
            blue_change_tb = 16;
        end
endmodule
