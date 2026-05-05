// Code your design here
module alu(y,a,b,s,mode);
  input [7:0]a;
  input [7:0]b;
  input [1:0]s;
  input mode;
  output [7:0]y;
  reg [7:0]arth_out;
  reg [7:0]log_out;
  reg [8:0]temp;
  reg zero_flag, carry_flag;
  
  // arithmetic operation
  always@(*)begin
    temp = 9'b0;
    carry_flag = 1'b0;
    case(s)
      2'b00:temp = a + b;
      2'b01:temp = a - b;
      2'b10:temp = a * b;
      2'b11:temp = a / b;
    endcase
      arth_out = temp[7:0];
      carry_flag = temp[8];
  end
  
  //logical operation
  always@(*) begin
    case(s)
      2'b00:log_out = a & b;
      2'b01:log_out = a | b;
      2'b10:log_out = a ^ b;
      2'b11:log_out = ~ b;
    endcase
  end
  
  //ALU mux
  assign y = (mode == 0) ? arth_out:log_out;
endmodule
