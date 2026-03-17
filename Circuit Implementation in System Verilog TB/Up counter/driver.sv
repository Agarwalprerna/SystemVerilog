

class driver #(parameter N = 7);

	virtual counter_intf #(N) vif;
	mailbox g2d;

	function new(mailbox g2d , virtual counter_intf #(N) vif) ;
		this.g2d = g2d;
		this.vif = vif;
	endfunction

	task run();
		transaction #(N) t1;
		forever begin
			g2d.get(t1);
			@( vif.cb);
			vif.cb.rst <= t1.rst;
			//vif.cb.up_down <= t1.up_down;
			@(vif.cb);
			t1.count <=  vif.cb.count;
			t1.display("DRIVER");

		end
	endtask



	
      endclass

