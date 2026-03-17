`include "transaction.sv"
`include "Generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment #(parameter int N = 7);

	
	Generator #(N) g1;
	driver #(N) d1;
	monitor #(N) m1;
	scoreboard #(N) s1;
        
	mailbox #(transaction) g2d;
	mailbox #(transaction) m2s;

	virtual counter_intf #(N)  vif;

	function new(virtual counter_intf vif);
		this.vif = vif;
		g2d = new();
		m2s = new();
		g1 = new(g2d);
		d1 = new( g2d , vif);
		m1 = new( m2s ,vif);
		s1 = new(m2s);
	endfunction

	task pre_reset();
		d1.rst();
	endtask


	task test();
		fork
			g1.run();
			d1.run();
			m1.run();
			s1.run();
				
		join_any
	 endtask

	 task post_test();
		 wait(g1.ended.triggered);
		 wait(g1.T_count == d1.no_of_trans);
		 wait(g1.T_count == s1.no_of_trans);
	 endtask

	 task  run();
		 pre_reset();
		 test();
		 post_test();
		 #100;
		 $finish;
	 endtask

      
 endclass






