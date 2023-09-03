`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 02.09.2023
// Carry Look Ahead Adder


module carry_look_adder(a, b, cin, sum, cout);
    input [3:0] a, b;      // 4-Bits Input
    input cin;             // carry-in
    output [3:0] sum;      // Sum output
    output cout;           // carry-out

    wire p0, p1, p2, p3;   // XOR kapýlarýnýn çýkýþlarý
    wire g0, g1, g2, g3;   // AND kapýlarýnýn çýkýþlarý
    wire c0, c1, c2, c3, c4; // Taþýma sinyalleri

    // XOR Islemleri
    assign p0 = (a[0] ^ b[0]);
    assign p1 = (a[1] ^ b[1]);
    assign p2 = (a[2] ^ b[2]);
    assign p3 = (a[3] ^ b[3]);

    // AND islermleri
    assign g0 = (a[0] & b[0]);
    assign g1 = (a[1] & b[1]);
    assign g2 = (a[2] & b[2]);
    assign g3 = (a[3] & b[3]);

    // Ýlk taþýma sinyali
    assign c0 = cin;

    // Diðer taþýma sinyalleri
    assign c1 = g0 | (p0 & cin);
    assign c2 = g1 | (p1 & g0) | (p1 & p0 & cin);
    assign c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p1 & p0 & cin);
    assign c4 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p2 & p1 & p0 & cin);

    // Toplam sonuçlarýný hesaplama
    assign sum[0] = p0 ^ c0;
    assign sum[1] = p1 ^ c1;
    assign sum[2] = p2 ^ c2;
    assign sum[3] = p3 ^ c3;

    // Taþýma çýkýþýný belirleme
    assign cout = c4;
endmodule