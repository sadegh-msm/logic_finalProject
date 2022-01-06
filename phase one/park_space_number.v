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
	
assign park_number = (parking_capacity[7] == 1'b1 & enable) ? 3'b111 :
                (parking_capacity[6] == 1'b1 & enable) ? 3'b110 :
                (parking_capacity[5] == 1'b1 & enable) ? 3'b101 :
                (parking_capacity[4] == 1'b1 & enable) ? 3'b100 :
                (parking_capacity[3] == 1'b1 & enable) ? 3'b011 :
                (parking_capacity[2] == 1'b1 & enable) ? 3'b010 :
                (parking_capacity[1] == 1'b1 & enable) ? 3'b001 :
                (parking_capacity[0] == 1'b1 & enable) ? 3'b000 : 3'bzzz;
    
		
endmodule