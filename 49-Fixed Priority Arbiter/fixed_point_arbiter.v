`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 13.09.2023
// Fixed Priority Arbiter : The Priority of Requesta
module fixed_point_arbiter #(parameter NUM_PORTS = 4)
(   
    input [NUM_PORTS-1:0] req_i,
    output [NUM_PORTS-1:0] grant_o    
);
    assign grant_o[0] = req_i[0];
    genvar i;
    
    for(i=1;i<NUM_PORTS;i=i+1)
    begin
        assign grant_o[i] = req_i[i] & ~(grant_o[i-1:0]);
    
    end
    
    
endmodule
