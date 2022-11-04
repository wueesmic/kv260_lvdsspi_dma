`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2022 01:20:06 PM
// Design Name: 
// Module Name: SPI_Slave_tb
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


module m_axis_tlast_gen_tb;
    
    // output
    wire axi_tvalid;
    wire axi_tlast;
    wire [31:0] axi_counter;

    // input
    reg axi_tready;
    reg axi_clk;  //same clk as axi works with
    reg axi_rst_L;

// FPAG Clk gen
	always begin
      axi_clk = 1'b1;
      #5 axi_clk = 1'b0;
      #5;
   end  

// SPI Master Clk gena
//	always begin
//      i_SPI_Clk = 1'b1;
//      #50 i_SPI_Clk = 1'b0;
//      #50;
//   end  

    m_axis_tlast_gen uut (
        .axi_tvalid(axi_tvalid), // o
        .axi_tlast(axi_tlast), // o
        .axi_counter(axi_counter), // 31:0 o
        .axi_tready(axi_tready), // i
        .axi_clk(axi_clk), // i
        .axi_rst_L(axi_rst_L) // i
        );
    
    initial begin
		// Initialize Inputs
		axi_rst_L = 1'b1;
		#10;
		axi_rst_L = 1'b0;
		#10;
		axi_rst_L = 1'b1;
		axi_tready = 1'b0;
		#10;
		axi_tready = 1'b1;

	end		
endmodule