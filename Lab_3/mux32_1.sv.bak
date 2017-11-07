module mux32_1 (in, sel, out);
	input logic [31:0] in;
	input logic [4:0] sel;
	output logic out;
	
	wire [1:0] w;
	mux16_1 submodule_1 (.in(in[15:0]), .sel(sel[3:0]), .out(w[0]));
	mux16_1 submodule_2 (.in(in[31:16]), .sel(sel[3:0]), .out(w[1]));
	mux2_1  submodule_3 (.in(w[1:0]), .sel(sel[4]), .out(out));  
endmodule 