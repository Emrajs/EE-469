/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		This module acts as a simple 16x1 NOR gate with an inverted output.
*
*	Inputs:
*		result: A 16 bit signal which is checked through a series of gates to 
*		        determine whether it has a value of 0 or !0.
*
*	Outputs:
*		checkZero: A one bit signal that returns 1 if result is 0, and 1 if result
*                is 0.
*
*******************************************************************************/
`timescale 10ps/1fs

module nor_16x1(result, checkZero);
	input logic [15:0] result;
   output logic checkZero;
	logic [3:0] x;
	
	//These Gates OR the signals together
	or #5 or1 (x[0], result[3], result[2], result[1], result[0]);
	or #5 or2 (x[1], result[7], result[6], result[5], result[4]);
	or #5 or3 (x[2], result[11], result[10], result[9], result[8]);
	or #5 or4 (x[3], result[15], result[14], result[13], result[12]);
	
	//This Gate NORs the result
	nor #5 nor1 (checkZero, x[0], x[1], x[2], x[3]);
	
endmodule

module nor_16x1_testbench();
	logic [15:0] result;
	logic checkZero;
	
   nor_16x1 dut (.result, .checkZero);
	
	integer i;
	
	initial begin 
	   //Output should stay zero at this time
		result = 16'h0000; #100;
		
		//Should be 1 as soon as in != 0
		for(i=0; i<255; i++) begin
			result=i; #100;
			result[15:8]=i; result[7:0]=8'h00; #100;
		end
	end

endmodule