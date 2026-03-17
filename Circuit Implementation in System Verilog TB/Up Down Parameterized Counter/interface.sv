interface counter_intf #(parameter N = 7) ( input logic clk , rst );

	localparam int n = $clog2(N);
	//logic rst;
	logic up_down;
	logic [$clog2(N)-1:0] count;
        
        clocking c_b @(posedge clk);
		default input  #1 output #1;
		//output rst;      //driving befor clock edge
		output up_down;
		input count;          //sampling afeter clock edge
	endclocking


	clocking cb @(posedge clk);
		default input #1 output #1;
		input up_down;
		input count;
	endclocking

	modport c_b_m(clocking c_b , input clk ,rst);
	modport cb_m (clocking cb , input clk , rst);

endinterface
