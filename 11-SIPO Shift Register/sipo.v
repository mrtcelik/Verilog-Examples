`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 04.09.2023
// Serial In Parallel Out Shift Register

module sipo(
    input clk,
    input reset,
    input a,
    output [3:0] q
);

    reg [3:0] temp;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            temp <= 4'b0000;
        end else begin
            temp <= temp << 1;
            temp[0] <= a;
        end
    end

    assign q = temp;

endmodule
