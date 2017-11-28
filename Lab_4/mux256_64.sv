/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		A 256x64 mux which selects between four 64 bit input wire buses.
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

module mux256_64 (inThree, inTwo, inOne, inZero, sel, out);
	input logic [63:0] inThree, inTwo, inOne, inZero;
	input logic [1:0] sel;
	output logic [63:0] out;

	genvar i;
	
	generate 
		for (i = 0; i < 64; i++) begin : eachRouteMux
			mux_4_1 routeMux1 (.in({inThree[i], inTwo[i], inOne[i], inZero[i]}), .sel(sel), .out(out[i]));
		end
	endgenerate 

endmodule

module mux256_64_testbench();
	logic [63:0] inThree, inTwo, inOne, inZero, out;
	logic [1:0] sel;
	
	mux256_64 dut (.inThree, .inTwo, .inOne, .inZero, .sel, .out);
	
	initial begin 
		sel = 2'b00; inThree = 64'hFFFFFFFF00000000; inTwo = 64'h00000000FFFFFFFF; inOne = 64'hFFFFFFFFFFFFFFFF; inZero = 64'h0000000000000000; #100;
		sel = 2'b01;				                     										 																				 #100;
		sel = 2'b00; inThree = 64'hFFFFFFFF00000000; inTwo = 64'h00000000FFFFFFFF; inOne = 64'hFFFFFFFFFFFFFFFF; inZero = 64'h0000000000000000; #100;
		sel = 2'b10;				                     										 																				 #100;
		sel = 2'b00; inThree = 64'hFFFFFFFF00000000; inTwo = 64'h00000000FFFFFFFF; inOne = 64'hFFFFFFFFFFFFFFFF; inZero = 64'h0000000000000000; #100;
		sel = 2'b11;				                     										 																				 #100;
		sel = 2'b00; inThree = 64'hFFFFFFFF00000000; inTwo = 64'h00000000FFFFFFFF; inOne = 64'hFFFFFFFFFFFFFFFF; inZero = 64'h0000000000000000; #100;
		sel = 2'b01;				                     										 																				 #100;
	end

endmodule