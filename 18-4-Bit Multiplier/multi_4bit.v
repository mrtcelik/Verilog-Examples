`timescale 1ns / 1ps
//Author:Murat Çelik
//Date:29.08.2023
//4-Bit Mutliplier


module multi_4bit(a,b,p);
    input [3:0] a,b;         // 4-bitlik girdi sinyalleri a ve b
    output [7:0] p;   // 8-bitlik çýkýþ sinyali product
    wire [3:0] m0;           // 4-bitlik birinci carpim
    wire [4:0] m1;           // 5-bitlik ikinci carpim
    wire [5:0] m2;           // 6-bitlik ucuncu carpim
    wire [6:0] m3;           // 7-bitlik dorduncu carpim
    
    wire [7:0] s1,s2,s3;     // 8-bitlik ara toplamlar icin
    
    // a[0] bitini b'nin her bitiyle carpiyorum
    assign m0 = {4{a[0]}} & b[3:0];
    // a[1] bitini b'nin her bitiyle carpiyorum
    assign m1 = {4{a[1]}} & b[3:0];
    // a[2] bitini b'nin her bitiyle carpiyorum
    assign m2 = {4{a[2]}} & b[3:0];
    // a[3] bitini b'nin her bitiyle carpiyorum
    assign m3 = {4{a[3]}} & b[3:0];
    
    
    // m1'ý 1 bit sola kaydýrýp m0 ile topluyorum
    assign s1 = m0 + (m1 << 1);
    // s1'i 2 bit sola kaydýrýp m2 ile topluyorum
    assign s2 = s1 + (m2 << 1);
    // s2'yi 3 bit sola kaydýrýp m3 ile topluyorum
    assign s3 = s2 + (m3 <<1);
    
    // Son çýktýyý p'ye atama
    assign p = s3;
endmodule
