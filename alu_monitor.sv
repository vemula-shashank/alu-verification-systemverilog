//Monitor
class alu_monitor;
  virtual alu_if vif;
  mailbox mon2scb;
  function new(virtual alu_if vif, mailbox m);
    this.vif = vif;
    mon2scb  = m;
  endfunction
  task run();
    alu_transaction tr;
    int count = 0;           
    @(posedge vif.clk);      
    forever begin
      @(posedge vif.clk);
      #3;                     
      if(count >= 20) break; 
      tr        = new();
      tr.a      = vif.a;
      tr.b      = vif.b;
      tr.s      = vif.s;
      tr.mode   = vif.mode;
      tr.y      = vif.y;
      mon2scb.put(tr);       
      $display("[MON] mode=%0b s=%0b a=%0d b=%0d y=%0d",
                tr.mode, tr.s, tr.a, tr.b, tr.y);
      count++;               
    end
  endtask

endclass
