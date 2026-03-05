

class driver;



	virtual intf vif;

	mailbox #(transaction) g2d;

	function new(virtual intf vif , mailbox #(transaction) g2d);
		this.vif = vif;
		this.g2d = g2d;
	endfunction

            task main;  //to drive transaction packets to interface signals
	       forever begin
	         transaction t1;
                 g2d.get(t1);   //get transactions from mailbox(genrrator)
		
		 @(posedge vif.clk);
		 vif.D <= t1.D;
	      end
      endtask

      endclass

