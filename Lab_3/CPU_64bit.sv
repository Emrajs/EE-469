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
	input logic clk;
	input logic reset;
	logic [63:0] Da, Db, WriteData, aluB, aluResult, dataMemOut, 
	             fullImm16, addIMuxOut, immSelector, newPC, oldPC, 
					 normalIncPC, branchIncPC, bToAdder, postShiftB;
	logic [31:0] instruction;
	logic [25:0] brAddr26;
	logic [18:0] condAddr19;
	logic [15:0] imm16;
	logic [11:0] imm12;
	logic [10:0] opcode;
	logic [8:0] dAddr9;
	logic [4:0] Rd, Rm, Rn, Rmux;
	logic [1:0] shamt;
	
   //Assign statements for readability
	assign Rd = 	 	  instruction[4:0];
	assign Rn = 	 	  instruction[9:5];
	assign Rm = 	 	  instruction[20:16];
	assign opcode = 	  instruction[31:21];
	assign shamt =  	  instruction[22:21];
	assign imm12 =  	  instruction[21:10];
	assign dAddr9 = 	  instruction[20:12];
	assign imm16 =      instruction[20:5];
	assign brAddr26 =   instruction[25:0];
	assign condAddr19 = instruction[23:5];

   //Added on 11/09/2017 by Emraj. Mostly just control signals.
	assign forDirection = 1'b0;
	assign forDistance = 6'b000010;
   logic negative, zero, overflow, carry_out;
	logic [3:0] ALUOp;
	logic RegWrite;
	logic sel;
	logic MemWrite;
	logic Reg2Loc;
	logic Imm_12;
	logic ALUSrc;
	logic MemToReg;
	logic UncondBr;
	logic BrTaken;
	logic read_enable;
	logic [3:0] xfer_size;      // xfer_size should either send 1000 (for 8 bytes) or 0001 (for 1 byte) to datamem.
	
    //Control logic call
   //controlLogic theBrain (.OpCode(), .zero(), .negative(), .carryout(), .overflow(), .RegWrite(), .Reg2Loc(), 
   //	                     .ALUSrc(), .ALUOp(),.MemWrite(), .MemToReg(), .UncondBr(), .BrTaken(),   
   //						    	.Imm_12(), .ldur_B(), .read_en()); 

	
   
	//Program counter logic (Unconnected ports currently *UNCONNECTED* (Mostly Control logic))
	//Conditional/unconditional branching PC increment logic
	
	// Selects between brAddr26 or condAddr19. Select signal is UncondBr.
	mux128_64 brSelect (.inOne({{38{1'b0}}, brAddr26}), .inZero({{45{1'b0}}, condAddr19}), .sel(UncondBr), .out(postShiftB));
	
	// Shifts value (either brAddr26 or condAddr19) from brSelect by 2 bits (<<2).
	shifter movzShifter (.value(postShiftB), .direction(forDirection), .distance(forDistance), .result(bToAdder));
	
	//Normal PC increment logic
	pcUnit theProgramCounter (.in(newPC), .clk(clk), .reset(reset), .out(oldPC));
	
	// PC = PC + 4
	fullAdder_64bit normalCounter (.A(oldPC), .B({{60{1'b0}}, 1'h4}), .result(normalIncPC));
	
	// PC = PC + SignExtend((BrAddr26)/(CondAddr19))<<2.
	fullAdder_64bit branchCounter (.A(bToAdder), .B(oldPC), .result(branchIncPC));
	
	// Mux that decides between PC+4 or PC = PC + SignExtend((BrAddr26)/(CondAddr19))<<2.
	mux128_64 pcSelect (.inOne(branchIncPC), .inZero(normalIncPC), .sel(BrTaken), .out(newPC));
	
	
	//Instruction Memory
	
	//instructmem theInstructions (.address(oldPC), .instruction(instruction), .clk(clk));

	
   //Data path logic (Unconnected ports currently *UNCONNECTED* (Mostly Control logic))
	
	
	// Registers Rm and Rd are put through mux. Reg2Loc is the selection signal and selects which register
	// to send through
	mux10_5 regMux (.inOne(Rm), .inZero(Rd), .sel(Reg2Loc), .out(Rmux));
	
	// Regfile will have two 64 bit outputs. Registers Rn, Rd, and the output of mux10_5 (choosing between
	// Rd and Rm) are being input. RegWrite is the signal used to decide if a value is being written to Register
	// Rd. WriteData is the value being written back to register Rd.
	regfile registerFile (.ReadData1(Da), .ReadData2(Db), .WriteData(WriteData), .ReadRegister1(Rn), 
	                      .ReadRegister2(Rmux), .WriteRegister(Rd), .RegWrite, .clk(clk));
   
	
   //Immediate and Address MUXing 	
	shifter movzShifter1 (.value({{48{1'b0}}, imm16}), .direction(forDirection), .distance({shamt, {4{1'b0}}}), .result(fullImm16));
	
	// This mux decides whether to send Imm12 (for the ADDI instruction) or Daddr9 to the ALUSrc mux.
	mux128_64 immOrAddrMux (.inOne({{52{1'b0}}, imm12}), .inZero({{55{dAddr9[8]}}, dAddr9}), .sel(Imm_12), .out(addIMuxOut));
	
	mux128_64 movInstMux (.inOne(fullImm16), .inZero(addIMuxOut), .sel, .out(immSelector));
	
		
	//Sends either ReadData2 (register Db) or the choice between Imm_12 and Daddr9
	mux128_64 alusrcMUX (.inOne(immSelector), .inZero(Db), .sel(ALUSrc), .out(aluB));
	
	// The final 64 bit ALU hookup
	alu mainALU (.A(Da), .B(aluB), .cntrl(ALUOp), .result(aluResult), .negative, .zero, .overflow, .carry_out);
	
	
	//DataMem hookups
   
	//datamem dataMemory (.address(aluResult), .write_enable(MemWrite), .read_enable, .write_data(Db), .clk(clk), .xfer_size, .read_data(dataMemOut));
	
	// The mux which chooses between the alu result and Dout (from data memory) to write backt to the register
	// file.
	mux128_64 datamemMUX (.inOne(dataMemOut), .inZero(aluResult), .sel(MemToReg), .out(WriteData));	
endmodule