`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 09.09.2023
// Clock Buffer


module clock_buffer(a_clk,b_clk);
input a_clk;
output b_clk;
buf b(a_clk,b_clk); // Buffer 
endmodule
