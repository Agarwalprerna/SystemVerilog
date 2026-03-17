`define mon vif.cb_m.cb

class monitor #(parameter N = 7);

	virtual counter_intf #(N) vif;
	mailbox #(transaction) m2s;

	function new( mailbox #(transaction) m2s , virtual counter_intf #(N) vif );
		this.m2s = m2s;
		this.vif = vif;
	endfunction

	task run();
		
		forever begin
                        transaction #(N) t1;
                        t1 = new();

		        @(posedge vif.cb_m.clk)
			t1.up_down = `mon.up_down;


		//	t1.rst =vif.cb.rst;
		//	t1.up_down = vif.up_down;

			t1.count = `mon.count;

			m2s.put(t1);
                        t1.display("monitor");
	               
		end
	endtask

endclass

