// vim: set ts=4 sw=4 tw=0 et
//////////////////////////////////////////////////

`timescale 1ns / 1ps

module axi_counter #(
    // Width of data bus in bits
    parameter DATA_WIDTH = 32,
    // Width of wstrb (width of data bus in words)
    parameter STRB_WIDTH = (DATA_WIDTH/8),
    // Width of counter in bits (counts from = to 2^CNT_WIDTH-1 )
    parameter CNT_WIDTH = 9, //( 0- 511)
    // to which number should the counter count?
    parameter CNT_MAX = 511, //( 0 - 511)
    // Width of counter in bits (counts from = to 2^CNT_WIDTH-1 )
    parameter KEEP_WIDTH = 1 //(
)
    (
        input  clk,
        input  rst_L,
        /*
        * AXI lite master interface
        */
        output m_axis_tvalid,
        input  m_axis_tready,

        output [DATA_WIDTH-1:0] m_axis_tdata,
        output [KEEP_WIDTH-1:0]   m_axis_tkeep,

        output m_axis_tlast
    );

    assign m_axis_tkeep =  {KEEP_WIDTH{1'b1}};
    reg [DATA_WIDTH-1:0] counter_r = 'h00;
    reg last_r = 1'b0;
    reg valid_r = 1'b0;
    reg zeroflag_r = 1'b1;
    
    assign m_axis_tdata = counter_r;
    //assign m_axis_tvalid = 1'b1; // Allways valid
    assign m_axis_tvalid = valid_r;
    assign m_axis_tlast = last_r;
    

    always @ (posedge clk or negedge rst_L)
        if (~rst_L) begin
            counter_r  <= 'h00;
            last_r <= 1'b0;
            valid_r <= 1'b0;
        end else begin
            if(/*axi_tvalid == 1 && */ m_axis_tready == 1'b1) begin
                if(zeroflag_r == 1'b1) begin
                    //counter_r <= 32'd0;
                    zeroflag_r <= 1'b0;
                end else begin
                    counter_r <= counter_r + 1'd1;
                end
                valid_r <= 1'b1;
            end
            if (counter_r == (CNT_MAX-1)) begin
                last_r <= 1'b1;
            end else begin
                last_r <= 1'b0;
            end
            if (counter_r >= (CNT_MAX)) begin
                last_r <= 1'b0;
                //counter_r[CNT_WIDTH-1:0] <= {CNT_WIDTH{1'b1}};
                counter_r <= 32'd0;
                zeroflag_r <= 1'b1;
                valid_r <= 1'b0;
            end
        
//            if (m_axis_tready) begin  // Count if AXI slave is ready
//                counter_r <= counter_r + 1;
//                valid_r <= 1'b1;
//                if (counter_r[CNT_WIDTH-1:0] == {CNT_WIDTH{1'b1}}) begin //{CNT_WIDTH{1'b1}}) // CNT_WIDTH'd512
//                    last_r <= 1'b1;
//                end else begin
//                    last_r <= 1'b0;
//                end
//            end
        end
        
        

endmodule