//Test Bench

module clock_divider_tb;

//inputs
wire clk_out;

clock_divider uut (
	.clk_in(clk_in),
	.clk_out(clk_out)
	);
	
	initial begin 
		clk_in=0;
		
		
		#100//wait for 100ns
	end

	always 
	#10 clk_in=~clk_in;

endmodule