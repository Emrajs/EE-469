/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		A 64 bit single cycle CPU for ARM architecture.
*
*	Inputs:
*		clk: The clock input for the system.
*
*	Outputs:
*		~None~
*
*******************************************************************************/
`timescale 10ps/1fs

module CPU_64bit (clk, reset);
	input logic clk, reset;
	logic [63:0] DaRF, DaEX, DbRF, DbEX, DbMem, WriteDataWB, WriteDataMem, aluBRF, aluBEX, aluResultEX, aluResultMem, dataMemOut, 
	             fullImm16, addIMuxOut, immSelector, newPC, oldPC, normalIncPC, branchIncPCIF, branchIncPCRF, branchIncPCEX, bToAdder, 
					 postShiftB, altBInput, movzMux, toRegFinal;
	logic [31:0] instructionIF, instructionRF;
	logic [25:0] brAddr26;
	logic [18:0] condAddr19;
	logic [15:0] imm16;
	logic [11:0] imm12;
	logic [10:0] opcode;
	logic [8:0] dAddr9;
	logic [4:0] RdRF, RdEX, RdMem, RdWB, RdWBMem, RdWBEX Rm, Rn, Rmux;
	logic [1:0] shamt;
	
   //Control signals
   logic negative, zero, overflow, carry_out, nTrue, zTrue, oTrue, cTrue, ctlLDURB;
	logic [2:0] ALUOp;
	logic RegWrite;
	logic movz, movk;
	logic MemWrite;
	logic Reg2Loc;
	logic Imm_12;
	logic ALUSrc;
	logic MemToReg;
	logic UncondBr;
	logic BrTaken;
	logic read_enable;
	logic flagSet;
	logic [3:0] xfer_size;	// xfer_size should either send 1000 (for 8 bytes) or 0001 (for 1 byte) to datamem.
	
   //Assign statements for readability
	assign RdRF = 	 	  instructionRF[4:0];
	assign Rn = 	 	  instructionRF[9:5];
	assign Rm = 	 	  instructionRF[20:16];
	assign opcode = 	  instructionRF[31:21];
	assign shamt =  	  instructionRF[22:21];
	assign imm12 =  	  instructionRF[21:10];
	assign dAddr9 = 	  instructionRF[20:12];
	assign imm16 =      instructionRF[20:5];
	assign brAddr26 =   instructionRF[25:0];
	assign condAddr19 = instructionRF[23:5];

//Control Logic Call
	
   controlLogic theBrain (.OpCode(opcode), .zero(zTrue), .notFlagZero(zero), .negative(nTrue), .carryout(cTrue), .overflow(oTrue), .RegWrite, .Reg2Loc, 
   	                    .ALUSrc, .ALUOp, .MemWrite, .MemToReg, .UncondBr, .BrTaken,  
   						     .Imm_12, .xfer_size, .read_en(read_enable), .movz(movz), .flagSet, .movk(movk), .ctlLDURB); 

//D_FF_enable the flags so they don't change until certain operations.

	D_FF_enable forZero (.q(zTrue), .d(zero), .en(flagSet), .clk);
	D_FF_enable forNegative (.q(nTrue), .d(negative), .en(flagSet), .clk);
	D_FF_enable forCarryout (.q(cTrue), .d(carry_out), .en(flagSet), .clk);
	D_FF_enable forOverflow (.q(oTrue), .d(overflow), .en(flagSet), .clk);
	
//Program counter logic 
	
	//Conditional/unconditional branching PC increment logic
	
	// Selects between brAddr26 or condAddr19. Select signal is UncondBr.
	mux128_64 brSelect (.inOne({{38{brAddr26[25]}}, brAddr26}), .inZero({{45{condAddr19[18]}}, condAddr19}), .sel(UncondBr), .out(postShiftB));
	
	// Shifts value (either brAddr26 or condAddr19) from brSelect by 2 bits (<<2).
	shifter brShifter (.value(postShiftB), .direction(1'b0), .distance(6'b000010), .result(bToAdder));
	
	
	//Normal PC increment logic
	
	pcUnit theProgramCounter (.in(newPC), .clk(clk), .reset(reset), .out(oldPC));
	
	// PC = PC + 4
	fullAdder_64bit normalCounter (.A(oldPC), .B({{60{1'b0}}, 4'b0100}), .result(normalIncPC));
	
	// PC = PC + SignExtend((BrAddr26)/(CondAddr19))<<2.
	fullAdder_64bit branchCounter (.A(bToAdder), .B(oldPC), .result(branchIncPCIF));
	
	// Mux that decides between PC+4 or PC = PC + SignExtend((BrAddr26)/(CondAddr19))<<2.
	mux128_64 pcSelect (.inOne(branchIncPC2), .inZero(normalIncPC), .sel(BrTaken), .out(newPC));
	
	
   //Instruction Memory
	
	instructmem theInstructions (.address(oldPC), .instruction(instructionIF), .clk(clk));

	
	
	//IF - RF Pipe
	
	Pipe_D_FF ifrfo (.q(instructionRF), .d(instructionIF), .clk)
	Pipe_D_FF ifrf1 (.q(branchIncPCRF), .d(branchIncPCIF), .clk) //PC counter pipe
	
	
	
//Data path logic
	
	//Regfile Hookups
	
	// Registers Rm and Rd are put through mux. Reg2Loc is the selection signal and selects which register
	// to send through
	mux10_5 regMux (.inOne(Rm), .inZero(RdRF), .sel(Reg2Loc), .out(Rmux));
	
	// Regfile will have two 64 bit outputs. Registers Rn, Rd, and the output of mux10_5 (choosing between
	// Rd and Rm) are being input. RegWrite is the signal used to decide if a value is being written to Register
	// Rd. WriteData is the value being written back to register Rd.
	regfile registerFile (.ReadData1(DaRF), .ReadData2(DbRF), .WriteData(WriteDataWB), .ReadRegister1(Rn), 
	                      .ReadRegister2(Rmux), .WriteRegister(RdWB), .RegWrite, .clk(clk));
   
	
   //Immediate and Address MUXing 	
	
	shifter movzShifter1 (.value({{48{1'b0}}, imm16}), .direction(1'b0), .distance({shamt, {4{1'b0}}}), .result(fullImm16));
	
	// This mux decides whether to send Imm12 (for the ADDI instruction) or Daddr9 to the ALUSrc mux.
	mux128_64 immOrAddrMux (.inOne({{52{1'b0}}, imm12}), .inZero({{55{dAddr9[8]}}, dAddr9}), .sel(Imm_12), .out(addIMuxOut));
	
	mux128_64 movInstMux (.inOne(fullImm16), .inZero(addIMuxOut), .sel(movz), .out(immSelector));
	
	
	//MOVK Hookup
	
	mux256_64 movKMux (.inThree({imm16, DbRF[47:0]}), .inTwo({DbRF[63:48], imm16, DbRF[31:0]}), .inOne({DbRF[63:32], imm16, DbRF[15:0]}), 
	                   .inZero({DbRF[63:16], imm16}), .sel(shamt), .out(movzMux));
	
	mux128_64 finalImmMux (.inOne(movzMux), .inZero(immSelector), .sel(movk), .out(altBInput));
	
	
	//ALU Hookups
		
	//Sends either ReadData2 (register Db) or the choice between Imm_12 and Daddr9
	mux128_64 alusrcMUX (.inOne(altBInput), .inZero(DbRF), .sel(ALUSrc), .out(aluBRF));
	
	
	
	//RF - EX Pipes
	
	Pipe_D_FF rfex0 (.q(DaEX), .d(DaRF), .clk)
	Pipe_D_FF rfex1 (.q(DbEX), .d(DbRF), .clk)
	Pipe_D_FF rfex2 (.q(aluBEX), .d(aluBRF), .clk)
	Pipe_D_FF rfex3 (.q(RdWB), .d(RdWBEX), .clk) // Rd to writeback 
	Pipe_D_FF rfex4 (.q(RdEX), .d(RdRF), .clk)
	Pipe_D_FF rfex5 (.q(branchIncPCEX), .d(branchIncPCRF), .clk) //PC counter pipe
	
	
	
	// The final 64 bit ALU hookup
	alu mainALU (.A(DaEX), .B(aluBEX), .cntrl(ALUOp), .result(aluResultEX), .negative, .zero, .overflow, .carry_out);
	
	
	
	//EX - MEM Pipes
	
	Pipe_D_FF exmem0 (.q(DbMem), .d(DbEX), .clk)
	Pipe_D_FF exmem1 (.q(aluResultMem), .d(aluResultEX), .clk)
	Pipe_D_FF exmem2 (.q(RdWBEX), .d(RdWBMem), .clk) // Rd to writeback
	Pipe_D_FF exmem3 (.q(RdMem), .d(RdEX), .clk)
	
	
	
	//DataMem hookups
   
	datamem dataMemory (.address(aluResultMem), .write_enable(MemWrite), .read_enable, .write_data(DbMem), .clk(clk), .xfer_size, .read_data(dataMemOut));
	
	mux128_64 isLDURB (.inOne({{56{1'b0}}, dataMemOut[7:0]}), .inZero(dataMemOut), .sel(ctlLDURB), .out(toRegFinal));
	
	// The mux which chooses between the alu result and Dout (from data memory) to write backt to the register
	// file.
	mux128_64 datamemMUX (.inOne(toRegFinal), .inZero(aluResultMem), .sel(MemToReg), .out(WriteDataMem));	
	
	
	
	//MEM - WB Pipes
	
	Pipe_D_FF memwb0 (.q(WriteDataWB), .d(WriteDataMem), .clk)
	Pipe_D_FF memwb1 (.q(RdWBMem), .d(RdMem), .clk)
	
	
	

endmodule