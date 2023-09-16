`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 12.09.2023
// Priority Encoder Test Bench


module priority_encoder_tb;

    // Modül giriþ/çýkýþ sinyalleri
    reg en;
    reg [7:0] i;
    wire [2:0] y;

    // priority_encoder modülünün cagirma
    priority_encoder dut (
        .en(en),
        .i(i),
        .y(y)
    );

    // Simülasyon
    initial begin
        $display("Starting simulation...");

        // Test 1: i[7] aktif, diðerleri pasif
        en = 1;
        i = 8'b1000_0000;
        #10; // 10 birim  bekleme
        if (y !== 3'b111) $display("Test 1 failed");
        else $display("Test 1 passed");

        // Test 2: i[6] aktif, diðerleri pasif
        en = 1;
        i = 8'b0100_0000;
        #10; // 10 birim  bekleme
        if (y !== 3'b110) $display("Test 2 failed");
        else $display("Test 2 passed");

        // Test 3: i[5] aktif, diðerleri pasif
        en = 1;
        i = 8'b0010_0000;
        #10; // 10 birim  bekleme
        if (y !== 3'b101) $display("Test 3 failed");
        else $display("Test 3 passed");


        $finish; // Simülasyon sonu
    end

endmodule

