`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 07.09.2023
// Clock Divider By Odd Number

module freq_div_by_odd(clk_in, clk_out);
    input clk_in;
    output reg clk_out;
    initial clk_out=0;
    integer count;
    initial count = 0; 
   
    always @(posedge clk_in)
    begin
    count = count + 1;
    
    // This block is for Dividing Clock via if condition
    if(count == 4)
    begin 
        clk_out = ~clk_out;
        count = 1;
    end    
    
    end
    
endmodule
