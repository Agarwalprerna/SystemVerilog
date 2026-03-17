class Generator #(parameter N = 7);

	mailbox g2d;

	function new(mailbox g2d);
		this.g2d = g2d;
	endfunction

	task run();
		transaction #(N) t1;

		repeat(20) begin
			t1 = new();
			t1.randomize();
			g2d.put(t1);
			t1.display("GENERATOR");
		end
	endtask

 

   endclass

 
