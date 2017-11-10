/*******************************************************************************
*	Authors:
*		Emraj Sidhu and Nesta Isakovic	
*
*	Description:
*		A 64 bit single cycle CPU for ARM architecture testbench.
*
*	Inputs:
*		~None~
*
*	Outputs:
*		~None~
*
*******************************************************************************/
`timescale 1ns/10ps

module cpustim(); 		

	parameter ClockDelay = 50000000;

	logic reset, clk;


	integer i;

	// Your register file MUST be named "regfile".
	// Also you must make sure that the port declarations
	// match up with the module instance in this stimulus file.
	CPU_64bit dut (.clk, .reset);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		reset = 1; @(posedge clk);
	   reset = 0; @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		           @(posedge clk);
		$stop;
	end

endmodule