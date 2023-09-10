`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 07.09.2023
// Universal Shitf Register Test Bench

module universal_shifter_tb;
    reg clk,reset;
    reg [1:0] ctrl;
    reg [7:0] d;
    wire [7:0] q;
    
    universal_shifter uut(clk,reset,ctrl,d,q);

    always #5 clk=~clk;
    
    initial begin
        clk = 0; reset =0;
        #10;
        d=8'b11010011;
        ctrl=2'b11;// Load
        #10;
        ctrl = 2'b01;
        #10;
        ctrl = 2'b11;
        d[7] = 0;
    
    end

endmodule
