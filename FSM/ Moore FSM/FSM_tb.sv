`timescale 1ns/1ps
`include "FSM_exp.sv"

module FSM_tb;
   bit clk ; 
    logic x ;
   logic rst;
   logic out;


FSM_exp dut(.clk(clk) , .rst(rst) , .x(x)  , .y(out) );


initial  clk =0;
always #5 clk = ~clk;


//assertions

 property reset_check; 
	 @(posedge clk) rst |=> (dut.currentstate == dut.A) ;
 endproperty

 reset_assert: assert property(reset_check)
       else $error("reset failed FSM is not in Idle state");

 property  A_to_B ;
    @(posedge clk) disable iff(rst)
             (dut.currentstate == dut.A && x==0) |=> (dut.currentstate == dut.B);
    
 endproperty   

  A_B_assert : assert property(A_to_B)
          else $error("A -> B transition  failed");

 property no_unknown_state;
	@(posedge clk)
               ! $isunknown(dut.currentstate);
 endproperty       

  unknown_assert: assert property(no_unknown_state)
          else $error("FSM entered unkown state");



initial begin
     rst = 1; x = 0;
     #20;
     //assert( out == 0 ) else $error("problem");
     
     rst = 0; x = 0;
     #10;
     x = 1;
     #10;
     x = 0;
     #10;
     x = 1;
     #50;
     $finish;
end
endmodule

     
