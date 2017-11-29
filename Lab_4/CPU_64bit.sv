/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		A 64 bit Pipelined CPU for ARM architecture.
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
	logic [4:0] RdRF, RdEX, RdMem, RdWB, Rm, Rn, Rmux;
	logic [1:0] shamt;
	
   //Control signals
   logic negative, zero, overflow, carry_out, nTrue, zTrue, oTrue, cTrue, ctlLDURBRF, ctlLDURBEX, ctlLDURBMem;
	logic [2:0] ALUOpRF, ALUOpEX;
	logic RegWriteRF, RegWriteEX, RegWriteMem, RegWriteWB;
	logic movz, movk;
	logic MemWriteRF, MemWriteEX, MemWriteMem;
	logic Reg2Loc;
	logic Imm_12;
	logic ALUSrc;
	logic MemToRegRF, MemToRegEX, MemToRegMem;
	logic UncondBr;
	logic BrTaken;
	logic read_enableRF, read_enableEX, read_enableMem;
	logic flagSetRF, flagSetEx;
	logic [3:0] xfer_sizeRF, xfer_sizeEX, xfer_sizeMem;	// xfer_size should either send 1000 (for 8 bytes) or 0001 (for 1 byte) to datamem.
	
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
	
   controlLogic theBrain (.OpCode(opcode), .zero(zTrue), .notFlagZero(zero), .negative(nTrue), .carryout(cTrue), .overflow(oTrue), .RegWrite(RegWriteRF), .Reg2Loc, 
   	                    .ALUSrc, .ALUOp(ALUOpRF), .MemWrite(MemWriteRF), .MemToReg(MemToRegRF), .UncondBr, .BrTaken,  
   						     .Imm_12, .xfer_size(xfer_sizeRF), .read_en(read_enableRF), .movz(movz), .flagSet(flagSetRF), .movk(movk), .ctlLDURB(ctlLDURBRF)); 

	
	
	//Control signal "buffers"/pipline stages
	
	D_FF ALUOpFlop0 (.q(ALUOpEX[0]), .d(ALUOpRF[0]), .reset, .clk);
	D_FF ALUOpFlop1 (.q(ALUOpEX[1]), .d(ALUOpRF[1]), .reset, .clk);
	D_FF ALUOpFlop2 (.q(ALUOpEX[2]), .d(ALUOpRF[2]), .reset, .clk);
	
	D_FF flagSetFlop0 (.q(flagSetEX), .d(flagSetRF), .reset, .clk);
	
	D_FF MemWriteFlop0 (.q(MemWriteEX), .d(MemWriteRF), .reset, .clk);
	D_FF MemWriteFlop1 (.q(MemWriteMem), .d(MemWriteEX), .reset, .clk);
	
	D_FF read_enableFlop0 (.q(read_enableEX), .d(read_enableRF), .reset, .clk);
	D_FF read_enableFlop1 (.q(read_enableMem), .d(read_enableEX), .reset, .clk);
	
	D_FF xfer_sizeFlop0 (.q(xfer_sizeEX[0]), .d(xfer_sizeRF[0]), .reset, .clk);
	D_FF xfer_sizeFlop1 (.q(xfer_sizeEX[1]), .d(xfer_sizeRF[1]), .reset, .clk);
	D_FF xfer_sizeFlop2 (.q(xfer_sizeEX[2]), .d(xfer_sizeRF[2]), .reset, .clk);
	D_FF xfer_sizeFlop3 (.q(xfer_sizeEX[3]), .d(xfer_sizeRF[3]), .reset, .clk);
	D_FF xfer_sizeFlop4 (.q(xfer_sizeMem[0]), .d(xfer_sizeEX[0]), .reset, .clk);
	D_FF xfer_sizeFlop5 (.q(xfer_sizeMem[1]), .d(xfer_sizeEX[1]), .reset, .clk);
	D_FF xfer_sizeFlop6 (.q(xfer_sizeMem[2]), .d(xfer_sizeEX[2]), .reset, .clk);
	D_FF xfer_sizeFlop7 (.q(xfer_sizeMem[3]), .d(xfer_sizeEX[3]), .reset, .clk);
	
	D_FF ctlLDURBFlop0 (.q(ctlLDURBEX), .d(ctlLDURBRF), .reset, .clk);
	D_FF ctlLDURBFlop1 (.q(ctlLDURBMem), .d(ctlLDURBEX), .reset, .clk);
	
	D_FF MemToRegFlop0 (.q(MemToRegEX), .d(MemToRegRF), .reset, .clk);
	D_FF MemToRegFlop1 (.q(MemToRegMem), .d(MemToRegEX), .reset, .clk);
	
	D_FF RegWriteFlop0 (.q(RegWriteEX), .d(RegWriteRF), .reset, .clk);
	D_FF RegWriteFlop1 (.q(RegWriteMem), .d(RegWriteEX), .reset, .clk);
	D_FF RegWriteFlop2 (.q(RegWriteWB), .d(RegWriteMem), .reset, .clk);
	
	
								  
