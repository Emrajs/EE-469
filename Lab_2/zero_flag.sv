module zero_flag(result, checkZero);
	input logic [63:0] result;
	output logic checkZero;
	
	wire [15:0] x;
	wire [3:0] x1;
	nor nor1(x[0], result[3], result[2], result[1], result[0]);
	nor nor2(x[1], result[7], result[6], result[5], result[4]);
	nor nor3(x[2], result[11], result[10], result[9], result[8]);
	nor nor4(x[3], result[15], result[14], result[13], result[12]);
	nor nor5(x[4], result[19], result[18], result[17], result[16]);
	nor nor6(x[5], result[23], result[22], result[21], result[20]);
	nor nor7(x[6], result[27], result[26], result[25], result[24]);
	nor nor8(x[7], result[31], result[30], result[29], result[28]);
	nor nor9(x[8], result[35], result[34], result[33], result[32]);
	nor nor10(x[9], result[39], result[38], result[37], result[36]);
	nor nor11(x[10], result[43], result[42], result[41], result[40]);
	nor nor12(x[11], result[47], result[46], result[45], result[44]);
	nor nor13(x[12], result[51], result[50], result[49], result[48]);
	nor nor14(x[13], result[55], result[54], result[53], result[52]);
	nor nor15(x[14], result[59], result[58], result[57], result[56]);
	nor nor16(x[15], result[63], result[62], result[61], result[60]);
	
	nor nor17(x1[0], x[3], x[2], x[1], x[0]);
	nor nor18(x1[1], x[7], x[6], x[5], x[4]);
	nor nor19(x1[2], x[11], x[10], x[9], x[8]);
	nor no20 (x1[3], x[15], x[14], x[13], x[12]);
	
	nor nor21 (checkZero, x1[3:0]);
endmodule

module zero_flag_testbench();
	logic [63:0] result;
	logic checkZero;
	
	zero_flag dut (.result, .checkZero);
	
	initial begin
		result = 64'b0;
		#100;
		result = 64'b1;
		#100;
		result = 64'b10;
		#100;
		result = 64'b11;
		#100;
	end

endmodule
