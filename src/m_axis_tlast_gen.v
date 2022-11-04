`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2022 12:31:11 PM
// Design Name: 
// Module Name: m_axis_tlast_gen
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


module m_axis_tlast_gen
    #(parameter NUM_BYTES = 512)
    (
    output reg axi_tvalid,
    input axi_tready,
    input axi_clk,  //same clk as axi works with
    input axi_rst_L,
    output reg axi_tlast,
    output reg [31:0] axi_counter
    );
    
    //reg [31:0] counter = 0;
    
    always @(posedge axi_clk) begin
        if(~axi_rst_L) begin
            axi_counter <= 0;
            axi_tlast <= 0;
            axi_tvalid <= 0;
        end else begin
            if(/*axi_tvalid == 1 && */ axi_tready == 1) begin
                axi_counter <= axi_counter +1;
                axi_tvalid <= 1;
            end
            if (axi_counter == (NUM_BYTES-1)) begin
                axi_tlast <= 1;
            end else begin
                axi_tlast <= 0;
            end
            if (axi_counter >= (NUM_BYTES)) begin
                axi_tlast <= 0;
                axi_counter <= 0;
                axi_tvalid <= 0;
            end
        end
    end
endmodule
