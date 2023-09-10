`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 03.09.2023
// Parallel in Serial Out



module piso(clk ,d, mode ,so);
    input  clk, mode;
    input [3:0] d;
    output so;
    reg [3:0] q=0;
    always @(posedge clk)
    begin
        if(mode)
        begin
            q<=d;
        end
        else
        begin
        q[3]<=1'bx;
        q[2]<=q[3];
        q[1]<=q[2];
        q[0]<=q[1];
        end
    end

endmodule
