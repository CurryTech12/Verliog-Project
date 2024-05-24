`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 11:16:20 PM
// Design Name: 
// Module Name: Top
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


module Top(
    input clk,BUTTON_R,BUTTON_L,RESTART,BUTTONSEVEN,BUTTONTWENTY,
    input [3:0] blue_change1,
    input [3:0] red_change1,
    input [3:0] green_change1,
    output Hsync,
    output Vsync,
    output [3:0] blue,
    output [3:0] green,
    output [3:0] red,
    output wire PWM,
    output [7:0] cathode,
    output [7:0] anode
    );
   // reg [2:0] number;
//    reg [9:0] next_start;
//    reg [9:0] next_start1;
    wire [26:0] dutyValue;
    wire SIGNAL_R,SIGNAL_L;
    wire new_CLK;
    //dutyValue;
    //slow clock module 
    Slow_clk UUT0(.clk_in(clk),.clk_out(new_CLK));
    //four D_FF to debounce two buttons outputs two signals signal_one right
    // and signal_2 left
    D_FF_four_new UUT1(.new_clk(new_CLK),.button_left(BUTTON_L),.button_right(BUTTON_R),
    .signal_1(SIGNAL_R),.signal_2(SIGNAL_L));
    //take those two output signals as inputs into pwm module
    PWM_counter UUT2(.restart(RESTART),.RightButton(SIGNAL_R),.LeftButton(SIGNAL_L),.clk(new_CLK),
    .led(PWM),.duty_cycleMulti7(dutyValue),.SeventyF_button(BUTTONSEVEN),.twentyF_button(BUTTONTWENTY));
    //outputs the pwm signal at the clk frequency of 20hz from slowclk
    //every module has sync clk
    display_number UUT4(.clk(new_CLK),.number(dutyValue),.cathode(cathode),.anode(anode));
    horizontal_vertical_counter UUT5(.mhz_clk(new_CLK),.red_change(red_change1),.green_change(green_change1),.blue_change(blue_change1),.dutyValue(dutyValue)
    ,.hsync(Hsync),.vsync(Vsync),.red(red),.green(green),.blue(blue));
    
endmodule
