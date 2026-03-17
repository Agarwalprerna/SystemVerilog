`include "environment.sv"
   
class test #(parameter N = 7);

	environment #(N) env;

	function new(virtual counter_intf #(N) vif);
		env = new(vif);
	endfunction

	task run();
		env.run();
	endtask
endclass


