`timescale 1ns / 1ps
//Author:Murat Çelik
//Date:29.08.2023
//4-Bit Mutliplier Test Bench


module multi_4bit_tb;
reg [3:0] A;
reg [3:0] B;
wire [7:0] R;

// Devrenin Cagrilmasi
multi_4bit dut(
    .a(A),
    .b(B),
    .p(R)
);

// Tests
initial begin
    $monitor("a = %b, b = %b, result = %b", A, B, R);
    
    // Test 1: 2 çarpý 3
    A = 4'b0010;
    B = 4'b0011;
    #10;
    // Test 2: 2 çarpý 7
    A = 4'b0010;
    B = 4'b0111;
    #10; 
        
    $finish; 
end

endmodule
