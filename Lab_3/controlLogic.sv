/*
File Name: controlLogic.sv

Authors: Emraj Sidhu and Nesta Isakovic

Description: This file will contain the control logic for the cpu. 
It will depend on the given Opcode (an input) and carry out the instruction
from there.  

NOTE: This is not fully implemented or correct (possbbly). MOVK and MOVZ still need to be added.
So far, instructions B, CBZ, LDUR, STUR, and ADDI look good. ADDS and SUBS require flags, which
I am not too sure about. STURB and LDURB require bytes. B_LT I'm also not sure of. 
*/


module controlLogic (OpCode, zero, negative, carryout, overflow, RegWrite, Reg2Loc, ALUSrc, ALUOp, MemWrite,
                     MemToReg, UncondBr, BrTaken, Imm_12, xfer_size, read_en, movz, flagSet, movk);
	input logic [10:0] OpCode;
	input logic zero, negative, carryout, overflow;
	output logic RegWrite, Reg2Loc, ALUSrc, MemWrite, MemToReg, UncondBr, BrTaken, Imm_12, read_en, movk, movz, flagSet;
	output logic [2:0] ALUOp;
	output logic [3:0] xfer_size;
	
	parameter [10:0] ADDI = 11'b1001000100x, ADDS = 11'b10101011000, B = 11'b000101xxxxx,
						  CBZ = 11'b10110100xxx, LDUR = 11'b11111000010, STUR = 11'b11111000000,
						  SUBS = 11'b11101011000, B_LT = 11'b01010100xxx, LDURB = 11'b00111000010, 
						  STURB = 11'b00111000000, MOVK = 11'b111100101xx, MOVZ = 11'b110100101xx;
						  
	
	always_comb 
		begin
			casex(OpCode)
				// In case of ADDI, an Imm_12 signal was added. In the datapath, the DAddr9 SE and Imm_12
				// are put through a mux to decide which signal is needed. For this case, it will be Imm_12.
				ADDI: 			  begin   
										RegWrite  = 1'b1;
										Reg2Loc   = 1'bx;
										ALUSrc    = 1'b1;
										ALUOp     = 3'b010;
										MemWrite  = 1'b0;
										MemToReg  = 1'b0;
										BrTaken   = 1'b0;
										UncondBr  = 1'bx;
										Imm_12    = 1'b1;    // ADDI requires adding Imm_12 to Reg[Rn]. So this will be set to 1 in this instruction
										xfer_size = 4'bxxxx;
										read_en   = 1'b0;
										movz      = 1'b0;
										flagSet   = 1'b0;
										movk      = 1'b0;
									  end
				ADDS:            begin   // Need to add flags
										RegWrite  = 1'b1;
										Reg2Loc   = 1'b1;
										ALUSrc    = 1'b0;
										ALUOp     = 3'b010;
										MemWrite  = 1'b0;
										MemToReg  = 1'b0;
										BrTaken   = 1'b0;
										UncondBr  = 1'bx;
										Imm_12    = 1'bx;  
										xfer_size = 4'bxxxx;
										read_en   = 1'b0;
										movz      = 1'b0;
										flagSet   = 1'b1;
										movk      = 1'b0;
									  end
				B: 				  begin   
									   RegWrite  = 1'b0;
										Reg2Loc   = 1'bx;
										ALUSrc    = 1'bx;
										ALUOp     = 3'bxxx;
										MemWrite  = 1'b0;
										MemToReg  = 1'bx;
										BrTaken   = 1'b1;
										UncondBr  = 1'b1;
										Imm_12    = 1'bx;
										xfer_size = 4'bxxxx;
										read_en   = 1'b0;
										movz      = 1'b0;
										flagSet   = 1'b0;
										movk      = 1'b0;
									  end
				B_LT:            begin
									   RegWrite  = 1'b0;
										Reg2Loc   = 1'bx;
										ALUSrc    = 1'bx;
										ALUOp     = 3'bxxx;
										MemWrite  = 1'b0;
										MemToReg  = 1'bx;
										BrTaken   = negative ^ overflow; //XOR the zero and overflow flag. If both are not equal to one another, then make BrTaken = 1 so BrAddr19<<2 goes through.
										UncondBr  = 1'b0;
										Imm_12    = 1'bx;
										xfer_size = 4'bxxxx;
										read_en   = 1'b0;
										movz      = 1'b0;
										flagSet   = 1'b0;
										movk      = 1'b0;
									  end
				CBZ: 				  begin  
										RegWrite  = 1'b0;
										Reg2Loc   = 1'b0;
										ALUSrc    = 1'b0;
										ALUOp     = 3'b000;
										MemWrite  = 1'b0;
										MemToReg  = 1'bx;
										BrTaken   = zero; // Checks zero flag to see if it is true (one) or not.
										UncondBr  = 1'b0;
										Imm_12    = 1'bx;
										xfer_size = 4'bxxxx;
										read_en   = 1'b0;
										movz      = 1'b0;
										flagSet   = 1'b0;
										movk      = 1'b0;
									  end
				LDUR:            begin  
										RegWrite  = 1'b1;
										Reg2Loc   = 1'bx;
										ALUSrc    = 1'b1;
										ALUOp     = 3'b010;
										MemWrite  = 1'b0;
										MemToReg  = 1'b1;
										BrTaken   = 1'b0;
										UncondBr  = 1'bx;
										Imm_12    = 1'b0;
										xfer_size = 4'b1000;
										read_en   = 1'b1;
										movz      = 1'b0;
										flagSet   = 1'b0;
										movk      = 1'b0;
									  end
			   LDURB:           begin             // Not sure as to how to do the byte part
										RegWrite  = 1'b1;
										Reg2Loc   = 1'bx;
										ALUSrc    = 1'b1;
										ALUOp     = 3'b010;
										MemWrite  = 1'b0;
										MemToReg  = 1'b1;
										BrTaken   = 1'b0;
										UncondBr  = 1'bx;
										Imm_12    = 1'b0;
										xfer_size = 4'b0001;
										read_en   = 1'b1;
										movz      = 1'b0;
										flagSet   = 1'b0;
										movk      = 1'b0;										
									  end
				STUR:            begin 
										RegWrite  = 1'b0;
										Reg2Loc   = 1'b0;
										ALUSrc    = 1'b1;
										ALUOp     = 3'b010;
										MemWrite  = 1'b1;
										MemToReg  = 1'bx;
										BrTaken   = 1'b0;
										UncondBr  = 1'bx;
										Imm_12    = 1'b0;
										xfer_size = 4'b1000;
										read_en   = 1'b0;
										movz      = 1'b0;
										flagSet   = 1'b0;
										movk      = 1'b0;										
									  end
				STURB:           begin       // How to include bytes?
										RegWrite  = 1'b0;
										Reg2Loc   = 1'b0;
										ALUSrc    = 1'b1;
										ALUOp     = 3'b010;
										MemWrite  = 1'b1;
										MemToReg  = 1'bx;
										BrTaken   = 1'b0;
										UncondBr  = 1'bx;
										Imm_12    = 1'b0;
										xfer_size = 4'b0001;
										read_en   = 1'b0;
										movz      = 1'b0;
										flagSet   = 1'b0;
										movk      = 1'b0;										
									  end
				SUBS:            begin // Need to add flags
										RegWrite  = 1'b1;
										Reg2Loc   = 1'b1;
										ALUSrc    = 1'b0;
										ALUOp     = 3'b011;
										MemWrite  = 1'b0;
										MemToReg  = 1'b0;
										BrTaken   = 1'b0;
										UncondBr  = 1'bx;
										Imm_12    = 1'bx;
										xfer_size = 4'bxxxx;
										read_en   = 1'b0;
										movz      = 1'b0;
										flagSet   = 1'b1;
										movk      = 1'b0;										
									  end 
				MOVK:            begin
										RegWrite  = 1'b1;
										Reg2Loc   = 1'b0;
										ALUSrc    = 1'b1;
										ALUOp     = 3'b000;
										MemWrite  = 1'b0;
										MemToReg  = 1'b0;
										BrTaken   = 1'b0;
										UncondBr  = 1'bx;
										Imm_12    = 1'bx;
										xfer_size = 4'bxxxx;
										read_en   = 1'b0;
										movz      = 1'b0;
										flagSet   = 1'b0;
										movk      = 1'b1;										
									  end
				MOVZ:            begin
										RegWrite  = 1'b1;
										Reg2Loc   = 1'b0;
										ALUSrc    = 1'b1;
										ALUOp     = 3'b000;
										MemWrite  = 1'b0;
										MemToReg  = 1'b0;
										BrTaken   = 1'b0;
										UncondBr  = 1'bx;
										Imm_12    = 1'bx;
										xfer_size = 4'bxxxx;
										read_en   = 1'b0;
										movz      = 1'b1;
										flagSet   = 1'b0;
										movk      = 1'b0;										
									  end
				default          begin
									   RegWrite  = 1'b0;
										Reg2Loc   = 1'bx;
										ALUSrc    = 1'bx;
										ALUOp     = 3'bxxx;
										MemWrite  = 1'b0;
										MemToReg  = 1'bx;
										BrTaken   = 1'bx;
										UncondBr  = 1'bx;
										Imm_12    = 1'bx;
										xfer_size = 4'bxxxx;
										read_en   = 1'b0;
										movz      = 1'b0;
										flagSet   = 1'b0;
										movk      = 1'b0;
										end
			endcase																				
		end	
