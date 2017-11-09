/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		A full 64 bit adder.
*
*	Inputs:
*		A: The first 64 bit input
*     B: The
*			
*	Outputs:
*		result: The 64 bit output result.
*
*******************************************************************************/
`timescale 10ps/1fs

module fullAdder_64bit (A, B, result);
	input logic [63:0] A, B;
	output logic [63:0] result;
   logic [63:0] adderConnect;
	
	//Sets up the first 1 bit Adder outside the loop to change Cin
	fullAdder_1bit firstAdder (.a(A[0]), .b(B[0]), .out(result[0]), .Cin(1'b0), .Cout(adderConnect[0]));
	
	//Generates the Adders for bits 63-2 of the result
	genvar i;
	generate 
		for (i = 1; i < 63; i++) begin: makeAdder
			fullAdder_1bit largeAdder (.a(A[i]), .b(B[i]), .out(result[i]), .Cin(adderConnect[i - 1]), .Cout(adderConnect[i]));
		end
	endgenerate
	
	//Sets up the last 1 bit Adder outside the loop
	fullAdder_1bit sixtyFourthAdder (.a(A[63]), .b(B[63]), .out(result[63]), .Cin(adderConnect[62]), .Cout(adderConnect[63]));
	
endmodule

module adderstim();

	parameter delay = 100000;

	logic		[63:0]	A, B;
	logic		[63:0]	result;

	fullAdder_64bit dut (.A, .B, .result);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin
		
		$display("%t testing addition", $time);
		A = 64'h0000000000000001; B = 64'h0000000000000001;
		#(delay);
		assert(result == 64'h0000000000000002);
		
		A = 64'h0000000000000000; B = 64'h0000000000000000;
		#(delay);
		assert(result == 64'h0000000000000000);
		
		A = 64'hFFFFFFFFFFFFFFFF; B = 64'hFFFFFFFFFFFFFFFF;
		#(delay);
		assert(result == 64'hFFFFFFFFFFFFFFFE);
		
		A = 64'h5000000000000000; B = 64'hC000000000000000;
		#(delay);
		assert(result == 64'h1000000000000000);
		
		A = 64'h3000000000000000; B = 64'h6000000000000000;
		#(delay);
		assert(result == 64'h9000000000000000);
		
		A = 64'hFFFFFFFFFFFFFFFF; B = 64'h0000000000000001;
		#(delay);
		assert(result == 64'h0000000000000000);
	end
endmodule