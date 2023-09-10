`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 04.09.2023
// Serial In Parallel Out Shift Register
// Test Bench

module sipo_tb;
    reg clk , reset;
    reg a;
    wire [3:0]q;
    sipo uut(clk ,reset ,a,q);
    initial
    begin
        clk =0;
        forever
        #5 clk=~clk;
    end
    
    initial 
    begin
        reset=1;
        #20;
        reset =0;
        a=1'b1;
        #10 a=1'b0;
        #10 a=1'b0;
        #10 a=1'b1;


    end
endmodule

