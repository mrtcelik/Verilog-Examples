`timescale 1ns / 1ps
//Author : Murat Celik
//Date : 02.09.2023
//D Latch Using 2x1 Mux 
//Test Bench

module d_latch_2x1mux_tb;
 // Inputs
  reg data;
  reg clk;

  // Outputs
  wire out;

  // Instantiate the D latch with 2x1 MUX
  d_latch_2x1_mux uut (
    .data(data),
    .clk(clk),
    .out(out)
  );

  // Clock generation
  always begin
    clk = 0;
    #5; // Change the clock every 5 time units
    clk = 1;
    #5;
  end

  // Test 
  initial begin
    // Test case 1
    data = 0;
    #10;
    $display("Test Case 1: Data = 0, Clock = 1, Out = %b", out);
    
    // Test case 2
    data = 1;
    #10;
    $display("Test Case 2: Data = 1, Clock = 1, Out = %b", out);
    
    // Test case 3
    clk = 0;
    data = 0;
    #10;
    $display("Test Case 3: Data = 0, Clock = 0, Out = %b", out);
    
    // Test case 4
    clk = 1;
    data = 1;
    #10;
    $display("Test Case 4: Data = 1, Clock = 1, Out = %b", out);
    
    $finish;
  end
endmodule