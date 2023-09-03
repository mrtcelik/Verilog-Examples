`timescale 1ns / 1ps



module shift_operations(a, opcode, result);
    input [7:0] a;       // 8-bit giri� (a)
    input [2:0] opcode;  // 3-bit i�lem kodu (opcode)
    output [7:0] result; // 8-bit ��k�� (result)

    // sinyaller
    wire [7:0] a;    // Giri� sinyali
    wire [2:0] opcode; // ��lem kodu
    reg [7:0] result;  // ��k�� sinyali

    // Islem kodlari
    parameter sra_op = 3'b000, // Shift right arithmetic
              srl_op = 3'b001, // Shift right logical
              sla_op = 3'b010, // Shift left algebraic
              sll_op = 3'b011, // Shift left logical
              ror_op = 3'b100, // Rotate right
              rol_op = 3'b101; // Rotate left

    // Islemler
    always @ (a or opcode)
    begin
        case (opcode)
            sra_op : result = {a[7], a[7], a[6], a[5], a[4], a[3], a[2], a[1]};
            srl_op : result = a >> 1;
            sla_op : result = {a[6], a[5], a[4], a[3], a[2], a[1], a[0], 1'b0};
            sll_op : result = a << 1;
            ror_op : result = {a[0], a[7], a[6], a[5], a[4], a[3], a[2], a[1]};
            rol_op : result = {a[6], a[5], a[4], a[3], a[2], a[1], a[0], a[7]};
            default : result = 0; // Tan�mlanmayan i�lem kodu i�in ��k�� s�f�r
        endcase
    end
endmodule
