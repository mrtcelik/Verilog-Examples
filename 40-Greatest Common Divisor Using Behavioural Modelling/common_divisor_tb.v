`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 09.09.2023
// Greatest Common DÝvisor
// Test Bench

module common_divisor_tb;
 // Inputs
    reg [31:0] num1;
    reg [31:0] num2;
    
    // Outputs
    wire [31:0] gcd_result;

    // UUT
    common_divisor utt (
        .num1(num1),
        .num2(num2),
        .gcd_result(gcd_result)
    );
    // Clock 
    reg clk;
    always begin
        #5 clk = ~clk;
    end
    //Tests
    initial begin
        // Initialize 
        num1 = 48; 
        num2 = 18; 

        #10 num1 = 36; 
        #10 num2 = 24; 

        $finish;
    end

    initial begin
        $monitor("Time=%t, num1=%d, num2=%d, GCD=%d", $time, num1, num2, gcd_result);
    end




endmodule
