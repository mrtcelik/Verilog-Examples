`timescale 1ns / 1ps
//Author : Murat Celik
//Date : 02.09.2023
//D Latch Using 2x1 Mux 

module mux(in1, in2 , select,outp);
input in1, in2, select;
output reg outp;
always@ (in1 or in2 or select)
begin
    outp = (select& in2) | (~select & in1);
end
endmodule


module d_latch_2x1_mux(data, clk, out);
input  data,clk;
output out;
mux uut(.in1(out),.in2(data),.select(clk),.outp(out));
endmodule