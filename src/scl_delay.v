`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2022 10:53:08 AM
// Design Name: 
// Module Name: scl_delay
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


module scl_delay #(
    // Delay in number of pulses
    parameter DELAY_PULSES = 1)
    (
        input  clk, //at least 5 times faster than scl
        input  scl,
        input  rst_L,
        output scl_del
    );
    
    reg[DELAY_PULSES:0] buffer = 32'b0000;
    
    assign scl_del = buffer[0:0];
      
      //2te versuech mit buffer
    always @(posedge clk) begin
        //pos_counter <= pos_counter + 1'b1;
        buffer[DELAY_PULSES-1:DELAY_PULSES-1] <= scl;
//        if(scl == 1'b1) begin
//            buffer[DELAY_PULSES:DELAY_PULSES] <= 1'b1;
//            //buffer[30:0] <= {1'b0, buffer[31:1]};
//            //pos_flag <= pos_flag + 1'b1;
//        end else if(scl == 1'b0) begin
//            buffer[DELAY_PULSES:DELAY_PULSES] <= 2'b00;
//            //buffer[30:0] <= {1'b0, buffer[31:1]};
//            //neg_flag <= neg_flag + 1'b1;
//        end
        buffer[DELAY_PULSES-1:0] = buffer[DELAY_PULSES:1];
    end
    
    
    
endmodule
    