`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2022 12:35:41 PM
// Design Name: 
// Module Name: SPI_trig
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


module SPI_trig #(parameter MAX_BYTE = 1)(
    input clk,
    input trig,
    input i_TX_ready,
    input [2:0] max_byte,
    //input reg[32:0] i_TX_Data,
    output reg o_TX_DV
    );
    
    reg[0:0] trig_flag = 0;
    reg[0:0] ready_flag = 0;
    reg[1:0] DV_flag = 0;
    reg[7:0] byte_count = 0;
    
    always @(posedge clk) begin
        //TX_ready
        if(i_TX_ready == 1'h0 && ready_flag == 1'h1) begin
            ready_flag <= 1'h0;  //reset flag
        end
        if(i_TX_ready == 1'h1 && ready_flag == 1'h0) begin
            ready_flag = 1'h1;  //set flag
            //o_TX_DV <= 1'b1;
            //DV_flag <= 2'h1;
            if(byte_count < MAX_BYTE) begin
                byte_count <= byte_count + 1'h1;
                o_TX_DV <= 1'b1;
                DV_flag <= 2'h1;
            end
        end
        //trig
        if(trig == 0 && trig_flag == 1'h1) begin
            trig_flag <= 1'h0;  //reset flag
        end
        if(trig == 1 && trig_flag == 1'h0 /*&& i_TX_ready == 1'h1 */) begin
            trig_flag = 1'h1;  //reset flag
            byte_count <= 8'h1; //reset byte_count
            o_TX_DV <= 1'b1;
            DV_flag <= 2'h1;
        end 
        //DV
        if(DV_flag == 2'h1) begin
            o_TX_DV = 1'b0;
            DV_flag <= 2'h0;
        end else if(DV_flag == 2'h2) begin
            o_TX_DV <= 1'b0;
            DV_flag <= 2'h0;
        end
    end
   
endmodule

