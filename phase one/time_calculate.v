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
	bit1,
	bit2,
	cin,
	sum,
	cout
    );
	 
	input bit1;
	input bit2;
	input cin;
	output sum;
	output cout;
 
	wire w1, w2, w3;
  
	xor g1(w1, bit1, bit2);
	and g2(w2, w1, cin),
		g3(w3, bit1, bit2);
 
	xor g4(sum, w1, cin);
	or g5(cout, w2, w3);
endmodule


module one_bit_adder_subtractor(
	bit1,
	bit2,
	selector,
	cin,
	sum,
	cout
    );
	 
  input bit1;
  input bit2;
  input selector;
  input cin;
  output sum;
  output cout;
  
  wire w;
  xor g1 (w, bit2, selector);
  one_bit_full_adder f(bit1, w, cin, sum, cout);
  
  endmodule


module four_bit_adder_subtractor(
    num1,
	 num2,
	 selector,
	 cout,
	 sum
    );
	 
	 input [3:0] num1;
	 input [3:0] num2;
	 input selector;
	 output cout;
	 output [3:0] sum;
	 
	  wire c1, c2, c3;
	 one_bit_adder_subtractor a1(.bit1(num1[0]), .bit2(num2[0]), .selector(selector), .cin(selector), .sum(sum[0]), .cout(c1));
	 one_bit_adder_subtractor a2(.bit1(num1[1]), .bit2(num2[1]), .selector(selector), .cin(c1), .sum(sum[1]), .cout(c2));
	 one_bit_adder_subtractor a3(.bit1(num1[2]), .bit2(num2[2]), .selector(selector), .cin(c2), .sum(sum[2]), .cout(c3));
	 one_bit_adder_subtractor a4(.bit1(num1[3]), .bit2(num2[3]), .selector(selector), .cin(c3), .sum(sum[3]), .cout(cout));


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
	
	four_bit_adder_subtractor fbastc1(time_out[3:0], time_in[3:0], 1'b1, cout0, time_total[3:0]),
									  fbastc2(time_out[7:4], time_in[7:4], cout0, cout1, time_total[7:4]);
	
endmodule