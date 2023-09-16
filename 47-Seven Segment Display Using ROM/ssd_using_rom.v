`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 12.09.2023
// Seven Segment Display Using ROM(Read Only Memory)


module ssd_using_rom(
    input wire [3:0] digit_select, // 4-bit input to select the digit
    output wire [6:0] segment_out // 7-bit output for seven-segment display
);
reg [6:0] rom [9:0]; // ROM to store segment patterns for digits 0 to 9

assign segment_out = rom[digit_select];

// ROM initialization
initial begin
    rom[0] = 7'b00111111; // Digit 0
    rom[1] = 7'b00000110; // Digit 1
    rom[2] = 7'b01011011; // Digit 2
    rom[3] = 7'b01001111; // Digit 3
    rom[4] = 7'b01100110; // Digit 4
    rom[5] = 7'b01101101; // Digit 5
    rom[6] = 7'b01111101; // Digit 6
    rom[7] = 7'b00000111; // Digit 7
    rom[8] = 7'b01111111; // Digit 8
    rom[9] = 7'b01101111; // Digit 9
end

endmodule
