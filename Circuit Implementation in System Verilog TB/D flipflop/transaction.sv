class transaction;
	rand bit D;
	bit Q , Qbar;

	function void display(string name);
		$display("%s" , name);
		$display("D = %b Q = %b Qbar = %b" , D,Q,Qbar);
	endfunction


endclass

