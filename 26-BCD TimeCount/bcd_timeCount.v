`timescale 1ns / 1ps
//Author : Murat Çelik
//Date : 02.09.2023
//BCD Time Count


module bcd_timeCount(
  input wire clock,        // Input clock (1Hz)
  input wire reset,        // Active high synchronous reset
  output reg [3:0] ms_hr,  // Most significant digit of hours (BCD)
  output reg [3:0] ls_hr,  // Least significant digit of hours (BCD)
  output reg [3:0] ms_min, // Most significant digit of minutes (BCD)
  output reg [3:0] ls_min, // Least significant digit of minutes (BCD)
  output reg [3:0] ms_sec, // Most significant digit of seconds (BCD)
  output reg [3:0] ls_sec  // Least significant digit of seconds (BCD)
);

  reg [3:0] sec_count = 4'b0000; // Seconds counter (BCD)
  reg [3:0] min_count = 4'b0000; // Minutes counter (BCD)
  reg [3:0] hr_count = 4'b0000;  // Hours counter (BCD)

  always @(posedge clock or posedge reset) begin
    if (reset) begin
      sec_count <= 4'b0000;
      min_count <= 4'b0000;
      hr_count <= 4'b0000;
    end else begin
      if (sec_count == 4'b1001) begin
        sec_count <= 4'b0000;
        if (min_count == 4'b1001) begin
          min_count <= 4'b0000;
          if (hr_count == 4'b0011) begin
            hr_count <= 4'b0000;
          end else begin
            hr_count <= hr_count + 1;
          end
        end else begin
          min_count <= min_count + 1;
        end
      end else begin
        sec_count <= sec_count + 1;
      end
    end
  end

  always @(*) begin
    // BCD conversion for seconds, minutes, and hours
    ls_sec = sec_count % 10;
    ms_sec = sec_count / 10;
    ls_min = min_count % 10;
    ms_min = min_count / 10;
    ls_hr = hr_count % 10;
    ms_hr = hr_count / 10;
  end

endmodule
