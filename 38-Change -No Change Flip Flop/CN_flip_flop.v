`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 12.09.2023
// Change - No Change Flip Flop

// MUX (2x1) Modulu
module mux2X1(a, b, s, y);
  input a, b, s;
  output reg y;

  always @(a or b or s)
  begin
    case (s)
      0: y = a;     // E�er 's' s�f�rsa, 'a' giri�i 'y' ��k���na .
      1: y = b;     // E�er 's' birse, 'b' giri�i 'y' ��k���na .
      default: y = 1'b0;  // 's' farkl� bir de�erse, 'y' ��k��� s�f�r 
    endcase
  end
endmodule

// D Flip-Flop Mod�l�
module d_ff(d, clk, reset, q);
  input d, clk, reset;
  output reg q;

  always @(posedge clk)
  begin
    if (reset)
      q = 0;      // E�er reset sinyali aktifse, 'q' ��k��� s�f�ra ayarlan�r.
    else
      q = d;      // Aksi halde 'd' giri�i 'q' ��k���na yans�r.
  end
endmodule

// CN Flip-Flop Modulu
module CN_flipflop(c, n, clk, q, qbar);
  input c, n, clk;
  output q, qbar;
  wire cn, n_bar, d_wire;

  // MUX2X1 mod�llerini kullanarak giri� sinyallerini aktariyorum
  mux2X1 mux1(1'b0, c, n, cn);         // 'c' veya 'n' se�imi yap, sonucunu 'cn' sinyaline y�nlendir
  mux2X1 mux2(1'b1, 1'b0, n, n_bar);    // 'n' veya sabit s�f�r se�imi yap, sonucunu 'n_bar' sinyaline y�nlendir.
  mux2X1 mux3(cn, n_bar, q, d_wire);   // 'cn' veya 'n_bar' se�imi yap, sonucunu 'q'ye y�nlendir.

  // D flip-flop'u kullanarak ��k��lar� ayarliyorum.
  d_ff dff1(.d(d_wire), .clk(clk), .reset(), .q(q));  // D flip-flop ile 'q' ��k���n� belirler.

  // 'qbar' .
  assign qbar = ~q;  // 'q' ��k���n�n tersini aliyorum
endmodule