endmodule 

module controlLogic_testbench();
	logic [31:21] OpCode;
	logic zero, negative, carryout, overflow;
   logic RegWrite, Reg2Loc, ALUSrc, MemWrite, MemToReg, UncondBr, BrTaken, Imm_12, read_en, movz, flagSet, movk;
	logic [2:0] ALUOp;
	logic [3:0] xfer_size;
	
	controlLogic dut (.OpCode, .zero, .negative, .carryout, .overflow, .RegWrite, .Reg2Loc, 
	                  .ALUSrc, .ALUOp,.MemWrite, .MemToReg, .UncondBr, .BrTaken, 
							.Imm_12, .xfer_size, .read_en, .movz, .flagSet, .movk);
	
	initial begin
		OpCode = 11'b00000000000; #100;             // should go to default
		OpCode = 11'b00000000001; #100;             // should go to default
		OpCode = 11'b10110100xxx; zero = 0; #100;   // Testing CBZ. BrTaken should change with zero flag value.
		                          zero = 1; #100;
	   OpCode = 11'b1001000100x; #100;             // Testing ADDI
		OpCode = 11'b10101011000; #100;             // Testing ADDS
		OpCode = 11'b000101xxxxx; #100;             // Testing B
		OpCode = 11'b11111000010; #100;             // Testing LDUR
		OpCode = 11'b11111000000; #100;             // Testing STUR
		OpCode = 11'b11101011000; #100;             // Testing SUBS
		OpCode = 11'b111000010xx; #100;             // Testing LDURB
		OpCode = 11'b111000000xx; #100;             // Testing STURB
	end
endmodule