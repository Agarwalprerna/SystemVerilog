class scoreboard #(parameter N = 7);
	localparam int n = $clog2(N);

	mailbox #(transaction) m2s;
        int no_of_trans;
	bit [n-1:0] count_expected;

	function new(mailbox #(transaction)  m2s);
		this.m2s = m2s;
		count_expected = 0;
	endfunction

	task run();
		transaction #(N) t1;

		forever begin
			m2s.get(t1); //get from monitor now go for chekcing 
		        no_of_trans ++;
                        t1.display("scoreboard");

			if(t1.up_down == 1)begin
                                t1.count = t1.count +1 ;
			 $display("Result correct => count expected = %0d " ,  t1.count);
		       // else 
			 //$error("FAIL => count expected = %0d , actual = %0d" , count_expected , t1.count);
			end

		  	else if(t1.up_down == 0) begin

		          	//if(count_expected == N-1)
				//	count_expected  =0;
			      	//else
				  //     	count_expected = count_expected + 1;
		       	  $display("result correct when up_dowm = 0");
			  t1.count = t1.count -1;
			  end	

			  else
				  $display("Result wrong");
		

                 end

             
     endtask
	
endclass

