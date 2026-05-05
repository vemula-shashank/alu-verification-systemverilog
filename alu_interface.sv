//Interface
interface alu_if(input logic clk);
  logic [7:0]a;
  logic[7:0] b;
  logic [1:0]s;
  logic mode;
  logic [7:0]y;
endinterface
