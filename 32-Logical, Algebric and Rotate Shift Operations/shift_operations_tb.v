`timescale 1ns / 1ps



module shift_operations_tb;
    // Inputs
    reg [7:0] a;        // 8-bit giriþ (a)
    reg [2:0] opcode;   // 3-bit iþlem kodu (opcode)
    // Outputs
    wire [7:0] result;  // 8-bit çýkýþ (result)
    integer i;
    // UUT
    shift_operations uut (
        .a(a), 
        .opcode(opcode), 
        .result(result)
    );
    // Baslangic Degerlerini Ayarlama
    initial begin
        a = 8'b10110101;  // Test 
        opcode = 3'b000;  // Islem Kodu
    end
    // Test Kodlari
    initial begin
        for (i = 0; i < 6; i = i + 1) begin
            opcode = i;    
            #10;           
        end
    end
    initial
        $monitor("A=%b | Opcode=%b | Result=%b", a, opcode, result);
      
endmodule