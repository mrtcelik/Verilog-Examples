`timescale 1ns / 1ps

module bcd_to_ssd_tb;

  // Inputs
  reg [3:0] bcd;
  reg cs;

  // Outputs
  wire [6:0] seg;

  // Instantiate the bcd_to_ssd module
  bcd_to_ssd uut (
    .bcd(bcd),
    .cs(cs),
    .seg(seg)
  );

  initial begin
    // Initialize inputs
    bcd = 4'b0000;
    cs = 1;

    // Wait for a while before changing inputs
    #10;

    // Test case 1: Display "0"
    bcd = 4'b0000;
    cs = 0;
    #10 cs = 1;

    // Test case 2: Display "1"
    bcd = 4'b0001;
    cs = 0;
    #10 cs = 1;

    // Test case 3: Display "2"
    bcd = 4'b0010;
    cs = 0;
    #10 cs = 1;

    // Test case 4: Display "3"
    bcd = 4'b0011;
    cs = 0;
    #10 cs = 1;

    // Test case 5: Display "4"
    bcd = 4'b0100;
    cs = 0;
    #10 cs = 1;

    // Test case 6: Display "5"
    bcd = 4'b0101;
    cs = 0;
    #10 cs = 1;

    // Test case 7: Display "6"
    bcd = 4'b0110;
    cs = 0;
    #10 cs = 1;

    // Test case 8: Display "7"
    bcd = 4'b0111;
    cs = 0;
    #10 cs = 1;

    // Test case 9: Display "8"
    bcd = 4'b1000;
    cs = 0;
    #10 cs = 1;

    // Test case 10: Display "9"
    bcd = 4'b1001;
    cs = 0;
    #10 cs = 1;

    // Finish the simulation
    #10 $finish;
  end

endmodule
