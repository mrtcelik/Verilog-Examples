`timescale 1ns / 1ps
//Author:Murat Celik
//Date:30.08.2023
//Master Slave JK F-F Test Bench


module Mas_Sla_JK_tb;

    reg j_in, k_in, clear_in, clk;
    wire q_out, qbar_out;

    // DUT (Device Under Test) olarak kullanýlacak JK flip-flop modülünü çaðýrma
    Mas_Sla_JK jk_ff_inst (
        .j(j_in),
        .k(k_in),
        .clear(clear_in),
        .clk(clk),
        .q(q_out),
        .qbar(qbar_out)
    );
    
    // Giriþ ve çýkýþ sinyalleri tanýmlama
    reg j_in, k_in, clear_in, clk;
    wire q_out, qbar_out;
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 5 zaman birimi boyunca clock'u sýfýrla veya bir yap
    end
    
    // Test 
    initial begin
        // Baþlangýç durumu
        j_in = 0;
        k_in = 0;
        clear_in = 1; // Clear aktif durumda
        #10; // 10 zaman birimi beklet
        clear_in = 0; // Clear deaktif duruma geç
        #10; // 10 zaman birimi beklet
        
        // JK flip-flop'u test etme
        j_in = 1;
        k_in = 0;
        #10;
        j_in = 0;
        k_in = 1;
        #10;
        j_in = 1;
        k_in = 1;
        #10;
        
        $finish; 
    end

endmodule
