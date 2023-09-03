`timescale 1ns / 1ps
//Author : Murat Celik
//Date : 02.09.2023
//Moore FSM 1010 Sequence Detector
//Test Bench


module moore_fsm_1010_tb();
reg clk, rst, in;
wire out;

moore_fsm_1010 uut(
    clk,
    rst,
    in,
    out
);
initial begin
    rst = 1'b1;
    clk = 1'b0;
    #15;
    rst = 1'b0;    
end 
initial begin 
    forever begin 
        #5 clk = ~clk;
        end
     end
initial begin 
    $monitor("%t || in = %b || out = %b || PS = %d || NS = %d ",$time , in, out , uut.PS,uut.NS);
    end
initial begin 
    #15 in = 0;
    #10 in = 1; #10 in = 0; #10 in = 1; #10 in =0;
    #10 in = 1; #10 in = 1; #10 in = 0;
    #20 $finish;
    end


endmodule
