/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		This file acts as a full ALU 
*
*	Inputs:
*		A:
*     B:
*     cntrl:
*
*	Outputs:
*		result:
*     negative:
*		zero:
*		overflow:
*		carry_out:
*
*******************************************************************************/

`timescale 10ps/1fs

module alu (A, B, cntrl, result, negative, zero, overflow, carry_out)
	input  logic [63:0] A, B;
	input  logic [2:0]  cntrl;
	output logic [63:0] result;
	output logic		  negative, zero, overflow, carry_out ;