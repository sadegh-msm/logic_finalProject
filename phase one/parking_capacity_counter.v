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
---  Module Name: parking_capacity_counter
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module parking_capacity_counter(
	new_capacity,
	parked,
	empty);
	
	input [7:0] new_capacity;
	output [3:0] parked;
	output [3:0] empty;
	wire [3:0] s0;
	wire [3:0] s1;
	wire [3:0] s2;
	wire [3:0] s3;
	wire [3:0] s4;
	wire [3:0] s5;
	wire [3:0] s6;
	wire [7:0] cout;
	wire coutn;
	
	four_bit_adder_subtractor fbas1(4'b0000, {000, new_capacity[0]}, 1'b0, cout[0], s0),
									  fbas2(s0, {000, new_capacity[1]}, cout[0], cout[1], s1),
									  fbas3(s1, {000, new_capacity[2]}, cout[1], cout[2], s2),
									  fbas4(s2, {000, new_capacity[3]}, cout[2], cout[3], s3),
									  fbas5(s3, {000, new_capacity[4]}, cout[3], cout[4], s4),
									  fbas6(s4, {000, new_capacity[5]}, cout[4], cout[5], s5),
									  fbas7(s5, {000, new_capacity[6]}, cout[5], cout[6], s6),
									  fbas8(s6, {000, new_capacity[7]}, cout[6], cout[7], empty),
									  fbas(4'b1000, empty, 1'b1, cout[7], parked);
	
endmodule