`timescale 1ns / 1ps
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
---  Module Name: entry_checker 
-----------------------------------------------------------*/

module entry_checker(
	entry,
	parking_capacity,
	enable);
 
	input entry;
	input [7:0] parking_capacity;
	output reg enable;
 
	always @ (entry or parking_capacity)
		if (entry == 0 | parking_capacity == 8'b00000000)
				enable = 1'b0;
		else 
				enable = 1'b1;
 
endmodule
