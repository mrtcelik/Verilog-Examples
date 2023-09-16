`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 13.09.2023
// Fixed Priority Arbiter Test Bench
module fixed_point_arbiter_tb;
    localparam NUM_PORTS = 4;
    integer i;
    reg [NUM_PORTS-1:0] req_i;
    wire [NUM_PORTS-1:0] grant_o;
    
    fixed_point_arbiter #(NUM_PORTS) fp1 (req_i,grant_o);
    
    initial begin
        for(i=0;i<32;i=i+1)
        begin
            req_i = i;
            #5;
        end
    $finish();    
        
    end
endmodule
