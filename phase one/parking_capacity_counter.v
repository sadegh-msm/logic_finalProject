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

module one_bit_full_adder(
	S,
	Cout,
	A,
	B,
	Cin);

	output S,Cout;
	input A, B, Cin;
	
	wire t1, t2, t3;
	
	assign #10 t1= A^B;
	assign #5 t2= A & B;
	assign #5 t3= Cin & t1;
	
	assign #10 S = t1^Cin;
	assign #5 Cout= t2 | t3;
	
endmodule


module one_bit_adder_subtractor(
	S,
	Cout,
	A,
	B,
	Sel,
	Cin);
	
	output S,Cout;
	input A, B, Sel, Cin;
	
	wire Bs;
	assign #10 Bs = B^Sel;
	
	one_bit_full_adder obfa(S,Cout,A,Bs,Cin);
	
endmodule


module four_bit_adder_subtractor(
	S,
	Cout,
	A,
	B,
	Sel);
	
	output [3:0] S;
	output Cout;
	input [3:0] A;
	input [3:0] B;
	input Sel;
	
	wire carry[2:0];
	one_bit_adder_subtractor obas1(S[0],carry[0],A[0],B[0],Sel,Sel),
									 obas2(S[1],carry[1],A[1],B[1],Sel,carry[0]),
									 obas3(S[2],carry[2],A[2],B[2],Sel,carry[1]),
									 obas4(S[3],Cout,A[3],B[3],Sel,carry[2]);
									 
endmodule


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
	
	four_bit_adder_subtractor fbas1(s0, cout[0], 4'b0000, new_capacity[0], 1'b0),
									  fbas2(s1, cout[1], s0, cout[0], 1'b0),
									  fbas3(s2, cout[2], s1, cout[1], 1'b0),
									  fbas4(s3, cout[3], s2, cout[2], 1'b0),
									  fbas5(s4, cout[4], s3, cout[3], 1'b0),
									  fbas6(s5, cout[5], s4, cout[4], 1'b0),
									  fbas7(s6, cout[6], s5, cout[5], 1'b0),
									  fbas8(empty, cout[7], s6, cout[6], 1'b0),
									  fbas(parked, coutn, 4'b1111, empty, 1'b1);
	
endmodule