`timescale 1ns / 1ps
//Author:Murat Celik
//Date:30.08.2023
//Fixed Point Restoring Division


module fprd(a, b, result, start);

  input [7:0] a;          // Bölünen (8-bit)
  input [3:0] b;          // Bölen (4-bit)
  output [7:0] result;    // Sonuç (8-bit)
  input start;            // Bölme iþleminin baþlatma flagi

  wire [3:0] b_bar;        // Bölenin bitlerinin tersi

  reg [3:0] b_neg;         // Bölme iþlemi için bölenin Two's Complement
  reg [7:0] result;       
  reg [3:0] count;        

  assign b_bar = ~b;       // Bölenin tersini alma

  // Two's Complement
  always @(b_bar)
    b_neg = b_bar + 1;

  always @(posedge start)
  begin
    result = a;            // ilk atama
    count = 4'b0100;       //Counter Atama

    if ((a != 0) && (b != 0))  // Bölünen ve bölen sýfýrdan farklý mý?
      while (count)             // While Loop
      begin
        result = result << 1;   // 1 Shift et
        result = {result[7:4] + b_neg, result[3:0]};  

        if (result[7] == 1)     // MSB biti kontrolu
        begin
          result = {result[7:4] + b, result[3:1], 1'b0};  // Sonucu bölen ile ekleyerek güncelle
          count = count - 1;    // Adým sayacýný bir azalt
        end
        else                    // MSB 0 ise
        begin
          result = {result[7:1], 1'b1};  // Sonucun en düþük bitini 1 yaparak güncelle
          count = count - 1;    // Adým sayacýný bir azalt
        end
      end
  end

endmodule
