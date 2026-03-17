class Generator #(parameter N = 7);
        
	mailbox #(transaction) g2d;
        transaction #(N) t1;
	int cnt;
	int T_count;
        event ended;

	function new(mailbox #(transaction) g2d);
		this.g2d = g2d;
		cnt =0;
	endfunction

	task run();
		

		repeat(T_count) begin
			t1 = new();
			if(t1.randomize()) begin
			        g2d.put(t1);
		        	t1.display("GENERATOR");
		         	cnt ++ ;
			end
		end
		->ended;
	
	endtask

 

   endclass

 
