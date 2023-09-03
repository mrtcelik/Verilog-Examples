`timescale 1ns / 1ps
//Author: Murat Celik
//Date:01.09.2023
//BCD Adder Test Bench



module bcd_adder_tb;
 reg [3:0] a, b;    // 4-bitlik BCD sayýlarý için giriþ sinyalleri a ve b.
  reg c0;            // Taþýma bitini temsil eden 1-bitlik giriþ sinyali c0.
  wire [3:0] s;      // BCD toplama sonucunu temsil eden 4-bitlik çýkýþ sinyali s.
  wire cout;         // Taþýma çýkýþýný temsil eden çýkýþ sinyali cout.

  bcd_adder BB1(a, b, c0, s, cout); // UUT

  initial
  begin
    a = 4'b0000;    // a'ya 0 deðeri atanir
    b = 4'b0000;    // b'ye 0 deðeri atanir.
    c0 = 1'b0;       // tasima biti c0'a 0 deðeri atanýr.
    #10;             
    
    a = 4'b0010;    // a'ya 2 deðeri atanýr.
    b = 4'b0011;    // b'ye 3 deðeri atanýr.
    #10;            
    
    a = 4'b0100;    //a'ya 4 deðeri atanýr.
    b = 4'b0111;    //b'ye 7 deðeri atanýr.
    #10;            
    
    a = 4'b1000;    // a'ya 8 deðeri atanýr.
    b = 4'b1001;    // b'ye 9 deðeri atanýr.
    c0 = 1'b1;       // taþýma biti c0'a 1 deðeri atanýr.
    #10;             
    
    a = 4'b1000;    //a'ya 8 deðeri atanýr.
    b = 4'b1010;    //b'ye 10 deðeri atanýr.
    #10;             
    
    a = 4'b0100;    //a'ya 4 deðeri atanýr.
    b = 4'b0101;    //b'ye 5 deðeri atanýr.
    #10;             
  end

  initial #70 $finish; 
endmodule
