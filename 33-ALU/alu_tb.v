`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 02.09.2023
// ALU : Arithmetic Logic Unit
// Test Bench
module alu_tb;
    // Inputs
    reg [3:0] a, b;       // 4-bit geni�li�inde iki giri� (a ve b)
    reg [2:0] select;    // 3-bit i�lem kodu 
    // Outputs
    wire [7:0] ret;     // 8-bit geni�li�inde sonu� (ret)
    // Unit Under Test (UUT)
    alu uut (
        .a(a),
        .b(b),
        .select(select),
        .ret(ret)
    );
    // Test 
    initial begin
        $display("Test ba�lat�l�yor...");
        // �lk test
        a = 4'b0010;
        b = 4'b1101;
        select = 3'b000; // Toplama i�lemi
        #10; // Zaman birimi bekle
        // Sonucu kontrol et
        if (ret !== 8'b10011) $display("Test 1 ba�ar�s�z! Sonu�: %b", ret);
        else $display("Test 1 ba�ar�l�. Sonu�: %b", ret);
        // �kinci test
        a = 4'b1011;
        b = 4'b0101;
        select = 3'b001; // ��karma i�lemi
        #10; // Zaman birimi bekle
        // Sonucu kontrol et
        if (ret !== 8'b01001010) $display("Test 2 ba�ar�s�z! Sonu�: %b", ret);
        else $display("Test 2 ba�ar�l�. Sonu�: %b", ret);
        // Sim�lasyonu sonland�r
        $finish;
    end

endmodule

