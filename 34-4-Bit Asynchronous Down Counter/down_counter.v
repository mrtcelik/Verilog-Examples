`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 02.09.2023
// for 4-Bit we need 4 F-F
module dff(q, qbar, clk, rst, d);
    output reg q;      // Çýkýþ q, bir flip-flop'un deðerini temsil eder.
    output qbar;       // qbar, q'nun tamamlayýcýsýdýr.

    input clk, rst;    // clk: Saat giriþi, rst: Sýfýrlama giriþi
    input d;           // d: Giriþ verisi

    assign qbar = ~q;  // qbar, q'nun tumleyeni

    always @(posedge clk, posedge rst)
    begin
        if (rst)        // Eðer sýfýrlama etkinse
            q <= 0;     // q'yý sýfýrla
        else
            q <= d;     // Aksi takdirde giriþ verisini q'ya ata
    end
endmodule

module down_counter(count, countbar, clk, rst);
    input clk, rst;           // clk: Saat giriþi, rst: Sýfýrlama giriþi
    output [3:0] count, countbar; // 4-bit geniþliðinde count ve countbar çýkýþlarý

    // Dört flip-flop'u daisy-chain (zincirleme) ile birbirine baglanmasi
    dff dff1(count[0], countbar[0], clk, rst, countbar[0]);
    dff dff2(count[1], countbar[1], count[0], rst, countbar[1]);
    dff dff3(count[2], countbar[2], count[1], rst, countbar[2]);
    dff dff4(count[3], countbar[3], count[2], rst, countbar[3]);
endmodule
