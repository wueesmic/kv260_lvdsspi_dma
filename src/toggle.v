`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2022 11:25:08 AM
// Design Name: 
// Module Name: toggle
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


module toggle
    #(parameter TON_us = 50,
    parameter TOFF_us = 50,
    parameter CLK_FREQ_MHz = 100)
    (
    input wire clk,
    output reg toggle_OUT
    );
    
    reg[31:0] counter = 0;
    
    always @(posedge clk) begin
        counter <= counter + 1;
        if(counter == (TON_us)*CLK_FREQ_MHz) begin
            toggle_OUT = 1'b0;
        end
        if(counter >= ((TON_us+TOFF_us)*CLK_FREQ_MHz)) begin
            toggle_OUT = 1'b1;
            counter <= 0;
        end
    end
    
    
endmodule
