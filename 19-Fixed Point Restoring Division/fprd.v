`timescale 1ns / 1ps
//Author:Murat Celik
//Date:30.08.2023
//Fixed Point Restoring Division


module fprd(a, b, result, start);

  input [7:0] a;          // B�l�nen (8-bit)
  input [3:0] b;          // B�len (4-bit)
  output [7:0] result;    // Sonu� (8-bit)
  input start;            // B�lme i�leminin ba�latma flagi

  wire [3:0] b_bar;        // B�lenin bitlerinin tersi

  reg [3:0] b_neg;         // B�lme i�lemi i�in b�lenin Two's Complement
  reg [7:0] result;       
  reg [3:0] count;        

  assign b_bar = ~b;       // B�lenin tersini alma

  // Two's Complement
  always @(b_bar)
    b_neg = b_bar + 1;

  always @(posedge start)
  begin
    result = a;            // ilk atama
    count = 4'b0100;       //Counter Atama

    if ((a != 0) && (b != 0))  // B�l�nen ve b�len s�f�rdan farkl� m�?
      while (count)             // While Loop
      begin
        result = result << 1;   // 1 Shift et
        result = {result[7:4] + b_neg, result[3:0]};  

        if (result[7] == 1)     // MSB biti kontrolu
        begin
          result = {result[7:4] + b, result[3:1], 1'b0};  // Sonucu b�len ile ekleyerek g�ncelle
          count = count - 1;    // Ad�m sayac�n� bir azalt
        end
        else                    // MSB 0 ise
        begin
          result = {result[7:1], 1'b1};  // Sonucun en d���k bitini 1 yaparak g�ncelle
          count = count - 1;    // Ad�m sayac�n� bir azalt
        end
      end
  end

endmodule
