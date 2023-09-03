`timescale 1ns / 1ps
//Author : Murat Celik
//Date : 02.09.2023
//Test Bench

module comparator_tb;
	// Inputs
	reg a,b;
	// Outputs
	wire greater,lesser,equal;
	//Unit Under Test (UUT)
	comparator uut (
		.a(a), 
		.b(b), 
		.greater(greater), 
		.lesser(lesser), 
		.equal(equal)
	);

	initial begin
		//Tests
		a=0; b=0;
		#10 a=0;b=1;
		#10 a=1;b=0;
		#10 a=1;b=1;

	end
	initial 
	begin
	$monitor("A=%b | B=%b | Greater =%b | Lesser=%b | Equal=%b",a,b,greater,lesser,equal);
	#100 $finish;
	end
endmodule
