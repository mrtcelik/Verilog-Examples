`timescale 1ns / 1ps
// Author : Murat Celik
// Date : 07.09.2023
// Universal Shitf Register

module universal_shifter (
    input wire clk, reset,
    input wire [1:0] ctrl,
    input wire [7:0] d,
    output wire [7:0] q
);

    reg [7:0] r_reg, r_next;

    always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            r_reg <= 8'b0;
        end
        else
        begin
            r_reg <= r_next;
        end
    end

    always @(*)
    begin
        case(ctrl)
            2'b00 : r_next = r_reg; // no operation
            2'b01 : r_next = {r_reg[6:0], d[0]}; // Shift Left
            2'b10 : r_next = {d[7], r_reg[7:1]}; // Shift Right
            default : r_next = d; // Load
        endcase
    end

    assign q = r_reg;

endmodule

