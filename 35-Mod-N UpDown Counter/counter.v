`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 03.09.2023
// N-Mode Counter
// Mode:0-->Up Counter
// Mode:1-->Down Counter

module counter(out , reset , clk);
    parameter N=15;
    parameter width=4;
    
    input reset;
    input clk;
    output [width-1:0] out;
    reg [width-1:0] out;
    
    always @(posedge clk)
    begin
    if(reset==1)
    begin
        out=0;
    end
    else
    begin
        if(out==N-1)
        begin
        out=0;
        end
        else
        begin 
            out=out+1;
        end
    end
    end
endmodule
