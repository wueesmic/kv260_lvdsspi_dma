`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2022 03:51:55 PM
// Design Name: 
// Module Name: SPI_trig_v2
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


module SPI_trig_v2(
    input wire clk,
    input wire trig,
    input wire i_TX_ready,
    //input reg[32:0] i_TX_Data,
    output reg o_TX_DV
    );
    
    reg[0:0] trig_flag;
    reg[0:0] ready_flag;
    reg[1:0] DV_flag;
    
    always @(posedge trig) begin
        o_TX_DV <= 1'b1; 
        DV_flag <= 2'h1;      
    end
    
    always @(posedge i_TX_ready) begin
        //o_TX_DV <= 1'b1; 
        DV_flag <= 2'h1;      
    end
    
    always @(posedge clk) begin
        if(DV_flag == 2'h1) begin
            //o_TX_DV <= 1'b0;
            DV_flag <= 2'h2;
        end 
        if(DV_flag == 2'h2) begin
            //o_TX_DV <= 1'b0;
            DV_flag <= 2'h0;
        end
    end
   
endmodule

