/*
Authors: Emraj Sidhu and Nesta

File name: decode_1_2.sv

Description: Creates a 1:2 decoder using gate level logic.
*/
`timescale 10ps/1fs

module decode_1_2 (in, out, en);
	input logic in, en;
	output logic [1:0] out;
	
	wire w;
	
	not #5 not1 (w, in);
	and #5 and1 (out[0], en, w);
	and #5 and2 (out[1], en, in);

endmodule

module decode_1_2_testbench();
	logic in, en;
	logic [1:0] out;
	
	decode_1_2 dut (.in, .out, .en);
	
	initial begin 
		in = 1'b0; en = 1'b0; #100;
		           en = 1'b1; #100;
		in = 1'b1;            #100;
		           en = 1'b0; #100;
	end 
endmodule