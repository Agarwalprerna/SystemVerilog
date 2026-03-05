`include "interface.sv"
`include "test.sv"
`include "RTL.sv"

module testbench;
  logic clk;
  logic rst;

  initial clk = 0;
  always #5 clk = ~clk;

   intf i_i(clk);
  test t(i_i);

 RTL dut(.D(i_i.D) , .clk(clk) ,.rst(rst) , .Q(i_i.Q) ,.Qbar(i_i.Qbar) );


  initial begin
	  rst = 1;
	  #20; 
	  rst = 0;
        
	  #100;
	  $finish;
  end



 endmodule


