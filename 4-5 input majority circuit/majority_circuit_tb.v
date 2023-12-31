`timescale 1ns / 1ps



module majority_circuit_tb();
reg [5:1] x;
wire z;
integer i;

//instantiate the module into the test bench
majority_circuit dut(x,z);

initial
begin
for (i=0; i<32; i=i+1)
begin
{x[5], x[4], x[3], x[2], x[1]} = i;
#10 $display ("x1x2x3x4x5 = %b, Output = %b",
{x[1], x[2], x[3], x[4], x[5]}, z);
end
end
endmodule
