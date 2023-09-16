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
      0: y = a;     // Eðer 's' sýfýrsa, 'a' giriþi 'y' çýkýþýna .
      1: y = b;     // Eðer 's' birse, 'b' giriþi 'y' çýkýþýna .
      default: y = 1'b0;  // 's' farklý bir deðerse, 'y' çýkýþý sýfýr 
    endcase
  end
endmodule

// D Flip-Flop Modülü
module d_ff(d, clk, reset, q);
  input d, clk, reset;
  output reg q;

  always @(posedge clk)
  begin
    if (reset)
      q = 0;      // Eðer reset sinyali aktifse, 'q' çýkýþý sýfýra ayarlanýr.
    else
      q = d;      // Aksi halde 'd' giriþi 'q' çýkýþýna yansýr.
  end
endmodule

// CN Flip-Flop Modulu
module CN_flipflop(c, n, clk, q, qbar);
  input c, n, clk;
  output q, qbar;
  wire cn, n_bar, d_wire;

  // MUX2X1 modüllerini kullanarak giriþ sinyallerini aktariyorum
  mux2X1 mux1(1'b0, c, n, cn);         // 'c' veya 'n' seçimi yap, sonucunu 'cn' sinyaline yönlendir
  mux2X1 mux2(1'b1, 1'b0, n, n_bar);    // 'n' veya sabit sýfýr seçimi yap, sonucunu 'n_bar' sinyaline yönlendir.
  mux2X1 mux3(cn, n_bar, q, d_wire);   // 'cn' veya 'n_bar' seçimi yap, sonucunu 'q'ye yönlendir.

  // D flip-flop'u kullanarak çýkýþlarý ayarliyorum.
  d_ff dff1(.d(d_wire), .clk(clk), .reset(), .q(q));  // D flip-flop ile 'q' çýkýþýný belirler.

  // 'qbar' .
  assign qbar = ~q;  // 'q' çýkýþýnýn tersini aliyorum
endmodule

