`timescale 1ns / 1ps

module testbench();

    parameter WIDTH = 4, DEPTH = 8;
    parameter W_DIV = 4;  // 100MHz/4 = 25MHz write clock
    parameter R_DIV = 6;  // 100MHz/6 ≈ 16.67MHz read clock

    reg clk_in;
    reg rst_n;
    reg wr_rq, rd_rq;
    wire full, empty;
    reg [WIDTH-1:0] wdata;
    wire [WIDTH-1:0] rdata;

    // Reference model
    reg [WIDTH-1:0] ref_fifo [0:DEPTH-1];
    reg [$clog2(DEPTH)-1:0] wptr;
    reg [$clog2(DEPTH)-1:0] rptr;
    reg [WIDTH-1:0] expected_data;
    integer error_count = 0;

    // Get clocks from DUT
    wire w_clk;
    wire r_clk;

    // Instantiate DUT
    tt_um_Himank #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH),
        .W_DIV(W_DIV),
        .R_DIV(R_DIV)
    ) fifo_inst (
        .clk_in(clk_in),
        .rst_n(rst_n),
        .wr_rq(wr_rq),
        .rd_rq(rd_rq),
        .wdata(wdata),
        .rdata(rdata),
        .full(full),
        .empty(empty),
        .w_clk(w_clk),    // Connect internal clocks
        .r_clk(r_clk)     // to testbench wires
    );

    // Main clock (100MHz)
    initial begin
        clk_in = 0;
        forever #5 clk_in = ~clk_in;
    end

    // Seed random for reproducibility using a dedicated seed variable
    integer seed;
    initial begin
        seed = 1;  // Set seed value
    end

    // Waveform dumping
    initial begin
        $dumpfile("fifo_waveform.vcd");  // VCD file name
        $dumpvars(0, testbench);          // Dump all signals in testbench and instantiated modules
    end

    // Reset and stimulus
    initial begin
        // Initialize
        rst_n = 1;
        wr_rq = 0;
        rd_rq = 0;
        wdata = 0;
        wptr = 0;
        rptr = 0;
        for (int i = 0; i < DEPTH; i++) ref_fifo[i] = 0;
        expected_data = 0;

        // Reset sequence
        #10 rst_n = 0;
        #20; // Hold reset
        wptr = 0;
        rptr = 0;
        for (int i = 0; i < DEPTH; i++) ref_fifo[i] = 0;
        #10 rst_n = 1;

        // Start operations
        #15;
        wr_rq = 1;
        rd_rq = 1;

        fork
            // Write process uses FIFO's w_clk
            begin : write_block
                repeat (150) begin
                    @(posedge w_clk);
                    if (!full) begin
                        wdata = $random(seed);
                        ref_fifo[wptr] = wdata;
                        wptr = (wptr + 1) % DEPTH;
                        $display("WRITE: data=%0d wptr=%0d @%0t", wdata, wptr, $time);
                    end
                end
                wr_rq = 0;
            end

            // Read process uses FIFO's r_clk
            begin : read_block
                repeat (2) @(posedge r_clk); // Sync delay

                repeat (150) begin
                    @(posedge r_clk);
                    #1; // Sample after clock edge

                    if (!empty && rd_rq) begin
                        expected_data = ref_fifo[rptr];
                        if (rdata !== expected_data) begin
                            $display("ERROR: Expected %0d, got %0d @%0t (rptr=%0d)", 
                                     expected_data, rdata, $time, rptr);
                            error_count++;
                        end
                        else 
                            $display("READ OK: %0d rptr=%0d @%0t", rdata, rptr, $time);
                        rptr = (rptr + 1) % DEPTH;
                    end
                end
                rd_rq = 0;
            end
        join

        #100; // Allow pending operations
        if (error_count == 0)
            $display("Simulation completed successfully.");
        else
            $display("Simulation completed with %0d errors.", error_count);
        $finish;
    end

endmodule
