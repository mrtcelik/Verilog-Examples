`timescale 1ns / 1ps
//Author:Murat �elik
//Date:29.08.2023
//Sequence Generotor random olarak bir say� dizisi �retmemize yarar
//�rnek olarak 4 bit i�in 4 F-F gerekli olur son iki F-F giri�e XOR olarak verilir

module prbs_gen (rand, clk, reset);
  input clk, reset;//girisler
  output rand;//cikisler
  wire rand;
  reg [3:0] temp;//4 bit genislikli degisken
  
  // Resetleme Islemi
  always @ (posedge reset)
  begin
    // temp de�i�keni s�f�rlan�yor
    temp <= 4'hf; // Deger: 1111 (16 decimal)
  end
  
  // Saat sinyali ile Calisan Blok
  always @ (posedge clk)
  begin
    // Reset gelmediyse
    if (~reset)
    begin
      // PRBS dizisi hesaplan�yor ve temp g�ncelleniyor
      temp <= {temp[0]^temp[1], temp[3], temp[2], temp[1]};//0001-->
    end
  end
  
  // rand ��k��� temp de�i�keninin en d���k bitine atan�yor
  assign rand = temp[0];
endmodule

