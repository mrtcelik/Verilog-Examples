`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 02.09.2023
// Test Bench

module down_counter_tb;
    // Inputs
    reg clk;        // Saat sinyali
    reg rst;        // S�f�rlama sinyali
    // Outputs
    wire [3:0] count;     // 4-bit geni�li�inde say�c� ��k���
    wire [3:0] countbar;  // 4-bit geni�li�inde say�c� ��k���n�n tamamlay�c�s�

    // (UUT)
    down_counter uut (
        .count(count),
        .countbar(countbar),
        .clk(clk),
        .rst(rst)
    );
    // Sim�lasyon
    initial
    begin
        clk = 0;       // Saat sinyali ba�lang��ta d���k
        rst = 1;       // S�f�rlama sinyali etkin

        #23;           // Yeterli s�re vererek tasar�m� s�f�rla

        rst = 0;       // S�f�rlama sinyalini devre d��� b�rak

        #200;          // Bir s�re beklet

        $finish;       // Sim�lasyonu sonland�r
    end

    // Saat Sinyali Olu�turma
    always #5 clk = ~clk; // Her 5 zaman birimi aral���nda saat sinyalini al

endmodule


