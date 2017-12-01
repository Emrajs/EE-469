/*******************************************************************************
*	Description:
*		A D_FF module for a pipelined cpu. Used to break up logic in stages.
*	
*	Inputs:
*		d: The 64 bits of data to be written to the flipflop.
*		clk: The system clock.
*
*	Outputs:
*		q: The 64 bits of data signal stored in the flip flop.
*
*******************************************************************************/

module Pipe_D_FF (q, d, reset, clk);
	input logic [63:0] d;
	input logic clk, reset;
	output logic [63:0] q;
	
	genvar a;
	
	generate 
		for (a = 0; a < 64; a++) begin : eachFlop
			D_FF oneFlop (.q(q[a]), .d(d[a]), .reset, .clk);
		end
	endgenerate
	
endmodule 

module Pipe_D_FF_testbench();
	logic [63:0] q, d;
	logic clk, reset;

	Pipe_D_FF dut (.q, .d, .reset, .clk);

	initial begin
		q=64'h00000000; d=64'h00000000; clk=0; #10;
		

		d=64'h11111111; clk=0; #10;
		d=64'h11111111; clk=1; #10;
		d=64'h00000000; clk=0; #10;
		d=64'h00000000; clk=1; #10;
		d=64'h10101010; clk=0; #10;
		d=64'h10101010; clk=0; #10;
		d=64'h10101010; clk=0; #10;
		d=64'h10101010; clk=1; #10;
		d=64'hAAAAAAAA; clk=0; #10;
		d=64'hAAAAAAAA; clk=1; #10;
		d=64'hAAAAAAAA; clk=0; #10;
		
	end
endmodule 