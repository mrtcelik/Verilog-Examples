// 1 ns zaman birimi, 1 ps zaman çözünürlüğü
`timescale 1ns / 1ps

module comparator_nbit_tb;

    // Girişler
    reg [31:0] a; // 32-bitlik 'a' girişi
    reg [31:0] b; // 32-bitlik 'b' girişi

    // Çıkışlar
    wire Lesser;   // Küçük mü?
    wire Greater;  // Büyük mü?
    wire Equal;    // Eşit mi?

    // Test edilecek modül (UUT) örneğini oluştur
    comparator_nbit uut (
        .a(a), 
        .b(b), 
        .Lesser(Lesser), 
        .Greater(Greater), 
        .Equal(Equal)
    );

    // İlk 'begin' bloğu: Çıkışları gözlemleme
    initial begin
        $monitor("    A=%d    B=%d   Lesser=%b     Greater=%b    Equal=%b   ", a, b, Lesser, Greater, Equal);
    end

    // İkinci 'begin' bloğu: Test senaryoları
    initial begin
        a = 2; b = 2;           // İlk senaryo: a = b
        #100 a = 22; b = 444;    // İkinci senaryo: a < b
        #100 a = 444; b = 555;   // Üçüncü senaryo: a < b
        #100 a = 777; b = 111;   // Dördüncü senaryo: a > b
        #100 a = 8888; b = 8888; // Beşinci senaryo: a = b
        #500 $finish;            // Simülasyonu sonlandır
    end

endmodule
