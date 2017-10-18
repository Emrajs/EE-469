/*
File name: alu_1bit.sv

Authors: Emraj Sidhu and Nesta

Description. Very basic alu so far. Can AND a and b,
OR a and b, or add a and b. Subtractor (a - B) still
needs to be implemented. 
*/


module alu_1bit (a, b, out, Cin, Cout, en);
	input logic  a;
	input logic  b;
	output logic out;
	input logic Cin;
	output logic Cout;
	input logic [1:0] en;
	
	wire[3:0] w;
	
	not not1 (w[0], a);
	and and1 (w[1], b, a);
	or  or1  (w[2], b, a);
	fullAdder_1bit submodule1 (.a, .b, .out(w[3]), .Cin, .Cout);
	mux_4_1  submodule2 (.in(w[3:0]), .sel(en[1:0]), .out);		
endmodule

module alu_1bit_testbench();
 logic a, b, Cin;
 logic out, Cout;
 logic [1:0] en;
 
 alu_1bit dut (.a, .b, .out, .Cin, .Cout, .en);
 
 initial begin
	en[0] = 0; en[1] = 0;
	#100;
	a = 0; b = 0;
	#100;
	b = 1;
	#100;
	a = 1; b = 0;
	#100;
	en [0] = 1;
	#100;
	a = 0; b = 0;
	#100;
	b = 1;
	#100;
	a = 1; b = 0;
	#100;
	b = 1;
	#100;
	en[0] = 0; en[1] = 1;
	#100;
	a = 0; b = 0;
	#100;
	a = 1;
	#100;
	b = 1;
	#100;
	en[0] = 1;
	#100;
	a = 0;
   b = 0;
	Cin = 0;
	#100;
	Cin = 1;
   #100;
	Cin = 0;
	b = 1;
	#100;
	Cin = 1;
	#100;
	b = 0;
	Cin = 0;
	a = 1;
	#100;
	Cin = 1;
	#100;
	Cin = 0;
	b = 1;
	#100;
	Cin = 1;
	#100;	
 end
endmodule