/*
Authors: Emraj Sidhu and Nesta

File: mux_64X32_1.sv

Description: This file makes 64 copies of the 32 X 1 mux using the generate
method in order to create the larger 64X32 mux. 
*/


module mux_64X32_1 # (parameter WIDTH = 64) (in, sel, out);
	input logic [63:0] [31:0] in;
	input logic [4:0] sel;
	output logic [63:0] out;
	
	initial assert (WIDTH > 0);
	genvar i;
	
	generate 
		for (i = 0; i < WIDTH; i++) begin : eachMux
			mux32_1 largeMux (.in(in[i][31:0]), .sel, .out(out[i]));
		end
	endgenerate 
endmodule
