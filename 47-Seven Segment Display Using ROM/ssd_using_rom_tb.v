`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 12.09.2023
// Seven Segment Display Using ROM(Read Only Memory)
// Test Bench


module ssd_using_rom_tb;
    reg [3:0] digit_select;
    wire [6:0] segment_out;
    integer i;
    initial i=0;
    // Instantiate the seven_segment_display module
    ssd_using_rom uut (
        .digit_select(digit_select),
        .segment_out(segment_out)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Test stimulus generation
    initial begin
        // Initialize signals
        digit_select = 4'b0000;

        // Apply test cases
        $display("Time\tDigit Select\tSegment Output");
        for (i = 0; i < 10; i = i + 1) begin
            digit_select = i;
            #10; // Wait for a few clock cycles
            $display("%d\t%d\t\t%b", $time, i, segment_out);
        end

        // End the simulation
        $finish;
    end
endmodule
