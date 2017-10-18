/*
Authors: Emraj Sidhu and Nesta

File name: mux2_1.sv

Description: Creates a 2 x 1 mux using gate level logic.
*/
`timescale 10ps/1fs

module mux2_1 (in, sel, out);
	input logic [1:0] in;
	input logic sel;
	output logic out;
	
	wire [2:0] w;
	
	not #5 not1 (w[0], sel);
	and #5 and1 (w[1], w[0], in[0]);
	and #5 and2 (w[2], sel, in[1]);
	or  #5 or1  (out, w[1], w[2]);
endmodule

module mux2_1_testbench();
	logic [1:0] in;
	logic sel;
	logic out;
	
	mux2_1 dut (.in, .sel, .out);
	
	initial begin 
		sel = 0; in[0] = 0; in[1] = 0; #100;
		         in[0] = 1;				 #100;
		sel = 1; in[0] = 0;            #100;
		         in[0] = 1;            #100;
		                    in[1] = 1; #100;
	end

endmodule

