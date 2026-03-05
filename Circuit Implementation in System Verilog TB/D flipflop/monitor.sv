

class monitor;

	virtual intf  vif;

	mailbox #(transaction) m2s;
	 
	function new(virtual intf.cb0_m vif , mailbox #(transaction) m2s);
		this.vif = vif;
		this.m2s = m2s;
	endfunction

	task main;
		forever begin
			transaction t1;
			t1 = new();

			@(posedge vif.clk);
			#1;
			//interface signals converted to transaction levels
			t1.D = vif.D;
			t1.Q = vif.Q;
			t1.Qbar = vif.Qbar;

			m2s.put(t1) ; //sampled transaction sending to scoreboard via mailbox

			t1.display("monitor");
		end
	endtask
endclass

