//Top-module
module tb_top;
  logic clk;
  initial clk = 0;
  always #5 clk = ~clk;  
  
  alu_if dut_if(.clk(clk));

  alu dut(
    .y   (dut_if.y),
    .a   (dut_if.a),
    .b   (dut_if.b),
    .s   (dut_if.s),
    .mode(dut_if.mode)
  );
  initial begin
    alu_test t;
    t = new(dut_if);        
    t.run();                
  end
  initial begin
    #10_000;
    $display("[TIMEOUT] Simulation exceeded 10us — forcing stop.");
    $finish;
  end
  initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, tb_top);
  end

endmodule
