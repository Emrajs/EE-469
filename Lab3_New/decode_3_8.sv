/*
Authors: Emraj Sidhu and Nesta

File name: decode_3_8.sv

Description: In this module, the 3:8 decoder is created using two 2:4 decoders
and 1:2 decoder. The 1:2 decoder has a single input and two outputs; one output which
is used for the enable of one 2:4 decoder and the second output which is used for the
second 2:4 decoder. The two 2:4 decoders use the same inputs and have four outputs each,
giving the whole system eight outputs. Two inputs for the 2:4 decoders and one input for
the 1:2 decoder gives the system a total of 3 inputs.
*/

module decode_3_8 (in, out, en);
	input logic [2:0] in;
	input logic en;
	output logic [7:0] out;
	
	wire [1:0] w;
	
	decode_1_2 submodule1 (.in(in[2]), .out(w[1:0]), .en(en));
	decode_2_4 submodule2 (.in(in[1:0]), .out(out[3:0]), .en(w[0]));
	decode_2_4 submodule3 (.in(in[1:0]), .out(out[7:4]), .en(w[1]));	
endmodule

module decode_3_8_testbench();
	logic [2:0] in;
	logic en;
	logic [7:0] out;
	
	decode_3_8 dut (.in, .out, .en);
	
	initial begin
		in[0] = 0;
		in[1] = 0;
		in[2] = 0;
		en = 1'b0;
		#100;
		en = 1'b1;
		#100;
		in[0] = 1;
		#100;
		in[0] = 0;
		in[1] = 1;
		#100;
		in[0] = 1;
		#100;
		in[0] = 0;
		in[1] = 0;
		in[2] = 1;
		#100;
		in[0] = 1;
		#100;
		in[0] = 0;
		in[1] = 1;
		#100;
		in[0] = 1;
		#100;
	end
endmodule