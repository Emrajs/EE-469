/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		Creates a 8 x 1 MUX using 4 x 1 and 2 x 1 MUXs.  
*
*	Inputs:
*		in: 
*     sel:
*
*	Outputs:
*     out: 
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
	logic [1:0] in;
	logic sel;
	logic out;
	
	mux8_1 dut (.in, .sel, .out);
	
	initial begin 
		sel = 0; in[0] = 0; in[1] = 0; #100;
		//not tested
	end

endmodule