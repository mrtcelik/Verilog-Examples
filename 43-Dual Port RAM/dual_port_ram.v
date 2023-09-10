`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 09.09.2023
// Dual Port RAM
// Has two sets of address and data bus, it can read and write different memory cells at different addresses
module dual_port_ram(
    input [7:0] data_a,data_b,// Data buses
    input [5:0] addr_a, addr_b,// Address
    input we_a,we_b,// write and read signals
    input clk,
    output reg [7:0] q_a,q_b // outputs of sets
    );
    
    // Define the RAM
    reg [7:0] ram[63:0]; // 64*8 Bit
    
    // Port A
    always @ (posedge clk)
    begin 
        if(we_a) // High level is write
            ram[addr_a] <= data_a; // save to the memory
        else
            q_a <= ram[addr_a]; // read data out
    end

    // Port B
    always @ (posedge clk)
    begin 
        if(we_b) // High level is write
            ram[addr_b] <= data_b; // save to the memory
        else
            q_b <= ram[addr_b]; // read data out
    end   
    
endmodule
