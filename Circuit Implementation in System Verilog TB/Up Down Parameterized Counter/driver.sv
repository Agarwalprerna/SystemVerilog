`define driv vif.c_b_m.c_b


class driver #(parameter N = 7);

	int no_of_trans;
	virtual counter_intf #(N) vif;
	mailbox #(transaction) g2d;

	function new(mailbox #(transaction) g2d , virtual counter_intf #(N) vif) ;
		this.g2d = g2d;
		this.vif = vif;
	endfunction

	task rst();
		wait(vif.rst);
		$display("driver");
		`driv.up_down <= 0;
		wait(!vif.rst);
		  `driv.up_down <= 1;
		$display("driver");
	        $display("reset ended");
	endtask	

	task run();
		forever begin
	               transaction #(N) t1;

			g2d.get(t1);
			@( posedge vif.c_b_m.clk)
			      `driv.up_down <= t1.up_down;
					//vif.cb.up_down <= t1.up_down;
			@( posedge vif.c_b_m.clk)
		        	t1.count <=  `driv.count;
		        	t1.display("DRIVER");

		   no_of_trans++;		

		end
	endtask



	
      endclass

