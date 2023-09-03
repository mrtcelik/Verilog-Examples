`timescale 1ns / 1ps
//Author: Murat Celik
//Date:29.01.2023
//Test-Bench

module adder_subtractor_tb();

    // reg
    reg [7:0] a, b;
    reg mode;
    
    // wire
    wire [7:0] result;
    wire ovfl; // overflow
    
    // Instantiate The Module 
    adder_subtractor uut (
        .a(a),
        .b(b),
        .mode(mode),
        .result(result),
        .ovfl(ovfl)
    );

    initial begin
        // Test cases
        // Test 1: Addition
        a = 8'b0000_0000; b = 8'b0000_0001; mode = 1'b0;
        #10;
        
        // Test 2: Subtraction
        a = 8'b0000_0000; b = 8'b0000_0001; mode = 1'b1;
        #10;
        
        // Test 3: Addition
        a = 8'b0000_0001; b = 8'b1111_1001; mode = 1'b0;
        #10;
        
        // Test 4: Subtraction
        a = 8'b0000_0001; b = 8'b1111_1001; mode = 1'b1;
        #10;
        
        // Test 5: Addition
        a = 8'b0000_0001; b = 8'b1000_0001; mode = 1'b0;
        #10;
        
        // Test 6: Subtraction
        a = 8'b0000_0001; b = 8'b1000_0001; mode = 1'b1;
        #10;
        
        // Test 7: Overflow in Addition
        a = 8'b1111_0000; b = 8'b0000_0001; mode = 1'b0;
        #10;
        
        // Test 8: Overflow in Subtraction
        a = 8'b1111_0000; b = 8'b0000_0001; mode = 1'b1;
        #10;
        
        // Test 9: Overflow in Addition
        a = 8'b0110_1101; b = 8'b0100_0101; mode = 1'b0;
        #10;
        
        // Test 10: Overflow in Subtraction
        a = 8'b0010_1101; b = 8'b0000_0101; mode = 1'b1;
        #10;
        
        // Test 11: Addition
        a = 8'b0000_0110; b = 8'b0000_0001; mode = 1'b0;
        #10;
        
        // Test 12: Subtraction
        a = 8'b0000_0110; b = 8'b0000_0001; mode = 1'b1;
        #10;
        
        // Test 13: Addition
        a = 8'b0001_0101; b = 8'b0011_0001; mode = 1'b0;
        #10;
        
        // Test 14: Subtraction
        a = 8'b0001_0101; b = 8'b0011_0001; mode = 1'b1;
        #10;
        
        // Test 15: Overflow in Addition
        a = 8'b1000_0000; b = 8'b1001_1100; mode = 1'b0;
        #10;
        
        // Test 16: Overflow in Subtraction
        a = 8'b1000_0000; b = 8'b1001_1100; mode = 1'b1;
        #10;
        
        // Test 17: Overflow in Addition
        a = 8'b1000_0101; b = 8'b0010_0001; mode = 1'b0;
        #10;
        
        // Test 18: Overflow in Subtraction
        a = 8'b1000_0101; b = 8'b0010_0001; mode = 1'b1;
        #10;
        
        // Display results and finish the simulation
        $finish;
    end
    
endmodule

