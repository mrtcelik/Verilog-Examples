`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 03.09.2023
// Parallel in Parallel out

module pipo(
    input clk,
    input clr,
    input [3:0] d,
    output reg [3:0] q
    );
    
always @(posedge clk)
begin
    if(clr ==1)
    begin
    q = 4'b0000;
    end 
    else
    begin
    q=d;
    end
    
    
end
    
endmodule
