/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		This module checks to see if all 64 bits of the ALU output
*     are zero. If so, the flag will be true (have a value of 1). If not, the flag
*     will be false (have a value of 0).
*
*	Inputs:
*		result: A 64 bit signal which is checked through a series of gates to 
*		        determine whether it has a value of 0 or !0.
*
*	Outputs:
*		checkZero: A one bit signal that returns 1 if result is 0, and 0 if result
*                is 1.
*
*******************************************************************************/
`timescale 10ps/1fs

module zero_flag(result, checkZero);
	input logic [63:0] result;
	output logic checkZero;
   logic [3:0] norTemp;
	
	//Routing result through 16x1 inverted NORs
	nor_16x1 nor1 (result[15:0], norTemp[0]);
	nor_16x1 nor2 (result[31:16], norTemp[1]);
	nor_16x1 nor3 (result[47:32], norTemp[2]);
	nor_16x1 nor4 (result[63:48], norTemp[3]);
	
	//NORing the result
	and #5 and1 (checkZero, norTemp[0], norTemp[1], norTemp[2], norTemp[3]);
	
endmodule

module zero_flag_testbench();
	logic [63:0] result;
	logic checkZero;
	
	zero_flag dut (.result, .checkZero);
	
	integer i;
	
	initial begin 
	   //Output should stay 1 at this time
		result = 64'h0000000000000000; #100;
		result = 64'hFFFFFFFFFFFFFFFF; #100;
		
		//Should be 0 as soon as in != 0
		for(i=0; i<100; i++) begin
			result=i; #100;
		end
	end

endmodule
