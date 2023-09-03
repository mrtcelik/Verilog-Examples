`timescale 1ns / 1ps
//Author: Murat Celik
//Date:01.09.2023
//BCD Adder


module bcd_adder(a, b, c0, s, cout);
  input [3:0] a, b;    // Dört basamaklý BCD sayýlarý, a ve b giriþleri.
  input c0;            // Tasima biti Girisi
  output reg [3:0] s;  // Dört basamaklý BCD sonucu, s çýkýþý.
  output reg cout;     // Tasima Biti Cikisi

  reg [4:0] temp_s;    // Gecici hesaplama icin 5-bitlik deðiþken.

  always @(a, b, c0)   // a, b veya c0 deðiþtiðinde bu blok çalýþacak.
  begin
    temp_s = a + b + c0; // BCD sayýlarýný ve taþýma bitini topla.

    if (temp_s > 9)   // Eger toplam 9'dan büyükse,
    begin
      cout = 1;      // Taþýma çýkýþýný ayarla.
      temp_s = temp_s + 6; // Taþýma nedeniyle 6 ekleyin.
      s = temp_s[3:0];    // Dört basamaklý sonucu güncelle.
    end
    else              // Eðer toplam 9 veya daha küçükse,
    begin
      cout = 0;      // Taþýma çýkýþýný sýfýrla.
      s = temp_s[3:0];    // Dört basamaklý sonucu güncelle.
    end
  end
endmodule

