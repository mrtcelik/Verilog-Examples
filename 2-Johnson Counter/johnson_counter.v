//Murat Çelik
//14.08.2023
//Johnson Counter:bitlerin sırayla pattern gibi kayması denebilir
//n=4--> 2n states
//D Flip-Flop kullanılarak yapılabilir. Girişlere çıkaşlar bağlanarak
module johnson_counter(clk, q);
  input clk;        // Saat sinyali girişi
  output [3:0] q;   // 4-bit çıkış

  reg [3:0] q = 0;  // 4-bit reg çıkış, başlangıçta 0 değeriyle atanır

  always @(posedge clk)
  begin
    case (q)        // Mevcut duruma göre durum makinesi işlemi
      4'd0: q = 4'd8;//0000-->1000
      4'd8: q = 4'd12;//1000-->1100
      4'd12: q = 4'd14;//1100-->1110
      4'd14: q = 4'd15;//1110-->1111
      4'd15: q = 4'd7;//1111-->0111
      4'd7: q = 4'd3;//0111-->0011
      4'd3: q = 4'd1;//0011-->0001
      4'd1: q = 4'd0;//0001-->0000
    endcase
  end
endmodule








