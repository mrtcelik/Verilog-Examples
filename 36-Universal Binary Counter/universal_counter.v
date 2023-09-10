`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 07.09.2023
// Universal Counter


// syn_clr-->for Clear
// load-->for loading
// en-->for enable
// up--> for up count
// ~up--> for down count

module universal_counter #(parameter N = 8)(
  // Inputs
  input wire clk,     
  input wire reset,   
  input wire syn_clr, 
  input wire load,    
  input wire en,      
  input wire up,      
  input wire [N-1:0] d, 
  // Outputs
  output wire max,    
  output wire min,    
  output wire [N-1:0] q 
);
// Wire
reg [N-1:0] r_reg, r_next; 

// Resetleme Blogu
always @(posedge clk or posedge reset) begin
  if (reset) begin
    r_reg <= 0; 
  end else begin
    r_reg <= r_next; 
  end
end


always @(*) begin
  if (syn_clr) begin
    r_next = 0; 
  end else if (load) begin
    r_next = d; 
  end else if (en & up) begin
    r_next = r_reg + 1; 
  end else if (en & ~up) begin
    r_next = r_reg - 1; 
  end else begin
    r_next = r_reg; 
  end
end


assign q = r_reg; 
assign max = (r_reg == (1 << N) - 1) ? 1'b1 : 1'b0; // Maksimum deger sarti
assign min = (r_reg == 0) ? 1'b1 : 1'b0; // Minimum deger sarti

endmodule

