/*
File name: fullAdder_1bit.sv

Authors: Emraj Sidhu and Nesta

Description: This file acts as a subtractor and an adder.
NOTE: In progress
*/



module fullAdder_1bit(a, b, out, sel, Cin, Cout);
	input logic a;
	input logic b;
	input logic Cin;
	input logic sel;    // For the subtractor
	output logic Cout;
	output logic out;
	
	
	// This logic is for the subtractor (if someone wants to do a-b).
	// The regular value of B and inverted value of B is input into a 
	// 2 x 1 mux. If a-b is the operation needed to be done, then select the
	// inverted value of b and add 1 to it. Otherwise, if a+b is the operation,
	// b will stay the same. Output of this mux will go into the adder.
	// NOTE: B can be inverted. However addition of 1 still needs to be implemented.
	wire [2:0] x;
	not not1(x[0], b);
	assign x[1] = b;
	mux2_1 subtractor (.in(x[1:0]), .sel, .out(x[2]));
	
	// Gate level logic for the adder. 
	wire [2:0] w;
	xor xor1 (w[0], b, a);
	xor xor2 (out, w[0], Cin);
	and and1 (w[1], w[0], Cin);
	and and2 (w[2], b, a);
	or  or1  (Cout, w[1], w[2]);  
endmodule 

module fullAdder_1bit_testbench();
	logic a, b;
	logic Cin;
	logic Cout;
	logic out;
	logic sel;
	
	fullAdder_1bit dut (.a, .b, .out, .sel, .Cin, .Cout);
	
	initial begin
		a = 0;
		b = 0;
		sel = 1;
		#100;
		Cin = 0;
		#100;
		Cin = 1;
		#100;
		Cin = 0;
		b = 1;
		#100;
		Cin = 1;
		#100;
		b = 0;
		Cin = 0;
		a = 1;
		#100;
		Cin = 1;
		#100;
		Cin = 0;
		b = 1;
		#100;
		Cin = 1;
		#100;		
		a = 0;
		b = 0;
		sel = 0;
		#100;
		Cin = 0;
		#100;
		Cin = 1;
		#100;
		Cin = 0;
		b = 1;
		#100;
	end
endmodule