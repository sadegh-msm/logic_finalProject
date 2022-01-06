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
---  Module Name: park_space_number 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module park_space_number(
	enable,
	parking_capacity,
	park_number);
	
	input enable;
	input [7:0] parking_capacity;
	output reg [2:0] park_number;
	
	always @ (parking_capacity, enable)
		begin
			if(enable == 0)
				park_number =3'bzzz;
			else
				case (parking_capacity)
					8'b00000001: park_number = 3'b000;
					8'b00000010: park_number = 3'b001;
					8'b00000100: park_number = 3'b010;
					8'b00001000: park_number = 3'b011;
					8'b00010000: park_number = 3'b100;
					8'b00100000: park_number = 3'b101;
					8'b01000000: park_number = 3'b110;
					8'b10000000: park_number = 3'b111;
					default: park_number =3'bxxx;
				endcase
		end
		
endmodule