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


module scl_delay_tb;
    
    // output
    wire scl_del;

    // input
    reg clk;
    reg scl;  //same clk as axi works with
    reg rst_L;

    // FPAG Clk gen
	always begin
      clk = 1'b1;
      #5 clk = 1'b0;
      #5;
   end  

    integer i = 0;
    // SPI Master Clk gena
	always begin
      scl = 1'b0;
      #200;
      for(i = 0; i<=7; i = i+1)begin
          #50 scl = 1'b1; 
          #50 scl = 1'b0;
      end
   end

    scl_delay #(.DELAY_PULSES(12)) uut (
        .scl_del(scl_del), // o
        .clk(clk), // o
        .scl(scl), // 31:0 o
        .rst_L(rst_L)
        );
    
    initial begin
		// Initialize Inputs
		rst_L = 1'b1;
		#10;
		rst_L = 1'b0;
		#10;
		rst_L = 1'b1;
		#310;
		scl = 1'b0;

	end		
endmodule