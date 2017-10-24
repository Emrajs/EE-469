/* 
File Name: alu_64bit.sv (main file)

Authors: Emraj Sidhu and Nesta Isakovic

Description: The main file used to contrust the 64 bit ALU.
*/
`timescale 10ps/1fs

module alu_64bit (a, b, cntrl, result, negative, zero, overflow, carry_out);
	input logic [63:0] a;
	input logic [63:0] b;
	input logic [2:0] cntrl;
	output logic [63:0] result;
	output logic negative, zero, overflow, carry_out;
	
	wire [63:0] w;
	
	alu_1bit firstAlu (.a(a[0]), .b(b[0]), .out(result[0]), .Cin(cntrl[0]), .Cout(w[0]), .en(cntrl[2:1]));
	
	genvar i;
	generate 
		for (i = 1; i < 63; i++) begin: makeAlu
			alu_1bit largeAlu (.a(a[i]), .b(b[i]), .out(result[i]), .Cin(w[i - 1]), .Cout(w[i]), .en(cntrl[2:1]));
		end
	endgenerate
	
	alu_1bit sixtyFourthAlu (.a(a[63]), .b(b[63]), .out(result[63]), .Cin(w[62]), .Cout(carry_out), .en(cntrl[2:1]));
	
	// Logic for the zero flag
	zero_flag check (.result, .checkZero(zero));
	
	// Negative flag: If last bit is 1 (negativ) or 0 (positive) for 2'comp.
	assign negative = result[63];
	
	// Overflow check. XOR between carryin and carryout of the 64th 1-bit ALU.
	xor #5 overflowCheck (overflow, carry_out, w[62]);
	
endmodule