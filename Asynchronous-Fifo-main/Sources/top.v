// Filename: tt_um_Himank_fixed.sv
`timescale 1ns / 1ps

module tt_um_Himank #(
    parameter WIDTH = 4,
    parameter DEPTH = 8,
    parameter W_DIV = 12,   // write clock divider
    parameter R_DIV = 20    // read clock divider
)(
    input  wire clk_in,        // system clock
    input  wire rst_n,         // active-low reset
    input  wire wr_rq,         // write request
    input  wire rd_rq,         // read request
    input  wire [WIDTH-1:0] wdata,  // write data
    output wire full,          // FIFO full
    output wire empty,         // FIFO empty
    output wire [WIDTH-1:0] rdata,   // read data
    output wire w_clk,         // write clock output
    output wire r_clk          // read clock output
);

    // Pointer widths include extra bit for full/empty detection
    localparam ADDR_WIDTH = $clog2(DEPTH);
    localparam PTR_WIDTH = ADDR_WIDTH + 1;
    
    // Internal pointers
    reg [PTR_WIDTH-1:0] wptr, rptr;
    wire [PTR_WIDTH-1:0] wptr_gray, rptr_gray;
    reg [PTR_WIDTH-1:0] wptr_gray_sync1, wptr_gray_sync2;
    reg [PTR_WIDTH-1:0] rptr_gray_sync1, rptr_gray_sync2;
    
    // Convert binary to Gray code
    function automatic [PTR_WIDTH-1:0] bin2gray(input [PTR_WIDTH-1:0] bin);
        return bin ^ (bin >> 1);
    endfunction
    
    // Clock divider
    clock_divider #(
        .W_DIV(W_DIV),
        .R_DIV(R_DIV)
    ) clk_div_inst (
        .clk_in(clk_in),
        .rst_n(rst_n),
      
        .w_clk(w_clk),
        .r_clk(r_clk)
    );
    
    // FIFO memory
    reg [WIDTH-1:0] fifo [0:DEPTH-1];
    reg [WIDTH-1:0] rdata_reg;
    assign rdata = rdata_reg;
    
    // Addresses
    wire [ADDR_WIDTH-1:0] waddr = wptr[ADDR_WIDTH-1:0];
    wire [ADDR_WIDTH-1:0] raddr = rptr[ADDR_WIDTH-1:0];
    
    // Write pointer logic (write domain)
    always @(posedge w_clk or negedge rst_n) begin
        if (!rst_n) begin
            wptr <= 0;
        end else if (wr_rq && !full) begin
            wptr <= wptr + 1;
            fifo[waddr] <= wdata;
        end
    end
    
    // Read pointer logic (read domain)
    always @(posedge r_clk or negedge rst_n) begin
        if (!rst_n) begin
            rptr <= 0;
            rdata_reg <= 0;
        end else if (rd_rq && !empty) begin
            rptr <= rptr + 1;
          rdata_reg <= fifo[raddr+1];
        end
    end
    
    // Gray code conversion
    assign wptr_gray = bin2gray(wptr);
    assign rptr_gray = bin2gray(rptr);
    
    // Synchronize read pointer to write domain
    always @(posedge w_clk or negedge rst_n) begin
        if (!rst_n) begin
            rptr_gray_sync1 <= 0;
            rptr_gray_sync2 <= 0;
        end else begin
            rptr_gray_sync1 <= rptr_gray;
            rptr_gray_sync2 <= rptr_gray_sync1;
        end
    end
    
    // Synchronize write pointer to read domain
    always @(posedge r_clk or negedge rst_n) begin
        if (!rst_n) begin
            wptr_gray_sync1 <= 0;
            wptr_gray_sync2 <= 0;
        end else begin
            wptr_gray_sync1 <= wptr_gray;
            wptr_gray_sync2 <= wptr_gray_sync1;
        end
    end
    
    // Full and empty detection - CORRECTED
    assign empty = (rptr_gray == wptr_gray_sync2);
    
    // Corrected full condition
    assign full = (wptr_gray == {~rptr_gray_sync2[PTR_WIDTH-1:PTR_WIDTH-2], 
                                 rptr_gray_sync2[PTR_WIDTH-3:0]}) 
                  && (wptr[PTR_WIDTH-1] != rptr_gray_sync2[PTR_WIDTH-1]);

endmodule
