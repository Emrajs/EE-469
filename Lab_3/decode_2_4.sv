/*
Authors: Emraj Sidhu and Nesta

File name: decode_2_4.sv

Description: This module creates a 2:4 decoder using gate level logic.
*/
`timescale 10ps/1fs

module decode_2_4(in, out, en) ;
	output logic [3:0] out;
	input logic [1:0] in;
	input en;

	wire [1:0] w;
	
	not #5 not1 (w[0], in[0]);
	not #5 not2 (w[1], in[1]);
	and #5 and1 (out[0], en, w[0], w[1]);
	and #5 and2 (out[1], en, in[0], w[1]);
	and #5 and3 (out[2], en, w[0], in[1]);
	and #5 and4 (out[3], en, in[0], in[1]);

endmodule

module decode_2_4_testbench();
	logic [3:0] out;
	logic [1:0] in;
	logic en;
	
	decode_2_4 dut (.in, .out, .en);
	
	initial begin 
		in[0] = 0; in[1] = 0; en = 1'b0; #100;
		                      en = 1'b1; #100;
		in[0] = 1;                       #100;
		in[0] = 0; in[1] = 1;            #100;
		in[0] = 1;                       #100;
		                      en = 1'b0; #100;
	end
endmodule 