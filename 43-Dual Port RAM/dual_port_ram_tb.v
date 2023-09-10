`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 09.09.2023
// Dual Port RAM
// Test Bench

module dual_port_ram_tb();
    reg [7:0] data_a,data_b;// Data buses
    reg [5:0] addr_a, addr_b;// Address
    reg we_a,we_b;// write and read signals
    reg clk;
    wire [7:0] q_a;
    wire [7:0] q_b; // outputs of 

    // UUT
    dual_port_ram uut(
    .data_a(data_a),.data_b(data_b),
    .addr_a(addr_a),.addr_b(addr_b),
    .we_a(we_a),.we_b(we_b),
    .clk(clk),
    .q_a(q_a),.q_b(q_b)
     );

    // Clock
    initial begin
        clk = 1'b1;
        forever #50 clk = ~clk;
    end
    

    initial begin
    // write the hex 55 to address 01 via port A,
    data_a = 8'h55;
    addr_a = 6'h01;
    // write the hex 66 to address 02 via port A,
    data_a = 8'h66;
    addr_a = 6'h02;
    
    // Enable port A for writing
    we_a = 1'b1;
    // enable port B for writing
    we_b = 1'b1;
    #100;
    
    //read data from address 02 from port A
    addr_a = 6'h02;
    //read data from address 01 from port B
    addr_b = 6'h01;
    // enable port A read
    we_a = 1'b0;
    // enable port B read
    we_b = 1'b0;    
    #100;
    $stop;
    
    
    end

endmodule















