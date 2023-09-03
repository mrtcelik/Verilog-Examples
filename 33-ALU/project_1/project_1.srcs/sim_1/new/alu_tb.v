`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 02.09.2023
// ALU : Arithmetic Logic Unit
// Test Bench
module alu_tb;
    // Inputs
    reg [3:0] a, b;       // 4-bit geniþliðinde iki giriþ (a ve b)
    reg [2:0] select;    // 3-bit iþlem kodu 
    // Outputs
    wire [7:0] ret;     // 8-bit geniþliðinde sonuç (ret)
    // Unit Under Test (UUT)
    alu uut (
        .a(a),
        .b(b),
        .select(select),
        .ret(ret)
    );
    // Test 
    initial begin
        $display("Test baþlatýlýyor...");
        // Ýlk test
        a = 4'b0010;
        b = 4'b1101;
        select = 3'b000; // Toplama iþlemi
        #10; // Zaman birimi bekle
        // Sonucu kontrol et
        if (ret !== 8'b10011) $display("Test 1 baþarýsýz! Sonuç: %b", ret);
        else $display("Test 1 baþarýlý. Sonuç: %b", ret);
        // Ýkinci test
        a = 4'b1011;
        b = 4'b0101;
        select = 3'b001; // Çýkarma iþlemi
        #10; // Zaman birimi bekle
        // Sonucu kontrol et
        if (ret !== 8'b01001010) $display("Test 2 baþarýsýz! Sonuç: %b", ret);
        else $display("Test 2 baþarýlý. Sonuç: %b", ret);
        // Simülasyonu sonlandýr
        $finish;
    end

endmodule

