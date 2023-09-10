`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 07.09.2023
// Clock Divider By Odd Number
// Test Bench

module freq_div_by_odd_tb;
    reg clk_in;
    
    wire clk_out;
    
    freq_div_by_odd uut(
    
        .clk_in(clk_in),
        .clk_out(clk_out)
    );

    initial begin 
        clk_in = 0;
        #100;
    end
    
    always 
    #10 clk_in = ~clk_in;

endmodule
