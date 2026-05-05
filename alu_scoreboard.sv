//scoreboard
class alu_scoreboard;
  mailbox mon2scb;
  int     pass_count;
  int     fail_count;
  function new(mailbox m);
    mon2scb    = m;
    pass_count = 0;
    fail_count = 0;
  endfunction
  task run();
    alu_transaction tr;
    logic [7:0] exp_y;
    forever begin
      mon2scb.get(tr);
      //reference model
      if(tr.mode == 0) begin
        case(tr.s)
          2'b00: exp_y = tr.a + tr.b;
          2'b01: exp_y = tr.a - tr.b;
          2'b10: exp_y = tr.a * tr.b;
          2'b11: exp_y = tr.a / tr.b;
        endcase
      end else begin
        case(tr.s)
          2'b00: exp_y = tr.a & tr.b;
          2'b01: exp_y = tr.a | tr.b;
          2'b10: exp_y = tr.a ^ tr.b;
          2'b11: exp_y = ~tr.b;
        endcase
      end
      if(tr.y === exp_y) begin
        $display("[SCB] PASS | mode=%0b s=%0b a=%0d b=%0d | got=%0d exp=%0d",
                  tr.mode, tr.s, tr.a, tr.b, tr.y, exp_y);
        pass_count++;
      end else begin
        $display("[SCB] FAIL | mode=%0b s=%0b a=%0d b=%0d | got=%0d exp=%0d",
                  tr.mode, tr.s, tr.a, tr.b, tr.y, exp_y);
        fail_count++;
      end
    end
  endtask
  function void report();
    $display("\n==============================");
    $display("  PASS : %0d", pass_count);
    $display("  FAIL : %0d", fail_count);
    $display("  TOTAL: %0d", pass_count + fail_count);
    $display("==============================\n");
  endfunction
endclass
