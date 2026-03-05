class Generator;
    rand	transaction t1;
   
	mailbox #(transaction) g2d; //to send randomized transaction to driver

	

	function new(mailbox #(transaction) g2d );
		this.g2d = g2d;
	  
        endfunction 

	task main();
		repeat(5) begin
			transaction t1 = new();
			assert(t1.randomize())begin
				t1.display("generator");
                         
				g2d.put(t1);
			
			end
                 end
	endtask
endclass

 
