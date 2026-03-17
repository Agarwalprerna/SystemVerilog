class scoreboard #(parameter N = 7);
	localparam int n = $clog2(N);

	mailbox m2s;

	bit [n-1:0] count_expected;

	function new(mailbox m2s);
		this.m2s = m2s;
		count_expected = 0;
	endfunction

	task run();
		transaction #(N) t1;

		forever begin
			m2s.get(t1); //get from monitor now go for chekcing 
		
 
	        	if(count_expected == t1.count)
			 $display("Result correct => count expected = %0d , actual = %0d" , count_expected , t1.count);
		        else 
			 $error("FAIL => count expected = %0d , actual = %0d" , count_expected , t1.count);

		  	if(t1.rst)
				count_expected = 0;
			else begin

		          	if(count_expected == N-1)
					count_expected  =0;
			      	else
				       	count_expected = count_expected + 1;
		       	end	
		

                 end

             
     endtask
	
endclass

