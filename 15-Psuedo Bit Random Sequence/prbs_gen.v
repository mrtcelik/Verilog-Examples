`timescale 1ns / 1ps
//Author:Murat Çelik
//Date:29.08.2023
//Sequence Generotor random olarak bir sayý dizisi üretmemize yarar
//Örnek olarak 4 bit için 4 F-F gerekli olur son iki F-F giriþe XOR olarak verilir

module prbs_gen (rand, clk, reset);
  input clk, reset;//girisler
  output rand;//cikisler
  wire rand;
  reg [3:0] temp;//4 bit genislikli degisken
  
  // Resetleme Islemi
  always @ (posedge reset)
  begin
    // temp deðiþkeni sýfýrlanýyor
    temp <= 4'hf; // Deger: 1111 (16 decimal)
  end
  
  // Saat sinyali ile Calisan Blok
  always @ (posedge clk)
  begin
    // Reset gelmediyse
    if (~reset)
    begin
      // PRBS dizisi hesaplanýyor ve temp güncelleniyor
      temp <= {temp[0]^temp[1], temp[3], temp[2], temp[1]};//0001-->
    end
  end
  
  // rand çýkýþý temp deðiþkeninin en düþük bitine atanýyor
  assign rand = temp[0];
endmodule

