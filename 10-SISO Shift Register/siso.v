`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 04.09.2023
// Serial In Serial Out
// We need 3 Flip Flop

module siso(shift_out,shift_in,clk);
    input shift_in;
    output shift_out;
    reg shift_out;
    input clk;
    reg [2:0] data;
    
    always @(posedge clk)
    begin
    data[0] <= shift_in;
    data[1] <= data[0];
    data[2] <= data[1];
    shift_out <= data[2];
    end

endmodule
