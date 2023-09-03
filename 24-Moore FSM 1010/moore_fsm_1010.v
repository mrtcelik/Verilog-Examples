`timescale 1ns / 1ps
//Author : Murat Celik
//Date : 02.09.2023
//Moore FSM 1010 Sequence Detector


module moore_fsm_1010(
    input clk,
    input rst,
    input in,
    output reg out
);
parameter s0=2'b00, s1=2'b01, s10=2'b10, s101=2'b11, s1010=2'b00;

reg [2:0] PS, NS;

// RST Logic
always @(posedge clk or posedge rst) begin
    if (rst == 1'b1) begin
        out <= 1'b0;
        PS <= s0;
    end
    else
        PS <= NS;
end

// OUT + State
always @(PS or in) begin
    case (PS)
        s0: begin
            out = 1'b0;
            NS = in ? s1 : s0;
        end
        s1: begin
            out = 1'b0;
            NS = in ? s1 : s10;
        end
        s10: begin
            out = 1'b0;
            NS = in ? s101 : s0;
        end
        s101: begin
            out = 1'b0;
            NS = in ? s1 : s1010;
        end
        s1010: begin
            out = 1'b1;
            NS = in ? s1 : s0;
        end
    endcase
end

endmodule

