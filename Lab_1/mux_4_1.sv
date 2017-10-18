/*
Authors: Emraj Sidhu and Nesta

File name: mux_4_1.sv

Description: Creates a 4 x 1 mux using gate level logic.
*/
`timescale 10ps/1fs

module mux_4_1(in, sel, out);
	input logic [3:0] in;
	input logic [1:0] sel;
	output logic out;
	
	wire[5:0] w;
	
	not #5 not1 (w[0], sel[0]);
	not #5 not2 (w[1], sel[1]);
	and #5 and1 (w[2], in[0], w[0], w[1]);
	and #5 and2 (w[3], in[1], sel[0], w[1]);
	and #5 and3 (w[4], in[2], w[0], sel[1]);
	and #5 and4 (w[5], in[3], sel[0], sel[1]);
	or  #5 or1  (out, w[2], w[3], w[4], w[5]);
endmodule

module mux_4_1_testbench();
	logic [3:0] in;
	logic [1:0] sel;
	logic out;
	
	mux_4_1 dut (.in, .sel, .out);
	
	initial begin
	in[0] = 0;
	in[1] = 0;
	in[2] = 0;
	in[3] = 0;
	sel[0] = 0;
	sel[1] = 0;
	#100;
	in[0] = 1;
	#100;
	in[0] = 0;
	#100;
	sel[0] = 1;
	#100;
	in[1] = 1;
	#100;
	in[1] = 0;
	#100;
	sel[0] = 0;
	sel[1] = 1;
	#100;
	in[2] = 1;
	#100;
	in[2] = 0;
	#100;
	sel[0] = 1;
	#100;
	in[3] = 1;
	#100;
	in[3] = 0;
	in[2] = 1;
	#100;
	end

endmodule