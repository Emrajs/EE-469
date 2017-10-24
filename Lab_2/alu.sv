/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		This file acts as a full 64 bit ALU module that can take an input
*     control signal and perform an operation on the data signals A and B.
*
*	Inputs:
*		A: The 64 bit signal which you are performing operations on.
*     B: The 64 bit signal which you are performing operations with.
*     cntrl: The three bit signal corresponding to the following:
*
*		 cntrl			Operation						Notes:
*		 000:			result = B						
*		 010:			result = A + B
*		 011:			result = A - B						Implemented in full alu module
*		 100:			result = bitwise A & B		
*		 101:			result = bitwise A | B		
*		 110:			result = bitwise A XOR B	
*
*	Outputs:
*		result: The 64 bit signal output from the specified operation.
*     negative: whether the result output is negative if interpreted as 2's comp.
*     zero: whether the result output was a 64-bit zero.
*		overflow: on an add or subtract, whether the computation overflowed if the inputs are interpreted as 2's comp.
*		carry_out: on an add or subtract, whether the computation produced a carry-out.
*
*******************************************************************************/
`timescale 10ps/1fs

module alu (A, B, cntrl, result, negative, zero, overflow, carry_out);
	input logic [63:0] A, B;
	input logic [2:0]  cntrl;
	output logic [63:0] result;
	output logic negative, zero, overflow, carry_out;
   logic [62:0] aluConnect;
	
	//Sets up the first 1 bit alu outside the loop to change Cin
	alu_1bit firstAlu (.a(A[0]), .b(B[0]), .out(result[0]), .Cin(cntrl[0]), .Cout(aluConnect[0]), .en(cntrl[2:0]));
	
	//Generates the ALUs for bits 63-2 of the result
	genvar i;
	generate 
		for (i = 1; i < 63; i++) begin: makeAlu
			alu_1bit largeAlu (.a(A[i]), .b(B[i]), .out(result[i]), .Cin(aluConnect[i - 1]), .Cout(aluConnect[i]), .en(cntrl[2:0]));
		end
	endgenerate
	
	//Sets up the last 1 bit alu outside the loop to set the carry_out flag
	alu_1bit sixtyFourthAlu (.a(A[63]), .b(B[63]), .out(result[63]), .Cin(aluConnect[62]), .Cout(carry_out), .en(cntrl[2:0]));
	
	
	// Logic for the zero flag
	zero_flag check (.result, .checkZero(zero));
	
	// Negative flag: If last bit is 1 (negativ) or 0 (positive) for 2'comp.
	assign negative = result[63];
	
	// Overflow check. XOR between carryin and carryout of the 64th 1-bit ALU.
	xor #5 overflowCheck (overflow, carry_out, aluConnect[62]);
endmodule