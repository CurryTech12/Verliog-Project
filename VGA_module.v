`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
// Create Date: 04/09/2024 07:40:45 PM
// Design Name: 
// Module Name: VGA_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Co mments:
// 
//////////////////////////////////////////////////////////////////////////////////


module horizontal_vertical_counter(
    input mhz_clk,//takes in the 25mhz clock
    input [3:0] red_change,
    input [3:0] green_change,
    input [3:0] blue_change,
    input [26:0] dutyValue,
    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue,
    output hsync,vsync
    );
    reg [15:0] H_count = 0;//the counter value counts up to 800 
    reg [15:0] vertical_Count = 0;
    reg enable_vertical_count = 0;
    reg [9:0] next_start;
    reg [9:0] next_start1;
    reg [2:0] number;
    reg [2:0] number1;
    always@(posedge mhz_clk)begin
        if(H_count < 799) begin
            H_count <= H_count + 1;//increment the horizontal counter
            enable_vertical_count <=0;
       end else begin
            H_count <= 0;//reset the horizontal counter
            enable_vertical_count <= 1;//when horizontal done counting trigger vertical counter
        end
    end
    
    always@(posedge mhz_clk)begin
        if(enable_vertical_count == 1'b1)begin
           if(vertical_Count < 524) begin
             vertical_Count <= vertical_Count + 1;//increment the vertical counter
        end else begin
             vertical_Count <= 0;//reset the vertical counter
          end
       end
    end
        //negataive sync logic
         assign hsync = (H_count >= 0 && H_count >= 96) ? 1 : 0;
         assign vsync = (vertical_Count >= 0 && vertical_Count >= 2) ? 1 : 0;    
           
           always@(posedge mhz_clk) begin
           next_start = ((dutyValue * 6) + 144);
           next_start1 = (((100 - dutyValue) * 6) + next_start);
           if(dutyValue == 0)begin
                number = 0;
           end else begin
                number = 4;
           end
           if(dutyValue == 100)begin
               number1 = 0;
           end else begin
               number1 = 4;
           end
           // Check conditions for setting colors
               if (vertical_Count >= 130 && vertical_Count < 134) begin
                   if (H_count > 143 && H_count < (next_start + number)) begin
                       red <= red_change;
                       green <= green_change;
                       blue <= blue_change;
                   end else begin
                       red <= 4'h0;
                       blue <= 4'h0;
                       green <= 4'h0;
                   end
               end else if (vertical_Count >= 400 && vertical_Count < 404) begin
                   if (H_count > (next_start - 1) && H_count < next_start1 + number1) begin
                       red <= red_change;
                       green <= green_change;
                       blue <= blue_change;
                   end else begin
                       red <= 4'h0;
                       blue <= 4'h0;
                       green <= 4'h0;
                   end
               end else if (dutyValue != 0 && dutyValue != 100) begin
                  if((vertical_Count >= 130 && vertical_Count < 404))begin
    //               if (horizontal_counter >= next_start && horizontal_counter < (next_start + 4)) begin
                     if(H_count >= next_start && H_count < next_start + 4)begin
                       red <= red_change;
                       green <= green_change;
                       blue <= blue_change; // Example color
                     end else if (H_count > 143 && H_count < 148)begin
                        red <= red_change;
                        green <= green_change;
                        blue <= blue_change;
                     end else if(H_count >= next_start1 && H_count < next_start1 + 4)begin
                        red <= red_change;
                        green <= green_change;
                        blue <= blue_change;
                     end else begin
                        red <= 4'h0;
                        green <= 4'h0;
                        blue <= 4'h0;
                     end
                    end else begin
                        red <= 4'h0;
                        green <= 4'h0;
                        blue <= 4'h0;
                    end
               end else begin
                    red <= 4'h0;
                    green <= 4'h0;
                    blue <= 4'h0;
               end
              end
endmodule
