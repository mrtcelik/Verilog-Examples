`timescale 1ns / 1ps
//Author: Murat Celik
//Date:01.09.2023
//BCD Adder


module bcd_adder(a, b, c0, s, cout);
  input [3:0] a, b;    // D�rt basamakl� BCD say�lar�, a ve b giri�leri.
  input c0;            // Tasima biti Girisi
  output reg [3:0] s;  // D�rt basamakl� BCD sonucu, s ��k���.
  output reg cout;     // Tasima Biti Cikisi

  reg [4:0] temp_s;    // Gecici hesaplama icin 5-bitlik de�i�ken.

  always @(a, b, c0)   // a, b veya c0 de�i�ti�inde bu blok �al��acak.
  begin
    temp_s = a + b + c0; // BCD say�lar�n� ve ta��ma bitini topla.

    if (temp_s > 9)   // Eger toplam 9'dan b�y�kse,
    begin
      cout = 1;      // Ta��ma ��k���n� ayarla.
      temp_s = temp_s + 6; // Ta��ma nedeniyle 6 ekleyin.
      s = temp_s[3:0];    // D�rt basamakl� sonucu g�ncelle.
    end
    else              // E�er toplam 9 veya daha k���kse,
    begin
      cout = 0;      // Ta��ma ��k���n� s�f�rla.
      s = temp_s[3:0];    // D�rt basamakl� sonucu g�ncelle.
    end
  end
endmodule

