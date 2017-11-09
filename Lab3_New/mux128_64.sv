/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		A 128x64 mux which selects between two 64 bit input wire buses.
*
*	Inputs:
*		inOne: The 64 bit signal passed when the select signal is high.
*		inZero: The	64 bit signal passed when the select signal is low.
*		sel: A one bit signal for selecting the routed wire bus.
*			
*	Outputs:
*		out: The 64 bit output signal selected by the sel signal.
*
*******************************************************************************/
`timescale 10ps/1fs

module mux128_64 (inOne, inZero, sel, out);
	input logic [63:0] inOne, inZero;
	input logic sel;
	output logic [63:0] out;

	genvar i;
	
	generate 
		for (i = 0; i < 64; i++) begin : eachRouteMux
			mux2_1 routeMux1 (.in({inOne[i], inZero[i]}), .sel(sel), .out(out[i]));
		end
	endgenerate 

endmodule

module mux128_64_testbench();
	logic [63:0] inOne, inZero, out;
	logic sel;
	
	mux128_64 dut (.inOne, .inZero, .sel, .out);
	
	initial begin 
		sel = 0; inOne = 64'hFFFFFFFFFFFFFFFF; inZero = 64'h0000000000000000; #100;
		sel = 1;				                     										 #100;
		sel = 0; inOne = 64'hFFFFFFFFFFFFFFFF; inZero = 64'h0000000000000000; #100;
		sel = 1;				                      										 #100;
		sel = 0; inOne = 64'hFFFFFFFFFFFFFFFF; inZero = 64'h0000000000000000; #100;
		sel = 1;				                       										 #100;
		sel = 0; inOne = 64'hFFFFFFFFFFFFFFFF; inZero = 64'h0000000000000000; #100;
		sel = 1;				                      										 #100;
	end

endmodule