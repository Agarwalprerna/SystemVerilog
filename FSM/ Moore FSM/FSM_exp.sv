module FSM_exp( input logic clk , rst , x , output logic y);

      
      //state representation
    typedef enum logic [2:0] { A, B ,C,D,E} state;   //typedef can create multiple variables with same property

    state currentstate , nextstate ;

//state transition with respect to clk
always_ff @(posedge clk) begin
     if(rst)
            currentstate <= A;
     else
            currentstate <= nextstate;
end

//nextstate logic 

always_comb begin
          
           case(currentstate) 
                A:     nextstate = (x)?C:B;
                B:  nextstate = (x)?D:B;
                C: nextstate = (x)? C:E;
                D : nextstate = (x)? C:E;
                E : nextstate = ( x)? D:B;
                default: nextstate = A;
          endcase

end

assign y = (currentstate == D) | (currentstate == E);

endmodule




    

