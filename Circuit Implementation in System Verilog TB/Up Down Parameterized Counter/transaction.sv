class transaction #(parameter N = 7);

	localparam int n = $clog2(N);
      	rand bit up_down ;
	//rand bit rst;
	
	constraint c { up_down dist { 1:= 70 , 0:= 30 }; }
   
	bit [n-1:0] count;

       //	constraint rst_prob{
	//	rst dist {1:=10 , 0:=90};
	//	}

	function void display(string name);
		$display("[%s]  up_down= %0d  count = %0d" , name ,up_down , count);

	endfunction



endclass

