

class monitor #(parameter N = 7);

	virtual counter_intf #(N) vif;
	mailbox m2s;

	function new( mailbox m2s , virtual counter_intf #(N) vif );
		this.m2s = m2s;
		this.vif = vif;
	endfunction

	task run();
		transaction #(N) t1;

		forever begin
			@( vif.cb);
			t1 = new();

			t1.rst =vif.cb.rst;
		//	t1.up_down = vif.up_down;
			t1.count = vif.cb.count;

			m2s.put(t1);

	   $display("[ MONITOR] rst = %0d count = %0d t = %0t" , t1.rst , t1.count  , $time);	
		end
	endtask

endclass

