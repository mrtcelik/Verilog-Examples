module johnson_counter_tb();

  parameter WIDTH = 4;

  reg clk, reset;
  wire [WIDTH-1:0] count;

  // Johnson Counter modülünü çağır
  johnson_counter dut (
    .clk(clk),
    .q(count)
  );

  always #10 clk = ~clk;

  initial begin
    reset = 0;
    clk = 0;
    $monitor("T=%0t out=%b", $time, count);
    #50 reset = 1;
  end

endmodule
