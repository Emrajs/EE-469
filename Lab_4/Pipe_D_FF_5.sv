/*******************************************************************************
*	Description:
*		A D_FF module for a pipelined cpu. Used to break up logic in stages.
*	
*	Inputs:
*		d: The 5 bits of data to be written to the flipflop.
*		clk: The system clock.
*
*	Outputs:
*		q: The 5 bits of data signal stored in the flip flop.
*
*******************************************************************************/

module Pipe_D_FF_5 (q, d, reset, clk);
	input logic [4:0] d;
	input logic clk, reset;
	output logic [4:0] q;
	
	genvar a;
	
	generate 
		for (a = 0; a < 5; a++) begin : eachFlop
			D_FF oneFlop (.q(q[a]), .d(d[a]), .reset, .clk);
		end
	endgenerate
	
endmodule 

module Pipe_D_FF_5_testbench();
	logic [4:0] q, d;
	logic clk, reset;

	Pipe_D_FF_5 dut (.q, .d, .reset, .clk);

	initial begin
		q=5'b00000; d=5'b00000; clk=0; #10;
		

		d=5'b11111; clk=0; #10;
		d=5'b11111; clk=1; #10;
		d=5'b00000; clk=0; #10;
		d=5'b00000; clk=1; #10;
		d=5'b10101; clk=0; #10;
		d=5'b10101; clk=0; #10;
		d=5'b10101; clk=0; #10;
		d=5'b10101; clk=1; #10;
		d=5'b11110; clk=0; #10;
		d=5'b11110; clk=1; #10;
		d=5'b11110; clk=0; #10;
		
	end
endmodule 