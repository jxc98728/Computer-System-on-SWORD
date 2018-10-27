`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2018 02:50:03 AM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU(	input clk,
			input reset,
			input div_start,
			input [31:0] A,
			input [31:0] B,
			input [3:0] ALU_operation,
			output zero,
			output overflow,
			output div_finish,
			output reg [31:0] HI,
			output reg [31:0] LO,
			output reg [31:0] res
);

wire [31:0] AND, OR, ADD, SUB, XOR, SLL, SRL, SLT, NOR, NOP, DIVU_Q, DIVU_R, DIV_Q, DIV_R;
wire [63:0] MULT, MULTU;


	
	assign AND = A & B;
	assign OR  = A | B;
	assign ADD = A + B;
	assign SUB = A - B;
	assign XOR = A ^ B;
	assign SLL = A << B;
	assign SRL = A >> B;
	assign SLT = SUB[31];
	assign NOR = ~OR;
	assign NOP = A;

	assign zero = (res == 0) ? 1'b1 : 1'b0;

	always @ (*) begin
		case(ALU_operation)
			4'b0000: res <= AND;
			4'b0001: res <= OR;
			4'b0010: res <= ADD;
			4'b0011: res <= SUB;
			4'b0100: res <= XOR;
			4'b0101: res <= SLL;
			4'b0110: res <= SRL;
			4'b0111: res <= SLT;
			4'b1000: res <= NOR;
			4'b1001: begin
			     res <= NOP;
			     HI <= DIVU_R;
                 LO <= DIVU_Q;
            end
			4'b1010: begin
				res <= NOP;
				HI <= MULT[63:32];
				LO <= MULT[31:0];
			end
			4'b1011: begin
				res <= NOP;
				HI <= MULTU[63:32];
				LO <= MULTU[31:0];
			end
			4'b1101: begin
				res <= NOP;
				HI <= DIVU_R;
				LO <= DIVU_Q;
			end
			default: res <= NOP;
		endcase
	end

	Signed_Multiplier	M0(.A(A), .B(B), .P(MULT));
	Unsigned_Multiplier	M1(.A(A), .B(B), .P(MULTU));
	
	
	
	Unsigned_Divider	D1(.clk(clk), 
						   .reset(reset), 
						   .start(div_start), 
						   .Dividend(A), 
						   .Divisor(B), 
						   .finish(div_finish), 
						   .error(), 
						   .Quotient(DIVU_Q), 
						   .Remainder(DIVU_R)
						   );

endmodule
