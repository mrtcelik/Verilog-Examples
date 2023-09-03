`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 02.09.2023
// ALU : Arithmetic Logic Unit

module alu(a, b, select, ret);
    input [3:0] a, b;      // 4-bitlik iki giriþ (a ve b)
    input [2:0] select;   // 3-bitlik select
    output [7:0] ret;    // 8-bitlik ret

    reg [7:0] ret;// Wire

    // Global Olarak Islem Kodlarini Tanimlanmasi
    parameter add_op = 3'b000, // Toplama iþlemi kodu
              sub_op = 3'b001, // Çýkarma iþlemi kodu
              mul_op = 3'b010, // Çarpma iþlemi kodu
              and_op = 3'b011, // Mantýksal AND iþlemi kodu
              or_op = 3'b100,  // Mantýksal OR iþlemi kodu
              not_op = 3'b101, // Mantýksal NOT (Negation) iþlemi kodu
              xor_op = 3'b110, // Mantýksal XOR iþlemi kodu
              xnor_op = 3'b111; // Mantýksal XNOR iþlemi kodu

    always @ (a or b or select)
    begin
        case (select)
            add_op: ret = a + b;    // Toplama iþlemi
            sub_op: ret = a - b;    // Çýkarma iþlemi
            mul_op: ret = a * b;    // Çarpma iþlemi
            and_op: ret = a & b;    // Mantýksal AND iþlemi
            or_op: ret = a | b;     // Mantýksal OR iþlemi
            not_op: ret = ~a;       // Mantýksal NOT (Negation) iþlemi
            xor_op: ret = a ^ b;    // Mantýksal XOR iþlemi
            xnor_op: ret = ~(a ^ b); // Mantýksal XNOR iþlemi
        endcase
    end
endmodule

