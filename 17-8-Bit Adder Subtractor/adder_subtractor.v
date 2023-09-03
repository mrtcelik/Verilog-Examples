`timescale 1ns / 1ps
//Author: Murat Celik
//Date:29.01.2023
//8-bit Toplayici-Cikarici

module adder_subtractor (
    input [7:0] a, b, // inputs
    input mode,       // for selecting mode
    output reg [7:0] result, // output
    output reg ovfl // overflow
);

    reg [7:0] neg_b; // for 2's complement

    always @* begin
        if (mode == 0) // add
        begin
            result = a + b; // adding
            ovfl = (a[7] & b[7] & ~result[7]) | (~a[7] & ~b[7] & result[7]); // overflow checking
        end
        else // sub
        begin
            neg_b = ~b + 1; // Two's Complement
            result = a + neg_b; // Subtracting using Two's Complement
            ovfl = (a[7] & neg_b[7] & ~result[7]) | (~a[7] & ~neg_b[7] & result[7]); // overflow checking
        end
    end

endmodule

