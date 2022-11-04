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


module SPI_Master_sclRX_18bit_tb;
   
   //input
   reg        i_Rst_L;     // FPGA Reset
   reg        i_Clk;       // FPGA Clock
   wire        i_sclRX;     // delayd scl for RX byte
   
   // TX (MOSI) Signals
   reg [3-1:0] i_TX_Count;  // # bytes per CS low
   reg [18-1:0]  i_TX_Byte;       // Byte to transmit on MOSI
   reg        i_TX_DV;         // Data Valid Pulse with i_TX_Byte
   
   //output
   wire       o_TX_Ready;      // Transmit Ready for next byte
   
   // RX (MISO) Signals
   wire [3-1:0] o_RX_Count;  // Index RX byte
   wire       o_RX_DV;     // Data Valid pulse (1 clock cycle)
   wire [18-1:0] o_RX_Byte;   // Byte received on MISO

   // SPI Interface
   wire o_SPI_Clk;
   reg  i_SPI_MISO;
   wire o_SPI_MOSI;
   wire o_SPI_CS_n;
   

    // FPAG Clk geno_RXi_Rst_L_Count
	always begin
      i_Clk = 1'b1;
      #5 i_Clk = 1'b0;
      #5;
   end  
    
//    integer i = 0;
//    // SPI Master Clk gena
//	always begin
//      scl = 1'b0;
//      #200;
//      for(i = 0; i<=7; i = i+1)begin
//          #50 scl = 1'b1; 
//          #50 scl = 1'b0;
//      end
//   end  

    assign i_sclRX = o_SPI_Clk;
    
    
    SPI_Master_SingleCS_sclRX_18bit #(.BIT_PER_TRANSFER(18),
    .MAX_BYTES_PER_CS(2)) uut (
        .i_Rst_L(i_Rst_L), // o
        .i_Clk(i_Clk), // o
        .i_sclRX(i_sclRX), // 31:0 o
        .i_TX_Count(i_TX_Count),
        .i_TX_Byte(i_TX_Byte), // o
        .i_TX_DV(i_TX_DV), // o
        .o_TX_Ready(o_TX_Ready), // 31:0 o
        .o_RX_Count(o_RX_Count),
        .o_RX_DV(o_RX_DV), // o
        .o_RX_Byte(o_RX_Byte),
        .o_SPI_Clk(o_SPI_Clk), // 31:0 o
        .i_SPI_MISO(i_SPI_MISO),
        .o_SPI_MOSI(o_SPI_MOSI), // o
        .o_SPI_CS_n(o_SPI_CS_n)
        );
    
    initial begin
		// Initialize Inputs
		i_Rst_L = 1'b1;
		#10;
		i_Rst_L = 1'b0;
		#10;
		i_Rst_L = 1'b1;
		
		i_TX_Byte = 64'h3aaaa;
        i_TX_DV = 1;
        i_SPI_MISO = 1;
        #5
        i_TX_DV = 0;
        #35
        i_SPI_MISO = 0;
        #40
        i_SPI_MISO = 1;
        #120
        i_SPI_MISO = 0;
        #240
        i_SPI_MISO = 1;
        #40
        i_SPI_MISO = 0;
        #40
        i_SPI_MISO = 1;
        #120
        i_SPI_MISO = 0;
        #90
        i_TX_DV = 1;
        #5
        i_TX_DV = 0;



	end		
endmodule