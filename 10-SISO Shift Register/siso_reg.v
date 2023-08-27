module siso_reg(
    input clk, clear, si, // Saat sinyali, temizleme sinyali, seri input
    output reg so         // Seri output
);

    reg [3:0] tmp;         // 4-bitlik geçici

    always @(posedge clk)  // Pozitif kenar için işlem
    begin
        if (clear)
            tmp <= 4'b0000; // Temizleme durumunda, tmp'yi sıfırla
        else
            tmp <= tmp << 1; // Diğer durumlarda tmp'yi sola kaydır
        tmp[0] <= si;        // Seri girişi tmp'nin en düşük bitine at
        so = tmp[3];         // Seri çıkışı tmp'nin en yüksek bitine ata
    end

endmodule
