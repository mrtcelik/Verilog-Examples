`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 03.09.2023
// Parallel in Parallel out
// Test Bench

module pipo_tb;

    reg clk;
    reg clr;
    reg [3:0] d;
    
    wire [3:0] q;

    pipo uut(
        .clk(clk),
        .clr(clr),
        .d(d),
        .q(q)
    );
    
    initial begin 
    clk = 0;
    clr = 1;
    d = 4'b1010;
    #5 clr=0;
    #2 d=4'b0000;
    #2 d=4'b0011;
    #2 d=4'b1011;
    end
    always #1 clk=~clk;
    
    initial #14 $finish;
endmodule
