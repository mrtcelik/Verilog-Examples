module siso_reg_tb;

    reg clk, clear, si; // Girişler
    wire so;            // Çıkış

    // DUT (Device Under Test) örneği
    siso_reg uut (
        .clk(clk),
        .clear(clear),
        .si(si),
        .so(so)
    );

    initial begin
        clk = 0;    // Saati sıfırla
        clear = 0;  // Temizleme sinyalini sıfırla
        si = 0;     // Seri girişi sıfırla

        #5 clear = 1'b1; // Temizleme sinyalini aktif et
        #5 clear = 1'b0; // Temizleme sinyalini pasif et

        #10 si = 1'b1;   // Seri girişine 1 ata
        #10 si = 1'b0;   // Seri girişine 0 ata
        #10 si = 1'b0;   // Seri girişine 0 ata
        #10 si = 1'b1;   // Seri girişine 1 ata
        #10 si = 1'b0;   // Seri girişine 0 ata
        #10 si = 1'bx;   // Seri girişine x ata (bilinmeyen değer)

        end

    always #5 clk = ~clk; // Saati değiştir

    initial #150 $stop;    // Simülasyonu sonlandır

endmodule
