`include "interface.sv"
`include "test.sv"
`include "RTL.sv"

module testbench;
   parameter N = 7;

  logic clk;
  

  initial clk = 0;
  always #5 clk = ~clk;

   counter_intf #(N) i_i(clk);
  test #(N) t;

 RTL #(N) dut( .clk(i_i.clk) , .rst(i_i.rst)  , .count(i_i.count) );

  initial begin

	  t = new(i_i);
	  t.run();
	         
	  #500;
	  $finish;
  end



 endmodule


