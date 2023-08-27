// Ring Counter
module ring_counter(clk, q);
  input clk;             // Saat sinyali girişi
  output reg [3:0] q = 4'd1; // 4-bit çıkış, başlangıç 1 değeri

  always @(posedge clk) // Saat yükselen kenarında 
  begin
    case (q)            // Mevcut duruma göre durum makinesi işlemi
      4'd1: q = 4'd2;   // Durum 0001'den 0010'ye geçiyor
      4'd2: q = 4'd4;   // Durum 0010'den 0100'e geçiyor
      4'd4: q = 4'd8;   // Durum 0100'den 1000'e geçiyor
      4'd8: q = 4'd1;   // Durum 1000'den 0001'e geçiyor (döngü)
    endcase
  end
endmodule
