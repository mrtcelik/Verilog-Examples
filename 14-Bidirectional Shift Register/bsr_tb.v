`timescale 1ns / 1ps



module bsr_tb;
   parameter MSB = 16; // [Optional] Declare a parameter to represent number of bits in shift register  
   reg data; // Declare a variable to drive d-input of design  
   reg clk; // Declare a variable to drive clock to the design  
   reg en; // Declare a variable to drive enable to the design  
   reg dir; // Declare a variable to drive direction of shift register  
   reg rstn; // Declare a variable to drive reset to the design  
   wire [MSB-1:0] out; // Declare a wire to capture output from the design  
  
   // Instantiate design (16-bit shift register) by passing MSB and connect with TB signals  
   bsr  #(MSB) sr0  (  
      .d (data),  
      .clk (clk),  
       .en (en),  
       .dir (dir),  
       .rstn (rstn),  
       .out (out));  
  
   // Generate clock time period = 20ns, freq => 50MHz  
   always #10 clk = ~clk;  
  
   // Initialize variables to default values at time 0  
   initial begin  
      clk <= 0;  
      en <= 0;  
      dir <= 0;  
      rstn <= 0;  
      data <= 'h1;  
   end  
  
   // Drive main stimulus to the design to verify if this works  
   initial begin   
      // 1. Apply reset and deassert reset after some time  
      rstn <= 0;  
      #20 rstn <= 1;  
          en <= 1;  
      // 2. For 7 clocks, drive alternate values to data pin  
      repeat (7) @ (posedge clk)  
         data <= ~data;  
     // 3. Shift direction and drive alternate value to data pin for another 7 clocks  
      #10 dir <= 1;  
      repeat (7) @ (posedge clk)  
         data <= ~data;  
      // 4. Drive nothing for the next 7 clocks, allow shift register to shift based on dir simply  
      repeat (7) @ (posedge clk);  
      // 5. Finish the simulation  
      $finish;  
   end  
endmodule
