module par_gen (
    input wire [6:0] tt_in, //input value
    input wire p,               //output parity (0-even,1-odd)
    output wire [7:0] pdata //output value with adjusted parity 
);

    reg par;

    always@*
        if(p==0)
            assign par=^tt_in;
        else
            par=~^tt_in;
    
    
    assign pdata={par,tt_in};
    
endmodule