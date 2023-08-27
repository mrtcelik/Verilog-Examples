module bcd_counter_tb;

    // Girişler
    reg [0:0] clock;  // Tek bitlik saat girişi
    reg clear;        // Temizleme sinyali

    // Çıkışlar
    wire [3:0] count; // 4-bitlik sayıcı çıkışı

    // Test edilecek modül (UUT) örneğini oluştur
    bcd_counter uut (
        .clock(clock), 
        .count(count), 
        .clear(clear)
    );

    initial begin
        // Girişleri başlat
        clock = 0;       // Saati sıfırla
        clear = 1;       // Temizleme sinyalini aktif et
        
        #25 clear = 0;   // Temizleme sinyalini devre dışı bırak
        #250 clear = 1;  // Temizleme sinyalini tekrar aktif et
        #25 clear = 0;   // Temizleme sinyalini tekrar devre dışı bırak
        #450 $finish;    // Simülasyonu sonlandır

    end
    
    always 
    #10 clock = ~clock; // Her 10 birimlik zaman aralığında saati değiştir

endmodule
