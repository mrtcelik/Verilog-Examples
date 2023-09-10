`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 03.09.2023
// Parallel in Serial Out
// Test Bench


module piso_tb;

    reg clk;
    reg [3:0] d;
    reg mode;
    
    wire so;
    
    piso uut(
        .clk(clk),
        .d(d),
        .mode(mode),
        .so(so)
    );
    
    initial begin
    
    clk = 0;
    d = 4'b1001;
    mode = 1;
    #10;
    mode = 0;
    
    end
    always #5 clk=~clk;
endmodule
