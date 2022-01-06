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
---  Module Name: time_calculate
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module one_bit_full_adder(
	Sum,
	Cout,
	A,
	B,
	Cin);

	output Sum,Cout;
	input A, B, Cin;
	
	wire t1, t2, t3;
	
	assign #10 t1= A ^ B;
	assign #5 t2= A & B;
	assign #5 t3= Cin & t1;
	
	assign #10 Sum = t1^Cin;
	assign #5 Cout= t2 | t3;
	
endmodule


module one_bit_adder_subtractor(
	Sum,
	Cout,
	A,
	B,
	Sel,
	Cin);
	
	output Sum,Cout;
	input A, B, Sel, Cin;
	
	wire Bs;
	assign #10 Bs = B^Sel;
	
	one_bit_full_adder obfa(Sum, Cout, A, Bs, Cin);
	
endmodule


module four_bit_adder_subtractor(
	Sum,
	Cout,
	A,
	B,
	Sel);
	
	output [3:0] Sum;
	output Cout;
	input [3:0] A;
	input [3:0] B;
	input Sel;
	
	wire carry[2:0];
	one_bit_adder_subtractor obas1(Sum[0],carry[0],A[0],B[0],Sel,Sel),
									 obas2(Sum[1],carry[1],A[1],B[1],Sel,carry[0]),
									 obas3(Sum[2],carry[2],A[2],B[2],Sel,carry[1]),
									 obas4(Sum[3],Cout,A[3],B[3],Sel,carry[2]);
									 
endmodule


module time_calculate(
	time_out,
	time_in,
	time_total);
	
	input [7:0] time_out;
	input [7:0] time_in;
	output [7:0] time_total;
	wire cout0;
	wire cout1;
	
	four_bit_adder_subtractor fbastc1(time_total[3:0], cout0, time_out[3:0], time_in[3:0], 1'b1),
									  fbastc2(time_total[7:4], cout1, time_out[7:4], time_in[7:4], cout0);
	
endmodule