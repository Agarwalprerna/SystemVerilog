module RTL #(parameter integer N = 7 , parameter integer n = $clog2(N) )(
	 input logic clk ,
	 input logic rst ,
	 input logic  up_down,
	 output logic [n-1:0] count);


	 always_ff @(posedge clk) begin
		 if(rst)
			  count <= 0;
		  else begin
			  if(up_down ) begin
			       if(count == N-1)
				  count <= 0;
			      else 
			         count <= count + 1;
			 end else begin
			       if(count == 0)
				   count <= N-1;
			       else 
				   count <= count -1;
		         end
        
		  end
	  end
		 
endmodule

