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
        
	mailbox  g2d;
	mailbox  m2s;

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


	task run();
		fork
			g1.run();
			d1.run();
			m1.run();
			s1.run();
				
		join_none
	 endtask

      
 endclass






