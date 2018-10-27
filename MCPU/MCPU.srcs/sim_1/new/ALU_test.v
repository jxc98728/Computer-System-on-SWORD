`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:49:44 05/21/2018
// Design Name:   ALU
// Module Name:   E:/Verilog Project/Organization/OExp3/ALU_test.v
// Project Name:  NewSWORD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [2:0] ALU_operation;

	// Outputs
	wire zero;
	wire overflow;
	wire [31:0] res;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.ALU_operation(ALU_operation), 
		.zero(zero), 
		.overflow(overflow), 
		.res(res)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		ALU_operation = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 32'hF0000000;
		B = 32'hF0000000;
		ALU_operation = 4'h2;
	end
      
endmodule

