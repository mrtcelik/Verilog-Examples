`timescale 1ns / 1ps
//Author:Murat Celik
//Date:30.08.2023
//Fixed Point Restoring Division 
//Test Bench

module fprd_tb;
reg [7:0] a;             // Bölünen (8-bit)
reg [3:0] b;             // Bölen (4-bit)
reg start;               // Bölme iþleminin baþlatma Flagi
wire [7:0] result;       // Sonuç (8-bit)

fprd dut(a, b, result, start);

initial 
begin
  #0;
  start = 1'b0;        // Flag Zero
  a = 8'b0000_1101;       // Bölünen 
  b = 4'b0101;            // Bölen 
  #10;
  start = 1'b1;       // Flag High
  #10; 
  start = 1'b0;       // Flag Zero

end

initial
begin
  $monitor ("Dividend = %b, Divisor = %b, Quotient = %b, Remainder = %b",
            a, b, result[3:0], result[7:4]);
  #300; 
  $finish; 
end

endmodule
