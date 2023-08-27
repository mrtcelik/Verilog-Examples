module ring_counter_tb();

  reg clk;
  wire [3:0] q;

  // Ring Counter modülünü çağır
  ring_counter dut (
    .clk(clk),
    .q(q)
  );

  // Saat sinyali oluşturma
  always #5 clk = ~clk;

  // Başlangıçta reset işlemi
  initial begin
    clk = 0;
    #100; // Simülasyonun devam etmesi için biraz bekleme
    $finish;
  end

  // Sonuçları görüntüleme
  always @(posedge clk) begin
    $display("Time: %t, q: %b", $time, q);
  end

endmodule
