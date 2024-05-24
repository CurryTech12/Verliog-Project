//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 01/21/2024 08:33:29 PM
//// Design Name: 
//// Module Name: D_FF_two_new
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


module D_FF_four_new(
input  button_right,
input  button_left,
input  new_clk,
output  signal_1,
output  signal_2
    );
    wire q_1,q_2_inv;
    wire q_3,q_4_inv;
    wire inter_signal_1,inter_signal_2;
    //two D_FF for right button increment
    D_FF UUT1(.d(button_right),.clk(new_clk),.q1(q_1),.q_bar1());
    D_FF UUT2(.d(q_1),.clk(new_clk),.q1(),.q_bar1(q_2_inv));
    //two_DFF left button decrement
    D_FF UUT3(.d(button_left),.clk(new_clk),.q1(q_3),.q_bar1());
    D_FF UUT4(.d(q_3),.clk(new_clk),.q1(),.q_bar1(q_4_inv));
    assign inter_signal_1 = (q_1 & q_2_inv);
    assign inter_signal_2 = (q_3 & q_4_inv);
    reg [49999:0] delay_chain_1 = 50000'b0;
    reg [49999:0] delay_chain_2 = 50000'b0;
    
    always@(posedge new_clk)begin
           // Delay inter_signal_1 by 10 clock cycles
           delay_chain_1 <= {delay_chain_1[49998:0], inter_signal_1};
           // Delay inter_signal_2 by 10 clock cycles
           delay_chain_2 <= {delay_chain_2[49998:0], inter_signal_2};
      end
       // Assign the outputs to the end of the delay chains
       assign signal_1 = delay_chain_1[49999];
       assign signal_2 = delay_chain_2[49999];

endmodule



