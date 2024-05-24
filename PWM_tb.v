`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2024 09:31:31 PM
// Design Name: 
// Module Name: PWM_tb
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


module PWM_tb(

    );
    reg restart_tb = 0,RightButton_tb = 0,LeftButton_tb = 0,SeventyF_button_tb = 0,twentyF_button_tb = 0;
    reg clk_tb = 0;
    wire led_tb;
    wire [26:0] duty_cycleMulti7_tb;
    localparam period = 500;
    PWM_counter UUT0(.restart(restart_tb),.RightButton(RightButton_tb),.LeftButton(LeftButton_tb),.SeventyF_button(SeventyF_button_tb)
    ,.twentyF_button(twentyF_button_tb),.clk(clk_tb),.led(led_tb),.duty_cycleMulti7(duty_cycleMulti7_tb));
//     integer i;
     always begin
         #5 clk_tb = ~clk_tb;  // Toggle clk_tb every 5ns
      end
     initial begin
test all 32 button cases
//     for(i = 0; i < 32; i = i + 1)begin
//        {restart_tb,RightButton_tb,LeftButton_tb,,SeventyF_button_tb,twentyF_button_tb} = i;
//        #period;
//     end
      
  end
endmodule
