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
	
	//And, or, and xor
	and #5 and1 (result[0], b, a);
	or  #5 or1  (result[1], b, a);
	xor #5 xor1 (result[2], b, a);
	
	//Addition (or subtraction with proper external control signal)
	fullAdder_1bit submodule1 (.a, .b, .out(result[3]), .Cin, .Cout);
	
	//Information routing
	mux8_1  submodule2 (.in({1'b0, result[2:0], result[3], result[3], 1'b0, b}), .sel(en[2:0]), .out);		
endmodule

module alu_1bit_testbench();
 logic a, b, Cin;
 logic out, Cout;
 logic [1:0] en;
 
 alu_1bit dut (.a, .b, .out, .Cin, .Cout, .en);
 
 initial begin
	              en[0] = 0; en[1] = 0;          #100;
	a = 0; b = 0;                                #100;
	       b = 1;                                #100;
	a = 1; b = 0;                                #100;
	              en [0] = 1;                    #100;
	a = 0; b = 0;                                #100;
	       b = 1;                                #100;
	a = 1; b = 0;                                #100;
	b = 1;                                       #100;
	              en[0] = 0; en[1] = 1;          #100;
	a = 0; b = 0;                                #100;
	a = 1;                                       #100;
	b = 1;                                       #100;
	              en[0] = 1;                     #100;
	a = 0; b = 0;                       Cin = 0; #100;
	                                    Cin = 1; #100;
	       b = 1;                       Cin = 0; #100;
	                                    Cin = 1; #100;
	a = 1; b = 0;                       Cin = 0; #100;
	                                    Cin = 1; #100;
	b = 1;                              Cin = 0; #100;
	                                    Cin = 1; #100;	
 end
endmodule