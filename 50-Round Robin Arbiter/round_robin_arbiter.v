`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 13.09.2023
// Round Robin Arbiter
module round_robin_arbiter(
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
    // PORT DECLARATION
    input           clk;    // Saat sinyali
    input           rst;    // Sýfýrlama sinyali
    input           req3;   // Request 3
    input           req2;   // Request 2
    input           req1;   // Request 1
    input           req0;   // Request 0
    output          gnt3;   // Grant 3
    output          gnt2;   // Grant 2
    output          gnt1;   // Grant 1
    output          gnt0;   // Grant 0

    // INTERNAL REGISTERS
    wire    [1:0]   gnt       ;   // Temp grant signal
    wire            comreq    ;   // Common Request
    wire            beg       ;   // begin
    wire   [1:0]    lgnt      ;   // Latched encoded grant
    wire            lcomreq   ;   // Veri yolu durumu
    reg             lgnt0     ;   // Latched encoded grant 0
    reg             lgnt1     ;   // Latched encoded grant 1
    reg             lgnt2     ;   // Latched encoded grant 2
    reg             lgnt3     ;   // Latched encoded grant 3
    reg             mask_enable   ;   // Maskeleme enable signal
    reg             lmask0    ;   // Latched maskeleme 0
    reg             lmask1    ;   // Latched maskeleme 1
    reg             ledge    ;   // Kenar sinyali

always @ (posedge clk)

  if (rst)  // Eðer sýfýrlama etkinse
  begin
    lgnt0 <= 0;
    lgnt1 <= 0;
    lgnt2 <= 0;
    lgnt3 <= 0;
  end 

  else
  begin
  end

// Baslangic sinyalleri
assign beg = (req3 | req2 | req1 | req0) & ~lcomreq;

// Ortak Talep Sinyali (Veri Yolu Durumu)
assign lcomreq = ( req3 & lgnt3 )
              | ( req2 & lgnt2 )
              | ( req1 & lgnt1 )
              | ( req0 & lgnt0 );

// Encoder 
assign  lgnt =  {(lgnt3 | lgnt2),(lgnt3 | lgnt1)};

// Maske registerlarý
always @ (posedge clk )
if( rst ) 
begin
  lmask1 <= 0;
  lmask0 <= 0;
end 
else if(mask_enable) 
begin
  lmask1 <= lgnt[1];
  lmask0 <= lgnt[0];
end 
else 
begin
  lmask1 <= lmask1;
  lmask0 <= lmask0;
end 

assign comreq = lcomreq;
assign gnt    = lgnt;

// Çýkýþlar
assign gnt3   = lgnt3;
assign gnt2   = lgnt2;
assign gnt1   = lgnt1;
assign gnt0   = lgnt0;
endmodule
