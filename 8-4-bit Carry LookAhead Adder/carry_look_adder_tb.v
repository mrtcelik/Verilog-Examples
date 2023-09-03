`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 02.09.2023
// Carry Look Ahead Adder
// Test Bench

module carry_look_adder_tb;
    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg cin;

    // Outputs
    wire [3:0] sum;
    wire cout;

// Instantiate the Unit Under Test (UUT)
        carry_look_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
        );
    initial begin
    // Initialize Inputs
    a = 0;
    b = 0;
    cin = 0;
    // Wait 100 ns for global reset to finish
    #100;
    a = 5;
    b = 6;
    cin = 1;
    // Wait 100 ns for global reset to finish
    #100;
    end
endmodule

