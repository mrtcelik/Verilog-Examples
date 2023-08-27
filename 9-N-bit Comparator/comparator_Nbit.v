// 1 ns zaman birimi, 1 ps zaman çözünürlüğü
`timescale 1ns / 1ps

// Modül 
module comparator_nbit (
    input [n-1:0] a, b, // n-bitlik girişler
    output Lesser, Greater, Equal // Çıkışlar
);
    // Parametre tanımı: n
    parameter n = 32;

    // Çıkışlar tanımlanıyor
    output reg Lesser = 0;
    output reg Greater = 0;
    output reg Equal = 0;

    // Karşılaştırma işlemi, her giriş değiştiğinde çalışacak
    always @ (a, b)
    begin
        if (a > b)
        begin
            Lesser = 0;   // a, b'den büyükse
            Equal = 0;
            Greater = 1;  // Greater çıkışını etkinleştir
        end
        else if (a < b)
        begin
            Lesser = 1;   // a, b'den küçükse
            Equal = 0;
            Greater = 0;
        end
        else
        begin
            Lesser = 0;
            Equal = 1;    // a ve b eşitse
            Greater = 0;
        end
    end
endmodule
