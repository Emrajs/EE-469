module ForwardingUnit(ForwardA, ForwardB, ForwardData, ForwardFlag, flagSetEX, wasBranch, movk, movz, ExMem_RegWrite, MemWB_RegWrite, ExMem_Rd, MemWB_Rd, Rn, Rm);
	input logic ExMem_RegWrite, MemWB_RegWrite, flagSetEX, wasBranch, movk, movz;
	input logic [4:0] ExMem_Rd, MemWB_Rd, Rn, Rm;
	output logic [1:0] ForwardA, ForwardB, ForwardData;
	output logic ForwardFlag;
	
	always_comb begin 
		// EX hazard. Check if destination register is equal to X31 and if Rd in instruction k
		// is equal to source register (Rn) in instruction k+1.
		if ((ExMem_RegWrite) & (ExMem_Rd != 5'b11111) & (ExMem_Rd == Rn)) begin
			ForwardA = 2'b10;
		// Same as above. However check source register Rm.	
		end else if ((MemWB_RegWrite) & (MemWB_Rd != 5'b11111) & (MemWB_Rd == Rn)) begin
			ForwardA = 2'b01;
		end else begin
			ForwardA = 2'b00;	
		end
		
		// EX hazard. Check if destination register is equal to X31 and if Rd in instruction k
		// is equal to source register (Rn) in instruction k+1.
		if ((ExMem_RegWrite) & (ExMem_Rd != 5'b11111) & (ExMem_Rd == Rm) & (!movz) & (!movk)) begin
			ForwardB = 2'b10;
		// MEM hazard. 	
		end else if ((MemWB_RegWrite) & (MemWB_Rd != 5'b11111) & (MemWB_Rd == Rm) & (!movz) & (!movk)) begin
			ForwardB = 2'b01;
		end else begin
			ForwardB = 2'b00;	
		end
		
		if ((ExMem_RegWrite) & (ExMem_Rd != 5'b11111) & (ExMem_Rd == Rm)) begin
			ForwardData = 2'b10;
		// MEM hazard. 	
		end else if ((MemWB_RegWrite) & (MemWB_Rd != 5'b11111) & (MemWB_Rd == Rm)) begin
			ForwardData = 2'b01;
		end else begin
			ForwardData = 2'b00;	
		end

		//Flag forwarding
		if (flagSetEX & wasBranch)
			ForwardFlag = 1;
		else
			ForwardFlag = 0;
		
	end

endmodule 