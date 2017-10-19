/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		A full adder module which takes in a 1 bit a, b, and Cin signal and gives 
8     a 1 bit out and Cout signal.
*
*	Inputs:
*		a: The bit to which you are adding or subtracting.
*     b: The bit which you are adding or subtacting.
*     Cin: The carry in bit, where the LSB should be hooked up to a subtract 
*          control signal (if implementing subtraction) or the Cout of the 
*          previous adder.
*
*	Outputs:
*		Cout: The carry out result of the adder.
*     out: The output result of the adder.
*
*******************************************************************************/
`timescale 10ps/1fs

module fullAdder_1bit(a, b, out, Cin, Cout);
	input logic a, b, Cin;
	output logic out, Cout;
	logic [3:0] x, w;
	
	// This logic is for the subtractor (if someone wants to do a-b).
	// The regular value of B and inverted value of B is input into a 
	// 2 x 1 mux. If a-b is the operation needed to be done, then select the
	// inverted value of b and add 1 to it. Otherwise, if a+b is the operation,
	// b will stay the same. Output of this mux will go into the adder.
	// NOTE: B can be inverted. However addition of 1 still needs to be implemented.
	
	//We should do this outside the full adder, in the full ALU module using the cntrl signal provided in alustim.sv!
	
	/*
	not #5 not1(x[0], b);
	assign x[1] = b;
	mux2_1 subtractor (.in(x[1:0]), .sel, .out(x[2]));
	*/
	
	// Gate level logic for the adder. 
	xor #5 xor1 (Cout, b, a, Cin);
	and #5 and1 (w[1], a, b);
	and #5 and2 (w[2], a, Cin);
	and #5 and3 (w[3], b, Cin);
	or  #5 or1  (out, w[1], w[2], w[3]);  
endmodule 

module fullAdder_1bit_testbench();
	logic a, b, out, Cin, Cout;
	
	fullAdder_1bit dut (.a, .b, .out, .Cin, .Cout);
	
	integer i;
	
	initial begin
		for(i=0; i<8; i++) begin
			{a, b, Cin} = i; #100;
		end
	end
endmodule