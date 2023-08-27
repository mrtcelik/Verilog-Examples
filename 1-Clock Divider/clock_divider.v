//Author: Murat Çelik
//14.08.2023
timescale 1ns/1ps
//Daha az clock hızı için bölmemize yarar
module clock_divider(clk_in,clk_out
);

input clk_in;
output reg clk_out;
initial clk_out=0;
integer count;
initial count=0;


always @(posedge clk_in) begin

//clk_out=~clk_out;-->periyodu 2 katına çıkarır
count=count+1;
//örnek olarak 4 değeri girilmiştir.
if(count==4) begin
clk_out=~clk_out;
count=1;//elde etmek istediğimiz clock'ıni ilk posedge'i
end


end
endmodule

