`timescale 1ns / 1ps
//Author:Murat Celik
//Date:30.08.2023
//Master Slave JK F-F

module Mas_Sla_JK(q, qbar, j, k, clear, clk);

input j, k, clear, clk;//J-K , temizleme ve Clock Girisi
output q, qbar;//Cikisler

// Ara kablo tan�mlamalar�
wire n1_out, n2_out, n3_out, n4_out, n5_out, n6_out, cbar;

// n1_out: nand1 ��k���, n2_out: nand2 ��k���, ...(Master Cikisi)
// cbar: clk sinyalinin tersi (Slave Girisi)

// nand1 mod�l� 
nand nand1(n1_out, j, qbar, clk, clear);
// nand1, j, qbar, clk ve clear giri�lerine sahip
// ve n1_out ��k���na sahip bir NAND kap�s�d�r.

// nand2 mod�l� tan�m�
nand nand2(n2_out, k, clk, q);
// nand2, k, clk ve q giri�lerine sahip
// ve n2_out ��k���na sahip bir NAND kap�s�d�r.

// nand3 mod�l� tan�m�
nand nand3(n3_out, n1_out, n4_out);
// nand3, n1_out ve n4_out giri�lerine sahip
// ve n3_out ��k���na sahip bir NAND kap�s�d�r.

// nand4 mod�l� tan�m�
nand nand4(n4_out, n2_out, n3_out, clear);
// nand4, n2_out, n3_out ve clear giri�lerine sahip
// ve n4_out ��k���na sahip bir NAND kap�s�d�r.

// clk sinyalinin tersini hesaplayan NOT kap�s�
not n1(cbar, clk);
// n1, clk giri�ine sahip ve cbar ��k���na sahip bir NOT kap�s�d�r.

// nand5 mod�l� tan�m�
nand nand5(n5_out, n3_out, cbar);
// nand5, n3_out ve cbar giri�lerine sahip
// ve n5_out ��k���na sahip bir NAND kap�s�d�r.

// nand6 mod�l� tan�m�
nand nand6(n6_out, n4_out, cbar);
// nand6, n4_out ve cbar giri�lerine sahip
// ve n6_out ��k���na sahip bir NAND kap�s�d�r.

// nand7 mod�l� tan�m�
nand nand7(q, n5_out, qbar);
// nand7, n5_out, qbar giri�lerine sahip
// ve q ��k���na sahip bir NAND kap�s�d�r.

// nand8 mod�l� tan�m�
nand nand8(qbar, n6_out, q, clear);
// nand8, n6_out, q ve clear giri�lerine sahip
// ve qbar ��k���na sahip bir NAND kap�s�d�r.

endmodule

