`include "environment.sv"
   
module test(intf i_i);
	environment e1;

	initial begin
		e1 = new(i_i);
		e1.run();
	end
	endmodule


