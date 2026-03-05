module RTL( input logic D,
             input logic clk,
	     input logic rst ,
	     output logic  Q ,
	     output logic  Qbar );

  always_ff @(posedge clk or posedge rst) begin
	   if(rst)
		   Q<= 0;
	   else
		   Q <= D;
   end

   assign Qbar = ~Q;


   endmodule

