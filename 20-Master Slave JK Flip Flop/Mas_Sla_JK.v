`timescale 1ns / 1ps
//Author:Murat Celik
//Date:30.08.2023
//Master Slave JK F-F

module Mas_Sla_JK(q, qbar, j, k, clear, clk);

input j, k, clear, clk;//J-K , temizleme ve Clock Girisi
output q, qbar;//Cikisler

// Ara kablo tanýmlamalarý
wire n1_out, n2_out, n3_out, n4_out, n5_out, n6_out, cbar;

// n1_out: nand1 çýkýþý, n2_out: nand2 çýkýþý, ...(Master Cikisi)
// cbar: clk sinyalinin tersi (Slave Girisi)

// nand1 modülü 
nand nand1(n1_out, j, qbar, clk, clear);
// nand1, j, qbar, clk ve clear giriþlerine sahip
// ve n1_out çýkýþýna sahip bir NAND kapýsýdýr.

// nand2 modülü tanýmý
nand nand2(n2_out, k, clk, q);
// nand2, k, clk ve q giriþlerine sahip
// ve n2_out çýkýþýna sahip bir NAND kapýsýdýr.

// nand3 modülü tanýmý
nand nand3(n3_out, n1_out, n4_out);
// nand3, n1_out ve n4_out giriþlerine sahip
// ve n3_out çýkýþýna sahip bir NAND kapýsýdýr.

// nand4 modülü tanýmý
nand nand4(n4_out, n2_out, n3_out, clear);
// nand4, n2_out, n3_out ve clear giriþlerine sahip
// ve n4_out çýkýþýna sahip bir NAND kapýsýdýr.

// clk sinyalinin tersini hesaplayan NOT kapýsý
not n1(cbar, clk);
// n1, clk giriþine sahip ve cbar çýkýþýna sahip bir NOT kapýsýdýr.

// nand5 modülü tanýmý
nand nand5(n5_out, n3_out, cbar);
// nand5, n3_out ve cbar giriþlerine sahip
// ve n5_out çýkýþýna sahip bir NAND kapýsýdýr.

// nand6 modülü tanýmý
nand nand6(n6_out, n4_out, cbar);
// nand6, n4_out ve cbar giriþlerine sahip
// ve n6_out çýkýþýna sahip bir NAND kapýsýdýr.

// nand7 modülü tanýmý
nand nand7(q, n5_out, qbar);
// nand7, n5_out, qbar giriþlerine sahip
// ve q çýkýþýna sahip bir NAND kapýsýdýr.

// nand8 modülü tanýmý
nand nand8(qbar, n6_out, q, clear);
// nand8, n6_out, q ve clear giriþlerine sahip
// ve qbar çýkýþýna sahip bir NAND kapýsýdýr.

endmodule

