class transaction #(parameter N = 7);

	localparam int n = $clog2(N);
      //	rand bit up_down ;
	rand bit rst;
   
	bit [n-1:0] count;

	constraint rst_prob{
		rst dist {1:=10 , 0:=90};
		}

	function void display(string name);
		$display("[%s] rst = %0b  count = %0d" , name , rst , count);

	endfunction



endclass

