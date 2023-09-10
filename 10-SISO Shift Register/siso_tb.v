`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 04.09.2023
// Serial In Serial Out
// Test Bench
module siso_tb;
    reg shift_in;
    reg clk;
    
    wire shift_out;
    
    siso uut(
        .shift_out(shift_out),
        .shift_in(shift_in),
        .clk(clk)    
    );

    initial begin
        shift_in =0;
        clk = 0;
        #50;
        shift_in =1;
        #50;
        shift_in =0;
        #50;
        shift_in =1;
        #50;
    end
        always #25 clk=~clk;
endmodule
