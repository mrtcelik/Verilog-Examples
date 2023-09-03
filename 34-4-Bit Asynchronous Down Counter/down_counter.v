`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 02.09.2023
// for 4-Bit we need 4 F-F
module dff(q, qbar, clk, rst, d);
    output reg q;      // ��k�� q, bir flip-flop'un de�erini temsil eder.
    output qbar;       // qbar, q'nun tamamlay�c�s�d�r.

    input clk, rst;    // clk: Saat giri�i, rst: S�f�rlama giri�i
    input d;           // d: Giri� verisi

    assign qbar = ~q;  // qbar, q'nun tumleyeni

    always @(posedge clk, posedge rst)
    begin
        if (rst)        // E�er s�f�rlama etkinse
            q <= 0;     // q'y� s�f�rla
        else
            q <= d;     // Aksi takdirde giri� verisini q'ya ata
    end
endmodule

module down_counter(count, countbar, clk, rst);
    input clk, rst;           // clk: Saat giri�i, rst: S�f�rlama giri�i
    output [3:0] count, countbar; // 4-bit geni�li�inde count ve countbar ��k��lar�

    // D�rt flip-flop'u daisy-chain (zincirleme) ile birbirine baglanmasi
    dff dff1(count[0], countbar[0], clk, rst, countbar[0]);
    dff dff2(count[1], countbar[1], count[0], rst, countbar[1]);
    dff dff3(count[2], countbar[2], count[1], rst, countbar[2]);
    dff dff4(count[3], countbar[3], count[2], rst, countbar[3]);
endmodule
