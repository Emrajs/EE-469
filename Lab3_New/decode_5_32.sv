/*
Authors: Emraj Sidhu and Nesta

File Name: decode_5_32.sv

Description: This module uses one 2:4 decoder and four 3:8 decoder. The 2:4 decoder
receivers two inputs and has four outputs. These ouputs are then used as enable 
signals into each of the four 3:8 decoders. These 3:8 decoders provide 8 outputs
each, for a total of 32 outputs for the whole system. The three inputs used for the
3:8 decoders and two inputs used for the 2:4 decoder give a total of 5 inputs for the
whole system. 
*/

module decode_5_32 (in, out, en);
	input logic [4:0] in;
	input logic en;
	output logic [31:0] out;
	
	wire [3:0] w;
	
	decode_2_4 submodule1 (.in(in[4:3]), .out(w[3:0]), .en(en));
	decode_3_8 submodule2 (.in(in[2:0]), .out(out[7:0]), .en(w[0]));
	decode_3_8 submodule3 (.in(in[2:0]), .out(out[15:8]), .en(w[1]));
	decode_3_8 submodule4 (.in(in[2:0]), .out(out[23:16]), .en(w[2]));
	decode_3_8 submodule5 (.in(in[2:0]), .out(out[31:24]), .en(w[3]));
endmodule

module decode_5_32_testbench();
	logic [4:0] in;
	logic en;
	logic [31:0] out;
	
	decode_5_32 dut (.in, .out, .en);
	
	initial begin 
		in[0] = 0;
		in[1] = 0;
		in[2] = 0;
		in[3] = 0;
		in[4] = 0;
		en = 1'b0;
		#120;
		en = 1'b1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 0;
		in[3] = 1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 0;
		in[3] = 0;
		in[0] = 1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 0;
		in[3] = 1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 1;
		#120;
		in[1] = 1;
		#120;
		in[0] = 0;
		in[1] = 0;
		in[2] = 0;
		in[3] = 0;
		in[4] = 1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 0;
		in[3] = 1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 1;
		#120;
		in[1] = 1;
		#120;
		in[0] = 1;
		in[1] = 0;
		in[2] = 0;
		in[3] = 0;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 0;
		in[3] = 1;
		#120;
		in[1] = 1;
		#120;
		in[1] = 0;
		in[2] = 1;
		#120;
		in[1] = 1;
		#120;	
	end
endmodule

