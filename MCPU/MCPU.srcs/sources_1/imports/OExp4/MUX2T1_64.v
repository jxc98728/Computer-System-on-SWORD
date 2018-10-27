`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:34:08 11/22/2017 
// Design Name: 
// Module Name:    MUX2T1_64 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MUX2T1_64(input [63:0] a,
						input [63:0] b,
						input sel,
						output reg [63:0] o
    );
	 
	always @ (*) begin
		case(sel)
			1'b0: begin o[63:0] <= a[63:0]; end
			1'b1: begin o[63:0] <= b[63:0]; end
		endcase
	end

endmodule
