`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 02.09.2023
// Test Bench

module down_counter_tb;
    // Inputs
    reg clk;        // Saat sinyali
    reg rst;        // Sýfýrlama sinyali
    // Outputs
    wire [3:0] count;     // 4-bit geniþliðinde sayýcý çýkýþý
    wire [3:0] countbar;  // 4-bit geniþliðinde sayýcý çýkýþýnýn tamamlayýcýsý

    // (UUT)
    down_counter uut (
        .count(count),
        .countbar(countbar),
        .clk(clk),
        .rst(rst)
    );
    // Simülasyon
    initial
    begin
        clk = 0;       // Saat sinyali baþlangýçta düþük
        rst = 1;       // Sýfýrlama sinyali etkin

        #23;           // Yeterli süre vererek tasarýmý sýfýrla

        rst = 0;       // Sýfýrlama sinyalini devre dýþý býrak

        #200;          // Bir süre beklet

        $finish;       // Simülasyonu sonlandýr
    end

    // Saat Sinyali Oluþturma
    always #5 clk = ~clk; // Her 5 zaman birimi aralýðýnda saat sinyalini al

endmodule


