// generator
class alu_generator;
  mailbox gen2drv;
  int     num_transactions;     
  function new(mailbox m, int n = 20);
    gen2drv          = m;
    num_transactions = n;               
  endfunction
  task run();
    alu_transaction tr;
    repeat(num_transactions) begin     
      tr = new();
      if(!tr.randomize())
        $fatal("Randomization failed!");
      gen2drv.put(tr);
    end
  endtask
endclass
