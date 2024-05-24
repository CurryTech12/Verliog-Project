`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2024 11:22:25 PM
// Design Name: 
// Module Name: PWM_counter
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


module PWM_counter(
input restart,RightButton,LeftButton,SeventyF_button,twentyF_button,
input clk,//input which is a clk that drives the counter
output led,//output which is where the pwm signal goes
output [26:0] duty_cycleMulti7
    );

reg [13:0] switches = 10000;
reg [13:0] counter = 1;//like keil c is something that we are updating the value to
reg [26:0] duty_cycle = 5000;//this stores the counter value of the period starts at zero size is 8bit
always@(posedge clk) begin//at posede of clock check these statements
    if (counter < switches) counter <= counter + 1;// count up if counter is less than switch value
    else counter <= 1;//restart counter value
    /* 
        if restart button is clicked
        duty cycle is reset back to 50%
    */
       
       // Handle button presses
       // Check if restart button is pressed
       if (restart && !RightButton && !LeftButton && !SeventyF_button && !twentyF_button) begin
           duty_cycle = 5000;
           counter <= 1;
       end
       // Check if SeventyF_button is pressed
       else if (!restart && !RightButton && !LeftButton && SeventyF_button && !twentyF_button) begin
           duty_cycle = 7500;
           counter <= 1;
       end
       // Check if twentyF_button is pressed
       else if (!restart && !RightButton && !LeftButton && !SeventyF_button && twentyF_button) begin
           duty_cycle = 2500;
           counter <= 1;
       end
       // Check if RightButton (increase duty cycle) is pressed
       else if (!restart && RightButton && !LeftButton && !SeventyF_button && !twentyF_button) begin
           if (duty_cycle < 10000) begin
               duty_cycle <= duty_cycle + 100;
               counter <= 1;
           end else begin
                duty_cycle = 10000;
                counter <= 1;
           end
       end
       // Check if LeftButton (decrease duty cycle) is pressed
       else if (!restart && !RightButton && LeftButton && !SeventyF_button && !twentyF_button) begin
           if (duty_cycle > 0) begin
               duty_cycle <= duty_cycle - 100;
               counter <= 1;
           end else begin
                duty_cycle = 0;
                counter <= 1;
           end
       end else begin
       end
       // No buttons pressed: keep current duty cycle
   end
/*
   Led gets updated with the counter and duty cycle value
*/
assign duty_cycleMulti7 = (duty_cycle * 100)/(switches);
assign led = (counter <= duty_cycle) ? 1:0;
endmodule
