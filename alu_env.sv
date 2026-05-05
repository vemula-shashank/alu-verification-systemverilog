//environment
class alu_environment;
  alu_generator  gen;
  alu_driver     drv;
  alu_monitor    mon;
  alu_scoreboard scb;
  mailbox gen2drv;
  mailbox mon2scb;
  virtual alu_if vif;
  function new(virtual alu_if vif);
    this.vif = vif;
    gen2drv  = new();     
    mon2scb  = new();
    gen = new(gen2drv, 20);
    drv = new(vif, gen2drv);
    mon = new(vif, mon2scb);
    scb = new(mon2scb);
  endfunction

  task run();
    fork
      drv.run();
      mon.run();
      scb.run();
    join_none
    gen.run();
    repeat(50) @(posedge vif.clk);
    scb.report();
    $finish;
  endtask
endclass
