//driver
class alu_driver;
  virtual alu_if vif;
  mailbox gen2drv;
  function new(virtual alu_if vif, mailbox m);
    this.vif = vif;
    gen2drv = m;
  endfunction
  task run();
    alu_transaction tr;
    forever begin
      gen2drv.get(tr);
      @(posedge vif.clk);
	  #1;               
      vif.a = tr.a;
      vif.b = tr.b;
      vif.s = tr.s;
      vif.mode = tr.mode;
    end
  endtask
endclass
