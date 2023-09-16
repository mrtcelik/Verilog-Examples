`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 13.09.2023
// Round Robin Arbiter Test Bench


module round_robin_arbiter_tb();
    reg             clk;    // Saat sinyali
    reg             rst;    // Sýfýrlama sinyali
    reg             req3;   // Talep sinyali 3
    reg             req2;   // Talep sinyali 2
    reg             req1;   // Talep sinyali 1
    reg             req0;   // Talep sinyali 0
    wire            gnt3;   // Verme sinyali 3
    wire            gnt2;   // Verme sinyali 2
    wire            gnt1;   // Verme sinyali 1
    wire            gnt0;   // Verme sinyali 0

    // Saat üreteci
    always #1 clk = ~clk;
    
initial begin
  clk = 0;
  rst = 1;
  req0 = 0;
  req1 = 0;
  req2 = 0;
  req3 = 0;
  #10 rst = 0;
  repeat (1) @ (posedge clk);
  req0 <= 1;
  repeat (1) @ (posedge clk);
  req0 <= 0;
  repeat (1) @ (posedge clk);
  req0 <= 1;
  req1 <= 1;
  repeat (1) @ (posedge clk);
  req2 <= 1;
  req1 <= 0;
  repeat (1) @ (posedge clk);
  req3 <= 1;
  req2 <= 0;
  repeat (1) @ (posedge clk);
  req3 <= 0;
  repeat (1) @ (posedge clk);
  req0 <= 0;
  repeat (1) @ (posedge clk)
  #10 $finish;
end 

// DUT'yi (Design Under Test) baðlama
round_robin_arbiter U (
     clk,    
     rst,    
     req3,   
     req2,   
     req1,   
     req0,   
     gnt3,   
     gnt2,   
     gnt1,   
     gnt0   
);
endmodule
