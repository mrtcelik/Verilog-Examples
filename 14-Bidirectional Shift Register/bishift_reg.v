module bishift_reg #(parameter MSB = 4) (
    input d,                 // Giriş: Kaydırılacak veri
    input clk,               // Giriş: Saat sinyali
    input en,                // Giriş: Kaydırma işleminin etkinleştirilip devre dışı bırakılması
    input dir,               // Giriş: Kaydırma yönü (sol: 0, sağ: 1)
    input rstn,              // Giriş: Sıfırlama sinyali (negatif kenar aktif)
    output reg [MSB-1:0] out // Çıkış: Kaydırılmış değer
);

    always @(posedge clk) begin
        if (!rstn)           // Sıfırlama aktifse, çıkışı sıfırla
            out <= 0;
        else begin
            if (en) begin     // Eğer kaydırma işlemi etkinse
                case (dir)
                    0 : out <= {out[MSB-2:0], d}; // Kaydırma yönü: sol
                    1 : out <= {d, out[MSB-1:1]}; // Kaydırma yönü: sağ
                endcase
            end
            else
                out <= out;    // Kaydırma işlemi devre dışıysa, çıkışı aynı tut
        end
    end

endmodule
