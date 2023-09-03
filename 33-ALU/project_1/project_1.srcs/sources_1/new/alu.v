`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 02.09.2023
// ALU : Arithmetic Logic Unit

module alu(a, b, select, ret);
    input [3:0] a, b;      // 4-bitlik iki giri� (a ve b)
    input [2:0] select;   // 3-bitlik select
    output [7:0] ret;    // 8-bitlik ret

    reg [7:0] ret;// Wire

    // Global Olarak Islem Kodlarini Tanimlanmasi
    parameter add_op = 3'b000, // Toplama i�lemi kodu
              sub_op = 3'b001, // ��karma i�lemi kodu
              mul_op = 3'b010, // �arpma i�lemi kodu
              and_op = 3'b011, // Mant�ksal AND i�lemi kodu
              or_op = 3'b100,  // Mant�ksal OR i�lemi kodu
              not_op = 3'b101, // Mant�ksal NOT (Negation) i�lemi kodu
              xor_op = 3'b110, // Mant�ksal XOR i�lemi kodu
              xnor_op = 3'b111; // Mant�ksal XNOR i�lemi kodu

    always @ (a or b or select)
    begin
        case (select)
            add_op: ret = a + b;    // Toplama i�lemi
            sub_op: ret = a - b;    // ��karma i�lemi
            mul_op: ret = a * b;    // �arpma i�lemi
            and_op: ret = a & b;    // Mant�ksal AND i�lemi
            or_op: ret = a | b;     // Mant�ksal OR i�lemi
            not_op: ret = ~a;       // Mant�ksal NOT (Negation) i�lemi
            xor_op: ret = a ^ b;    // Mant�ksal XOR i�lemi
            xnor_op: ret = ~(a ^ b); // Mant�ksal XNOR i�lemi
        endcase
    end
endmodule

