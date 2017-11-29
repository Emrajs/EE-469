module ForwardingUnit(ForwardA, ForwardB, ExMem_RegWrite, MemWB_RegWrite, ExMem_Rd, MemWB_Rd, Rn, Rm);
	input logic ExMem_RegWrite, MemWB_RegWrite;
	input logic [4:0] ExMem_Rd, MemWB_Rd, Rn, Rm;
	output logic [1:0] ForwardA, ForwardB;
	
	always_comb begin 
		// EX hazard. Check if destination register is equal to X31 and if Rd in instruction k
		// is equal to source register (Rn) in instruction k+1.
		if ((ExMem_RegWrite) & (ExMem_Rd != 5'b11111) & (ExMem_Rd == Rn)) 
			ForwardA = 2'b10;
		// Same as above. However check source register Rm.	
		else if ((ExMem_RegWrite) & (ExMem_Rd != 5'b11111) & (ExMem_Rd == Rm)) 
			ForwardB = 2'b10;
		// MEM hazard. 	
		else if ((MemWB_RegWrite) & (MemWB_Rd != 5'b11111) & (MemWB_Rd == Rn))
			ForwardA = 2'b01;
		else if ((MemWB_RegWrite) & (MemWB_Rd != 5'b11111) & (MemWB_Rd == Rm))
			ForwardB = 2'b01;
		else  begin
			ForwardA = 2'bxx;
			ForwardB = 2'bxx;	
		end
	end

endmodule 