//D_FF_enable the flags so they don't change until certain operations.

	D_FF_enable forZero (.q(zTrue), .d(zero), .en(flagSetEX), .clk);
	D_FF_enable forNegative (.q(nTrue), .d(negative), .en(flagSetEX), .clk);
	D_FF_enable forCarryout (.q(cTrue), .d(carry_out), .en(flagSetEX), .clk);
	D_FF_enable forOverflow (.q(oTrue), .d(overflow), .en(flagSetEX), .clk);
	
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
	
	//instructmem theInstructions (.address(oldPC), .instruction(instructionIF), .clk(clk));

	
	
	//IF - RF Pipe
	
	Pipe_D_FF ifrfo (.q(instructionRF), .d(instructionIF), .clk);
	Pipe_D_FF ifrf1 (.q(branchIncPCRF), .d(branchIncPCIF), .clk); //PC counter pipe
	
	
	
//Data path logic
	
	//Regfile Hookups
	
	// Registers Rm and Rd are put through mux. Reg2Loc is the selection signal and selects which register
	// to send through
	mux10_5 regMux (.inOne(Rm), .inZero(RdRF), .sel(Reg2Loc), .out(Rmux));
	
	// Regfile will have two 64 bit outputs. Registers Rn, Rd, and the output of mux10_5 (choosing between
	// Rd and Rm) are being input. RegWrite is the signal used to decide if a value is being written to Register
	// Rd. WriteData is the value being written back to register Rd.
	regfile registerFile (.ReadData1(DaRF), .ReadData2(DbRF), .WriteData(WriteDataWB), .ReadRegister1(Rn), 
	                      .ReadRegister2(Rmux), .WriteRegister(RdWB), .RegWrite(RegWriteWB), .clk(clk));
   
	
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
	
	Pipe_D_FF rfex0 (.q(DaEX), .d(DaRF), .clk);
	Pipe_D_FF rfex1 (.q(DbEX), .d(DbRF), .clk);
	Pipe_D_FF rfex2 (.q(aluBEX), .d(aluBRF), .clk);
	Pipe_D_FF rfex3 (.q(branchIncPCEX), .d(branchIncPCRF), .clk); //PC counter pipe
	
	Pipe_D_FF_5 rfex4 (.q(RdEX), .d(RdRF), .clk);
	
	
	
	// The final 64 bit ALU hookup
	alu mainALU (.A(DaEX), .B(aluBEX), .cntrl(ALUOpEX), .result(aluResultEX), .negative, .zero, .overflow, .carry_out);
	
	
	
	//EX - MEM Pipes
	
	Pipe_D_FF exmem0 (.q(DbMem), .d(DbEX), .clk);
	Pipe_D_FF exmem1 (.q(aluResultMem), .d(aluResultEX), .clk);
	
	Pipe_D_FF_5 exmem3 (.q(RdMem), .d(RdEX), .clk);
	
	
	
	//DataMem hookups
   
	//datamem dataMemory (.address(aluResultMem), .write_enable(MemWriteMem), .read_enable(read_enableMem), .write_data(DbMem), .clk(clk), .xfer_size(xfer_sizeMem), .read_data(dataMemOut));
	
	mux128_64 isLDURB (.inOne({{56{1'b0}}, dataMemOut[7:0]}), .inZero(dataMemOut), .sel(ctlLDURBMem), .out(toRegFinal));
	
	// The mux which chooses between the alu result and Dout (from data memory) to write backt to the register
	// file.
	mux128_64 datamemMUX (.inOne(toRegFinal), .inZero(aluResultMem), .sel(MemToRegMem), .out(WriteDataMem));	
	
	
	
	//MEM - WB Pipes
	
	Pipe_D_FF memwb0 (.q(WriteDataWB), .d(WriteDataMem), .clk);
	
	Pipe_D_FF_5 memwb1 (.q(RdWB), .d(RdMem), .clk);
	
	
	

endmodule