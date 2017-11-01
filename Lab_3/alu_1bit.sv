/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		A single bit alu module which can compute the following:
*
*			out = B
*			out = A + B
*		   out = bitwise A & B		
*			out = bitwise A | B		
*		   out = bitwise A XOR B	
*
*	Inputs:
*		a: The bit which you are performing operations on.
*     b: The bit which you are performing operations with.
*     Cin: The carry in bit, where the LSB should be hooked up to a subtract 
*          control signal (if implementing subtraction) or the Cout of the 
*          previous adder.
*     en: The control signal used to select the desired out signal:
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
*     out: The single bit result of the requested operation.
*     Cout: The carry out bit used in addition and subtraction
*
*******************************************************************************/
`timescale 10ps/1fs

module alu_1bit (a, b, out, Cin, Cout, en);
	input logic [2:0] en;
	input logic  a, b, Cin;
	output logic out, Cout;
	logic [3:0] result;
	logic bBar, actualB;
	
	//And, or, and xor
	and #5 and1 (result[0], b, a);
	or  #5 or1  (result[1], b, a);
	xor #5 xor1 (result[2], b, a);
	not #5 not1 (bBar, b);
	
	//Addition (or subtraction with proper external control signal)
	fullAdder_1bit submodule1 (.a, .b(actualB), .out(result[3]), .Cin, .Cout);
	
	//Selecting whether add or subtract using a mux
	mux2_1 mux1 (.in({bBar, b}), .sel(en[0]), .out(actualB));
	
	//Information routing
	mux8_1  submodule2 (.in({1'b0, result[2:0], result[3], result[3], 1'b0, b}), .sel(en[2:0]), .out);		
endmodule

module alu_1bit_testbench();
	logic a, b, Cin;
	logic out, Cout;
	logic [2:0] en;
	logic bBar;
	 
	alu_1bit dut (.a, .b, .out, .Cin, .Cout, .en);
	 
	integer i;
	 
	initial begin
		//Set important inputs to zero
		a = 1'b0; b = 1'b0; Cin = 1'b0; bBar = ~b; #100;
		
		$display("%t testing addition", $time);
				
			en = 3'b010; #100;
		 
			for(i=0; i<8; i++) begin
					{a, b, Cin} = i; bBar = ~b; #100;
			end
		 
		$display("%t testing subtraction", $time);
		 
			a = 1'b0; b = 1'b0; Cin = 1'b0; #100;
			en = 3'b011; #100;
	 
			for(i=0; i<8; i++) begin
				{a, b, Cin} = i; bBar = ~b; #100;
			end
		 
		$display("%t testing and", $time);
		 
			a = 1'b0; b = 1'b0; Cin = 1'b0; #100;
			en = 3'b100; #100;
		 
			for(i=0; i<8; i++) begin
				{a, b, Cin} = i; #100;
			end
		 
		$display("%t testing or", $time);
		 
			a = 1'b0; b = 1'b0; Cin = 1'b0; #100;
			en = 3'b101; #100;
		 
			for(i=0; i<8; i++) begin
				{a, b, Cin} = i; #100;
			end
		 
		$display("%t testing xor", $time);
		 
			a = 1'b0; b = 1'b0; Cin = 1'b0; #100;
			en = 3'b110; #100;
		 
			for(i=0; i<8; i++) begin
				{a, b, Cin} = i; #100;
			end
	 
	end
endmodule