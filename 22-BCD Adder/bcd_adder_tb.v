`timescale 1ns / 1ps
//Author: Murat Celik
//Date:01.09.2023
//BCD Adder Test Bench



module bcd_adder_tb;
 reg [3:0] a, b;    // 4-bitlik BCD say�lar� i�in giri� sinyalleri a ve b.
  reg c0;            // Ta��ma bitini temsil eden 1-bitlik giri� sinyali c0.
  wire [3:0] s;      // BCD toplama sonucunu temsil eden 4-bitlik ��k�� sinyali s.
  wire cout;         // Ta��ma ��k���n� temsil eden ��k�� sinyali cout.

  bcd_adder BB1(a, b, c0, s, cout); // UUT

  initial
  begin
    a = 4'b0000;    // a'ya 0 de�eri atanir
    b = 4'b0000;    // b'ye 0 de�eri atanir.
    c0 = 1'b0;       // tasima biti c0'a 0 de�eri atan�r.
    #10;             
    
    a = 4'b0010;    // a'ya 2 de�eri atan�r.
    b = 4'b0011;    // b'ye 3 de�eri atan�r.
    #10;            
    
    a = 4'b0100;    //a'ya 4 de�eri atan�r.
    b = 4'b0111;    //b'ye 7 de�eri atan�r.
    #10;            
    
    a = 4'b1000;    // a'ya 8 de�eri atan�r.
    b = 4'b1001;    // b'ye 9 de�eri atan�r.
    c0 = 1'b1;       // ta��ma biti c0'a 1 de�eri atan�r.
    #10;             
    
    a = 4'b1000;    //a'ya 8 de�eri atan�r.
    b = 4'b1010;    //b'ye 10 de�eri atan�r.
    #10;             
    
    a = 4'b0100;    //a'ya 4 de�eri atan�r.
    b = 4'b0101;    //b'ye 5 de�eri atan�r.
    #10;             
  end

  initial #70 $finish; 
endmodule
