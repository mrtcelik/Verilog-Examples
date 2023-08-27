module bcd_counter(
    input clock, clear,
    output reg [3:0] count
);
    reg [3:0] t;

    always @ (posedge clock) begin
        if (clear) 
        begin
            // Adım 1: Temizleme durumu
            // Eğer clear sinyali aktifse (1 ise), tüm sayaç sıfırlanır.
            t <= 4'b0000;
            count <= 4'b0000;
        end
        else 
        begin
            // Adım 2: Normal sayaç işlemi
            // Eğer clear sinyali pasifse (0 ise), normal sayaç işlemi gerçekleştirilir.

            // Mevcut değeri 1 artır
            t <= t + 1;

            // Adım 3: BCD dönüşüm kontrolü
            // Eğer mevcut değer 9'a eşit olduğunda, BCD dönüşümü uygula.
            if (t == 4'b1001) 
            begin
                // Adım 4: Dönüşüm
                // Değer 9'a ulaştığında, değeri 0'a çevirerek BCD dönüşümü yap.
                t <= 4'b0000;
            end
            
            // Adım 5: Sonuç aktarımı
            // Son işlem sonucunu count çıkışına aktar.
            count <= t;
        end
    end
endmodule
