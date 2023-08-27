// Parity Adjustment Test Bench

'timescale 1ns/1ps

module test;

	reg [6:0] tt_in;
	wire p=0;
	wire [7:0] pdata;
	
	par_gen uut(.tt_in(tt_in),.p(p) ,.pdata(pdata));
	
	always
		#10 tt_in=tt_in+1;
		
	initial begin
		tt_in = 0;
//		$dumpfile("tb_par_gen.vcd");
//		$dumpvars(0,test);
		
	
		$display("tt_in    pdata");
		$monitor("%b %d",tt_in,pdata);
		
		#1270 $finish();
		
	end 
endmodule








