/*
Authors: Emraj Sidhu and Nesta

File Name: mux32_1.sv

Description: Creates the 32 x 1 mux using two 16 x 1 muxes and a 2 x 1 mux.
The two 16 x 1 muxes provide 32 total inputs and then the outputs from those
muxes are put into one 2 x 1 mux, giving the whole system one output
*/

module mux32_1 (in, sel, out);
	input logic [31:0] in;
	input logic [4:0] sel;
	output logic out;
	
	wire [1:0] w;
	mux16_1 submodule_1 (.in(in[15:0]), .sel(sel[3:0]), .out(w[0]));
	mux16_1 submodule_2 (.in(in[31:16]), .sel(sel[3:0]), .out(w[1]));
	mux2_1  submodule_3 (.in(w[1:0]), .sel(sel[4]), .out(out));  
endmodule 