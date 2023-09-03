`timescale 1ns / 1ps
//Author:Murat Çelik
//Date:29.08.2023
//8-Bit Cikarici Devre
//A ve B girisleri elde girisi ve cikisi olacak sekilde 8 bit icin birbirine baglayacagiz.
module subtract_8bit(a,b,result);
input [7:0] a,b;
output [7:0] result;
reg [7:0] result;
reg [7:0] neg_b;//cikarma operatoru
always@(a or b)
begin
neg_b=~b+1;// +1 two's complement icin
result = a + neg_b;
end
endmodule
