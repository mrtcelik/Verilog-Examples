`timescale 1ns / 1ps
//Author : Murat Çelik
//Date : 02.09.2023
//BCD Time Count
//Test Bench

module bcd_timeCount_tb;
 // Inputs
  reg clock;
  reg reset;

  // Outputs
  wire [3:0] ms_hr;
  wire [3:0] ls_hr;
  wire [3:0] ms_min;
  wire [3:0] ls_min;
  wire [3:0] ms_sec;
  wire [3:0] ls_sec;

  // Instantiate the BCD Counter module
  bcd_timeCount uut (
    .clock(clock),
    .reset(reset),
    .ms_hr(ms_hr),
    .ls_hr(ls_hr),
    .ms_min(ms_min),
    .ls_min(ls_min),
    .ms_sec(ms_sec),
    .ls_sec(ls_sec)
  );

  // Clock Generation (1Hz)
  reg clk_1hz = 0;
  always begin
    #5 clock = ~clock;
  end

  initial begin
    // Initialize inputs
    clock = 0;
    reset = 1; // Assert reset initially

    // De-assert reset after a few clock cycles
    #20 reset = 0;

    // Monitor and display the BCD output values
    $monitor("Time: %d%d:%d%d:%d%d", ms_hr, ls_hr, ms_min, ls_min, ms_sec, ls_sec);

    // Simulate for a few seconds
    #10000 $finish;
  end


endmodule
