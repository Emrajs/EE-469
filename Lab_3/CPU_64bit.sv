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
	logic RegWrite;
	
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

//Control logic call
	
   //controlLogic theBrain (.OpCode(), .zero(), .negative(), .carryout(), .overflow(), .RegWrite(), .Reg2Loc(), 
   //	                     .ALUSrc(), .ALUOp(),.MemWrite(), .MemToReg(), .UncondBr(), .BrTaken(),   
   //						    	.Imm_12(), .ldur_B(), .read_en()); 

	
//Program counter logic (Unconnected ports currently *UNCONNECTED* (Mostly Control logic))
	
	//Conditional/unconditional branching PC increment logic
	
	mux128_64 brSelect (.inOne({38{1'b0}, brAddr26}), .inZero({45{1'b0}, condAddr19}), .sel(*UNCONNECTED*), .out(postShiftB));
	
	shifter movzShifter (.value(postShiftB), .direction(1b'0), .distance(6'b000010), .result(bToAdder));
	
	//Normal PC increment logic
	
	pcUnit theProgramCounter (.in(newPC), .clk(clk), .reset(reset), .out(oldPC));
	
	fullAdder_64bit normalCounter (.A(oldPC), .B({60{1'b0}, 1'h4}), .result(normalIncPC));
	
	fullAdder_64bit branchCounter (.A(bToAdder), .B(oldPC), .result(branchIncPC));
	
	mux128_64 pcSelect (.inOne(branchIncPC), .inZero(normalIncPC), .sel(*UNCONNECTED*), .out(newPC));
	
	//Instruction Memory
	
	instructmem theInstructions (.address(oldPC), .instruction(instruction), .clk(clk));

	
//Data path logic (Unconnected ports currently *UNCONNECTED* (Mostly Control logic))
	
	//Regfile hookups
	
	mux5_10 regMux (.inOne(Rm), .inZero(Rd), .sel(*UNCONNECTED*), .out(Rmux));
	
	regfile registerFile (.ReadData1(Da), .ReadData2(Db), .WriteData(WriteData), .ReadRegister1(Rn), 
	                      .ReadRegister2(Rmux), .WriteRegister(Rd), .RegWrite(*UNCONNECTED*), .clk(clk));
   
	
   //Immediate and Address MUXing 	

	shifter movzShifter (.value({48{1'b0}, imm16}), .direction(1b'0), .distance({shamt, 4{1b'0}}), .result(fullImm16));
	
	mux128_64 immOrAddrMux (.inOne({52{1'b0}, imm12}), .inZero({55{dAddr9[8]}, dAddr9}), .sel(*UNCONNECTED*), .out(addIMuxOut));
	
	mux128_64 movInstMux (.inOne(fullImm16), .inZero(addIMuxOut), .sel(*UNCONNECTED*), .out(immSelector));
	
	
	//ALU hookups
	
	mux128_64 alusrcMUX (.inOne(immSelector), .inZero(Db), .sel(*UNCONNECTED*), .out(aluB))
	
	alu mainALU (.A(Da), .B(aluB), .cntrl(*UNCONNECTED*), .result(aluResult), 
	             .negative(*UNCONNECTED*), .zero(*UNCONNECTED*), .overflow(*UNCONNECTED*), .carry_out(*UNCONNECTED*));
	
	
	//DataMem hookups
	
	datamem dataMemory (.address(aluResult), .write_enable(*UNCONNECTED*), .write_data(Db), .clk(clk), .xfer_size(*UNCONNECTED*), .read_data(dataMemOut));
	
	mux128_64 datamemMUX (.inOne(dataMemOut), .inZero(aluResult), .sel(*UNCONNECTED*), .out(WriteData));
	
endmodule