/*
Authors: Emraj Sidhu and Nesta

File Name: mux16_1.sv

Description: This module creates a 16 x 1 mux by instantating the 4 x 1 mux four times.
Four 4 x 1 muxes are used for the inputs (giving a total of 16) and then the outputs from
those muxes are put through the fifth 4 x 1 mux, which gives the whole system one output.
*/

module mux16_1 (in, sel, out);
	input logic [15:0] in;
	input logic [3:0] sel;
	output logic out;
	
	wire [3:0] w;
	
	mux_4_1 submodule1 (.in(in[3:0]), .sel(sel[1:0]), .out(w[0]));
	mux_4_1 submodule2 (.in(in[7:4]), .sel(sel[1:0]), .out(w[1]));
	mux_4_1 submodule3 (.in(in[11:8]), .sel(sel[1:0]), .out(w[2]));
	mux_4_1 submodule4 (.in(in[15:12]), .sel(sel[1:0]), .out(w[3]));
	mux_4_1 submodule5 (.in(w[3:0]), .sel(sel[3:2]), .out(out));
endmodule

module mux16_1_testbench();
	logic [15:0] in;
	logic [3:0] sel;
	logic out;
	
	mux16_1 dut (.in, .sel, .out);
	
	initial begin 
		in = 16'b0000000000000000;
		sel[0] = 0;
		sel[1] = 0;
		sel[2] = 0;
		sel[3] = 0;
		#100;
		in = 16'b0000000000000001;
		#100;
		sel[2] = 1;
		#100;
		in = 16'b0000000000000000;
		#100;
		in = 16'b0000000000010000;
		#100;
		sel[1] = 1;
		#100;
		sel[0] = 1;
		sel[1] = 0;
		#100;
		in = 16'b0000000000100000;
		#100;
		sel[2] = 0;
		sel[3] = 1;
		#100;
	end
endmodule
