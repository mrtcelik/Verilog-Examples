`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 09.09.2023
// Single Port RAM
// Test Bench

module single_port_ram_tb();

    reg [7:0] data;
    reg [5:0] addr;
    reg clk;
    reg we; // write
    wire [7:0] q;

    // UUT
    single_port_ram uut(    
        .data(data),
        .addr(addr),
        .clk(clk),
        .we(we), // write
        .q(q)
        );
    
    initial begin
        clk = 1'b1;
        forever #50 clk =~clk;
    end

    // we will write 3 data into the address 0 ,1,2 then read it out
   initial begin
        //First, write data
        data = 8'h01;
        addr = 5'd0; // address 0
        we = 1'b1; // write it
        #100;
        
        data = 8'h02;
        addr = 5'd01; // address 1
        #100;
        
        data = 8'h03;
        addr = 5'd02; // address 2
        #100;    
        // Second , Read Data
        addr = 5'd0; // address 0
        we = 1'b0; // read address 0 , it should be data 01
        #100;    
        
        addr = 5'd1; // address 1
        we = 1'b0; // read address 0 , it should be data 02
        #100;    
        
        addr = 5'd2; // address 2
        we = 1'b0; // read address 0 , it should be data 03
        #100;    
        
   end



endmodule
