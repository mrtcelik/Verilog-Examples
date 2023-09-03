`timescale 1ns / 1ps

 module mux (in0,in1,in2, select, outp);
        input        in0, in1, in2 ;//iputs
        input  [1:0] select;
        output       outp;
        reg          outp;
        always @(in0 or in1 or in2  or select)
        begin
           if (select == 2'b00)
              outp = in0;
           else if (select == 2'b01)
              outp = in1;
           else if (select == 2'b10)
              outp = in2;
			else 
			outp=in2;
        end
 endmodule   
