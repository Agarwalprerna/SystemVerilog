`include "environment.sv"
   
program test (counter_intf  i_i );
         parameter N= 7;
	environment #(N) env;

	initial begin
		env = new(i_i);
		env.g1.T_count = 15;
		env.run();
	end
endprogram


