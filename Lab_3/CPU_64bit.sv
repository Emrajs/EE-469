module CPU_64bit (clk, reset);
	input logic clk, reset;
	logic [63:0] ReadData1, ReadData2;
	logic [31:0] instruction;
	
	//logic [4:0] selectRegister [1:0];
	wire [4:0] Rd, Rm, Rn;
	logic RegWrite;
	//wire chooseRegister;
	//assign Rd = selectRegister[0];
	//assign Rm = selectRegister[1];
	//logic Reg2Loc;
	
	//mux2_1 reg2locSignal(.in(selectRegister[1:0]), .sel(Reg2Loc), .out(chooseRegister));
	regfile registerFile (.ReadData1, .ReadData2, .WriteData(Rd), .ReadRegister1(Rn), .ReadRegister2(Rm), .RegWrite, .clk);
endmodule