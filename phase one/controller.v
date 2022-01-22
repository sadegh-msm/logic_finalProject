/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2021-2022
--  *******************************************************
--  Student ID  : 
--  Student Name: 
--  Student Mail: 
--  *******************************************************
--  Additional Comments:
--
--*/

/*-----------------------------------------------------------
---  Module Name: controller
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module fsm (
   input request,
	input [7:0] time_data,
	input RST ,
	input CLK ,
	input confirm ,
	output reg en_P ,
	output reg en_Q);

  reg [2:0] Prstate, Nxtstate;
  parameter A = 3'b000 , B = 3'b001 , C = 3'b101 , D = 3'b111 , E = 3'b110;
  
  	always @ (posedge CLK or negedge RST)
      if (~RST) Prstate = A;  
      else if (RST) Prstate = Nxtstate; 
			
  
   always @ (Prstate or confirm or request or time_data)
         case (Prstate)
            A: if (~request) Nxtstate = A;
					 else if (request) Nxtstate = B;	 
					 
            B: if (request & ~confirm) Nxtstate = E;  
                else if(request & confirm) Nxtstate = C;
					 else if(~request) Nxtstate = A;

            C: if(~request) Nxtstate = A;  
					 else if (request & confirm) Nxtstate = D;

				D: if(~request) Nxtstate = A;  
				
				E: if(~request) Nxtstate = A;  
         endcase
			
	always @ (Prstate or confirm or request or time_data)
         case (Prstate)
            A: begin
				en_P=1'b0 ; en_Q=1'b0 ; 
				end
            B: begin 
				en_P=1'b0 ; en_Q=1'b0 ; 
				end
            C: begin 
				en_P=1'b0 ; en_Q=1'b0 ; 
				end
            E: begin 
				en_P=1'b0 ; en_Q=1'b0 ; 
				end
            D: begin
				if (time_data == 8'b1111xxxx) begin
				en_P = 1'b1;
				en_Q = 1'b0;
				end
				else begin 
				en_P = 1'b0;
				en_Q = 1'b1;
				end
				end
	         endcase

endmodule


module controller(
	input [2:0] system_token,
	input request,
	input [7:0] TimeData,
	input reset,
	input clock,
	input confirm,
	input [2:0] user_token,
	output [7:0] data_Q,
	output [7:0] data_P);
	
	wire en_Q;
	wire en_P;
	
	fsm fsm1(request, TimeData, reset, clock, confirm, en_P, en_Q);
	register r1(TimeData, clock, reset, en_P, data_P);
	register r2(TimeData, clock, reset, en_Q, data_Q);
	
endmodule