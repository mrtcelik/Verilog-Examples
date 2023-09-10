`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 09.09.2023
// Single Port RAM

// The single port RAM can only be accessed at one address at a time.
// for that single port RAM allows only one memory cell to be read/write during each clock cycle.
// we--Write Enable

module single_port_ram(
    input [7:0] data,
    input [5:0] addr,
    input clk,
    input we, // write
    output [7:0] q
    );
    
    // RAM Variable
    reg [7:0] ram [63:0];
    // Address Registers
    reg [5:0] addr_reg;
    
    always @(posedge clk)
    begin
        if(we) // high is to write data into RAM
            ram[addr] <= data;
        else   // low is to read data out
            addr_reg <= addr; // get the address value from the outside of the module
    
    end
    
    assign q = ram[addr_reg]; // out the data to q
    
endmodule
