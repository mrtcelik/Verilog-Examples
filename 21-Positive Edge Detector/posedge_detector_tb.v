`timescale 1ns / 1ps

//Author:Murat Çelik
//Date:31.09.2023
//Posedge Detector Test Bench

module posedge_detector_tb;

    // Giriþler
    reg data;
    reg clock;

    // Çýkýþ
    wire edge_detect;

    // Unit Under Test (UUT) 
    posedge_detector uut (
        .data(data), 
        .clock(clock), 
        .edge_detect(edge_detect)
    );

    initial begin
        data = 0;
        clock = 0;
        
        // Test 
        #15 data = 1;     // Pozitif kenar tespiti olmayacak
        #20 data = 0;
        #15 data = 1;     // Pozitif kenar tespiti olacak
        #10 data = 0;
        #15 data = 1;     // Pozitif kenar tespiti olacak
        #20 data = 0;
        #15 data = 1;     // Pozitif kenar tespiti olacak
        #10 data = 0;
    end

	always #5 clock = ~clock;
	
	initial begin
	    $monitor("Data = %b, Edge_detect = %b", data, edge_detect);
	    #200 $finish;
	end
      
endmodule
