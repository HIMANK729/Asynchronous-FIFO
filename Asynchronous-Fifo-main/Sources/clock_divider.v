`timescale 1ns / 1ps
module clock_divider #(
    parameter integer W_DIV = 12,
    parameter integer R_DIV = 20
)(
    input  wire clk_in,
    input  wire rst_n,
    output reg  w_clk,
    output reg  r_clk
);

    // Counters for clock division
    integer w_cnt = 0;
    integer r_cnt = 0;

    initial begin
        w_clk = 1'b0;
        r_clk = 1'b0;
    end

    // Write clock divider
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            w_clk <= 1'b0;
            w_cnt <= 0;
        end else begin
            if (W_DIV <= 2) begin
                w_clk <= ~w_clk;
            end else begin
                if (w_cnt >= (W_DIV - 1)) begin
                    w_cnt <= 0;
                    w_clk <= ~w_clk;
                end else begin
                    w_cnt <= w_cnt + 1;
                end
            end
        end
    end

    // Read clock divider (FIXED)
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            r_clk <= 1'b0;
            r_cnt <= 0;
        end else begin
            if (R_DIV <= 2) begin
                r_clk <= ~r_clk;
            end else begin
                if (r_cnt >= (R_DIV - 1)) begin
                    r_cnt <= 0;
                    r_clk <= ~r_clk;
                end else begin
                    r_cnt <= r_cnt + 1;
                end
            end
        end
    end

endmodule

endmodule
