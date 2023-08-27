//Binary to One Hot Encoder
//Author:Murat CELIK
//Date:19/08/2023
//n variables-->n states-->n Flip-Flop Required

module one_hot(bin_i,one_hot_o);
parameter BIN_W=4;//bit size
parameter ONE_HOT_W=16;//4^2 states
input   [BIN_W-1:0]     bin_i;
 output  reg [ONE_HOT_W-1:0] one_hot_o;//output

  assign one_hot_o = 1'b1<<bin_i;//shifting

endmodule

