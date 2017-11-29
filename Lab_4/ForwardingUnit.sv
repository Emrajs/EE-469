module ForwardingUnit(ForwardA, ForwardB, ExMem_RegWrite, MemWB_RegWrite, ExMem_Rd, MemWB_Rd, Rn, Rm);
	input logic ExMem_RegWrite, MemWB_RegWrite;
	input logic [4:0] ExMem_Rd, MemWB_Rd, Rn, Rm;
	output logic [1:0] ForwardA, ForwardB;
	
	always_comb begin 
		// EX hazard. Check if destination register is equal to X31 and if Rd in instruction k
		// is equal to source register (Rn) in instruction k+1.
		if ((ExMem_RegWrite) & (ExMem_Rd != 5'b11111) & (ExMem_Rd == Rn)) begin
			ForwardA = 2'b10;
			ForwardB = 2'b00;
		// Same as above. However check source register Rm.	
		end else if ((ExMem_RegWrite) & (ExMem_Rd != 5'b11111) & (ExMem_Rd == Rm)) begin
			ForwardA = 2'b00;
			ForwardB = 2'b10;
		// MEM hazard. 	
		end else if ((MemWB_RegWrite) & (MemWB_Rd != 5'b11111) & (MemWB_Rd == Rn)) begin
			ForwardA = 2'b01;
			ForwardB = 2'b00;
		end else if ((MemWB_RegWrite) & (MemWB_Rd != 5'b11111) & (MemWB_Rd == Rm)) begin
			ForwardA = 2'b00;
			ForwardB = 2'b01;
		end else begin
			ForwardA = 2'b00;
			ForwardB = 2'b00;	
		end
	end

endmodule 