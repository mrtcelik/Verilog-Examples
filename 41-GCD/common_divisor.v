`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 09.09.2023
// Greatest Common DÝvisor


module common_divisor(
    input wire [31:0] num1,
    input wire [31:0] num2,
    output reg [31:0] gcd_result
);

reg [31:0] a, b, temp;

// Initialize variables
always @(num1, num2) begin
    a = num1;
    b = num2;
end

// Euclidean algorithm
always @(*) begin
    while (b != 0) begin
        temp = b;
        b = a % b;
        a = temp;
    end
    gcd_result = a;
end

endmodule

