/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		Creates a 8 x 1 MUX using 4 x 1 and 2 x 1 MUXs.  
*
*	Inputs:
*		in: A seven bit input signal.
*     sel: A three bit input signal which decides which input bit is routed to
*          the output:
*           sel[3] sel[1] sel[0] |   out
*             0      0      0    |  in[0]
*             0      0      1    |  in[1]
*             0      1      0    |  in[2]
*             0      1      1    |  in[3]
*             1      0      0    |  in[4]
*             1      0      1    |  in[5]
*             1      1      0    |  in[6]
*             1      1      1    |  in[7]
*
*	Outputs:
*     out: The single bit output.
*
*******************************************************************************/
`timescale 10ps/1fs

module mux8_1 (in, sel, out);
	input logic [7:0] in;
	input logic [2:0] sel;
	output logic out;
	
	logic [1:0] mout;

   mux_4_1 mux1 (.in(in[3:0]), .sel(sel[1:0]), .out(mout[0]));
	mux_4_1 mux2 (.in(in[7:4]), .sel(sel[1:0]), .out(mout[1]));
	mux2_1 mux3 (.in(mout[1:0]), .sel(sel[2]), .out(out));

endmodule

module mux8_1_testbench();
	logic [7:0] in;
	logic [2:0] sel;
	logic out;
	
	mux8_1 dut (.in, .sel, .out);
	
	integer i;
	
	initial begin 
		sel[2:0] = 3'b000;
		in[7:0] = 8'b00000000;
		
		for(i=0; i<9; i++) begin
			{sel[2], sel[1], sel[0]} = i; #100;
		   
			in = 8'b00000001; #100;
			in = 8'b00000010; #100;
			in = 8'b00000100; #100;
			in = 8'b00001000; #100;
			in = 8'b00010000; #100;
			in = 8'b00100000; #100;
			in = 8'b01000000; #100;
			in = 8'b10000000; #100;
		end
	end

endmodule