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

module half_adder(
	input a,
	input b,
	output c,
	output s);
	
	xor x(s, a, b);
	and a(c, a, b);

endmodule


module full_adder(
	input a,
	input b,
	input cin,
	output s,
	output cout);
	
	wire carryg, carryp, sum1;
	
	half_adder
		ha1(.a(a), .b(b), .c(carryg), .s(sum1)),
		ha2(.a(sum1), .b(cin), .c(carryp), .s(s));
		
	or o(cout, carryp, carryg);
	
endmodule


module ripple_carry(
	input cin,
	input [3:0] a,
	input [3:0] b,
	output [3:0] s,
	output cout);
	
	wire cout0, cout1, cout2;
	full_adder
		fa1(a[0], b[0], cin, s[0], cout0),
		fa2(a[1], b[1], cout0, s[1], cout1),
		fa3(a[2], b[2], cout1, s[2], cout2),
		fa4(a[3], b[3], cout2, s[3], cout);

endmodule


module addder_8bit(
    input cin,
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output cout);

    wire cout3;
	 
    ripple_carry
        rc1(cin, a[3:0], b[3:0], s[3:0], cout3),
        rc2(cout3, a[7:4], b[7:4], s[7:4], cout);
		  
endmodule


module time_calculate(
	time_out,
	time_in,
	time_total);
	
	input [7:0] time_out;
	input [7:0] time_in;
	output [7:0] time_total;
	input bin;
	output bout;
	wire [7:0] e;
	
	xor
        x0(e[0], time_in[0], bin),
        x1(e[1], time_in[1], bin),
        x2(e[2], time_in[2], bin),
        x3(e[3], time_in[3], bin),
        x4(e[4], time_in[4], bin),
        x5(e[5], time_in[5], bin),
        x6(e[6], time_in[6], bin),
        x7(e[7], time_in[7], bin);

	addder_8bit
        a8(bin, time_out[7:0], e, time_total[7:0], bout);

endmodule