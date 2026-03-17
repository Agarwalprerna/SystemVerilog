`include "interface.sv"
`include "test.sv"
`include "RTL.sv"

module testbench;
   parameter N = 7;

  logic clk;
  bit rst;

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
	   rst = 1;
	   #20 ;
	   rst = 0;
	   #100 ;
	   $finish;
   end

   counter_intf #(N) i_i(clk,rst);
  test t(i_i);

 RTL #(N) dut( .clk(i_i.clk) , .rst(i_i.rst) , .up_down(i_i.up_down) , .count(i_i.count) );

 


 endmodule


