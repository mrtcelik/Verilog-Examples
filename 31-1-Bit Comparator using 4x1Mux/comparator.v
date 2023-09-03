`timescale 1ns / 1ps
//Author : Murat Celik
//Date : 02.09.2023
//Comparator with Mux

module mux4X1( in0,in1,in2,in3,s1,s0,out);
input in0,in1,in2,in3;//input
input   s1,s0;//2^n=4-->n=2 line
output  out;//output
assign out = s1 ? (s0 ? in3 : in2) : (s0 ? in1 : in0);//Selecting
endmodule


module comparator(a,b,greater,lesser,equal);
input a,b;//inputs
output  greater,lesser,equal;//Output Flags

mux4X1 mux1(1'b0,1'b1,1'b0,1'b0,a,b,lesser);//for less than
mux4X1 mux2(1'b1,1'b0,1'b0,1'b1,a,b,equal);//for equal
mux4X1 mux3(1'b0,1'b0,1'b1,1'b0,a,b,greater);//for greater than

endmodule