`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 03.09.2023
// N-Mode Counter
// Test Bench   

module counter_tb;
    reg reset;
    reg clk;
    reg mode;
    
    wire [3:0] out;
    
    counter uut(
        .out(out),
        .reset(reset),
        .clk(clk)
    );

    initial begin
        reset = 1;
        clk=1;
        
        #100;
        reset = 0;
        #200;
        reset = 0;
     end
        always #25 clk=~clk;
endmodule
