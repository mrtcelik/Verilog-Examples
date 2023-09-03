`timescale 1ns / 1ps


module mux_tb;
	// Inputs
	reg in0,in1,in2;
	reg [1:0] select;
	// Outputs
	wire outp;
	// Instantiate the Unit Under Test (UUT)
	mux uut (
		.in0(in0), 
		.in1(in1), 
		.in2(in2),  
		.select(select), 
		.outp(outp)
	);

	initial begin
		in0=0;in1=0;in2=0;select=2'b00;
		#10 in0=1;in1=0;in2=0;select=2'b01;
		#10 in0=1;in1=1;in2=0;select=2'b10;
		#10 in0=1;in1=0;in2=0;select=2'b00;
		#10 in0=0;in1=0;in2=1;select=2'b01;
		#10 in0=1;in1=0;in2=0;select=2'b10;
		#10 in0=0;in1=1;in2=0;select=2'b00;
	end
	initial
	begin
	$monitor("A=%b B=%b C=%b Sel=%b",in0,in1,in2,select);
	#200 $finish;
	end
      
endmodule