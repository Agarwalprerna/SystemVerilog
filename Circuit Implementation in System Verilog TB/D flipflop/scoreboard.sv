class scoreboard;
	mailbox #(transaction) m2s;
	

	function new(mailbox #(transaction) m2s);
		this.m2s = m2s;
	endfunction

	task main();
	

		forever begin
	         	transaction t1;

			m2s.get(t1);
			
			t1.display("scoreboard");

			if((t1.D == t1.Q) && (t1.Qbar == ~t1.Q))
				$display("result correct");
			else
				$display("result wrong");
		end
	endtask

endclass

