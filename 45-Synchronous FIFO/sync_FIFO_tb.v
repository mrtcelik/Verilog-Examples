`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 13.09.2023

module sync_FIFO_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Saat periyodu (örneðin: 10 birim zaman)
  parameter DATA_WIDTH = 8;
  parameter ADDR_WIDTH = 8;
  parameter RAM_DEPTH = (1 << ADDR_WIDTH);

  // Signals
  reg clk;
  reg rst;
  reg wr_cs;
  reg rd_cs;
  reg rd_en;
  reg wr_en;
  reg [DATA_WIDTH-1:0] data_in;
  wire full;
  wire empty;
  wire [DATA_WIDTH-1:0] data_out;

  // UUT
  sync_FIFO my_fifo (
    .clk(clk),
    .rst(rst),
    .wr_cs(wr_cs),
    .rd_cs(rd_cs),
    .data_in(data_in),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .data_out(data_out),
    .empty(empty),
    .full(full)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Tests
  initial begin
    clk = 0;
    rst = 1;
    wr_cs = 0;
    rd_cs = 0;
    rd_en = 0;
    wr_en = 0;
    data_in = 8'b00000000;

    // Reset the FIFO
    rst = 0;
    #10 rst = 1;

    // Test case 1: Write data into the FIFO
    wr_cs = 1;
    wr_en = 1;
    data_in = 8'b10101010;
    #20 wr_en = 0;

    // Test case 2: Read data from the FIFO
    rd_cs = 1;
    rd_en = 1;
    #20 rd_en = 0;

    $finish;
  end

  // Display relevant signals
  always @(posedge clk) begin
    $display("Time=%0t ns: wr_cs=%b, rd_cs=%b, wr_en=%b, rd_en=%b, data_in=%h, data_out=%h, empty=%b, full=%b", $time, wr_cs, rd_cs, wr_en, rd_en, data_in, data_out, empty, full);
  end

endmodule



