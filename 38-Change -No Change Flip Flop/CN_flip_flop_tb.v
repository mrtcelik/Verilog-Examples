`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 12.09.2023
// Change - No Change Flip Flop
// TestBench


module CN_flipflop_tb;

	// Inputs
	reg c;
	reg n;
	reg clk;

	// Outputs
	wire q,qbar;

	// UUT
	CN_flipflop uut (
		.c(c), 
		.n(n), 
		.clk(clk), 
		.q(q),
		.qbar(qbar)
	);

	initial begin
		c = 0;
		n = 0;
		clk = 0;
		
		#10 c=0;n=1;
		#10 c=1;n=0;
		#10 c=1;n=1;

	
	end
	always #5 clk=~clk;
	initial
	begin $monitor("C=%b | N=%b | Q=%b | Qbar=%b",c,n,q,qbar);
	#100 $finish;
	end
      
endmodule

