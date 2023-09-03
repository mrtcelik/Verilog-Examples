`timescale 1ns / 1ps

module bcd_to_ssd(bcd,seg,cs);
input [3:0] bcd;
input cs;
output reg [6:0] seg;

 always@(cs or bcd)
    begin
    if(~cs)
    seg = 7'b0000_000;
    else 
    begin
    case(bcd)//This Values From Truth Table 
    0 : seg = 7'b1111_110;
    1 : seg = 7'b0110_000;
    2 : seg = 7'b1101_101;
    3 : seg = 7'b1111_001;
    4 : seg = 7'b0110_011;
    5 : seg = 7'b1011_011;
    6 : seg = 7'b1011_111;
    7 : seg = 7'b1110_000;
    8 : seg = 7'b1111_111;
    9 : seg = 7'b1111_011;
    endcase
    end 
 end 
endmodule
