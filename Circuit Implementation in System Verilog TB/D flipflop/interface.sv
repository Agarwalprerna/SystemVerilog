interface intf( input logic clk );
	logic rst;
	logic D;
	logic Q;
	logic Qbar;

	clocking cb @(posedge clk);

		input Q ;
		input	Qbar;
		input D;
	endclocking

        
        

endinterface
