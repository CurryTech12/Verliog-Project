`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2023 03:54:26 PM
// Design Name: 
// Module Name: D_tb
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


module D_FF_four_new_tb();

    // Inputs
    reg button_right_tb;
    reg button_left_tb;
    reg new_clk_tb;

    // Outputs
    wire signal_1_tb;
    wire signal_2_tb;
    // Instantiate the DUT
    D_FF_four_new UUT1 (
        .button_right(button_right_tb),
        .button_left(button_left_tb),
        .new_clk(new_clk_tb),
        .signal_1(signal_1_tb),
        .signal_2(signal_2_tb)
    );
    integer i;
    //integer z;
    // Clock generation
    initial begin
        new_clk_tb = 0;
        forever #5 new_clk_tb = ~new_clk_tb;  // 100 MHz clock (10 ns period)
    end
//    // Test stimulus
    
    initial begin
        // Initialize inputs
        button_right_tb = 0;
        button_left_tb = 0;
//        signal_1_tb = 0;
//        signal_2_tb = 0;
        // Wait for the initial reset
        #100;
        for(i = 0; i < 4; i = i + 1)begin
            {button_left_tb,button_right_tb} = i;
            $display("Testing button press debouncing... ",{button_left_tb,button_right_tb});
            #30 {button_left_tb,button_right_tb} = 0;
            #100;
//            @(posedge new_clk_tb)begin
//                for(z = 0; z < 1; z = z + 1)begin
//                end
//            end
            if(signal_1_tb == 0 && signal_2_tb == 0)begin
                $display("Both buttons not pressed passed ",{button_left_tb,button_right_tb}); 
            // Finish the simulation
            end else if(signal_1_tb == 1 && signal_2_tb == 0)begin
                $display("Right Button Passed ",{button_left_tb,button_right_tb}); 
                        // Finish the simulation
            end 
         end
         $finish;
       end
endmodule
