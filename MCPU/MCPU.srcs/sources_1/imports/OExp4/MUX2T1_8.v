`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:33:45 11/22/2017 
// Design Name: 
// Module Name:    MUX2T1_8 
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
module MUX2T1_8(	input [7:0] a,
						input [7:0] b,
						input sel,
						output reg [7:0] o
    );
	 
	always @ (*) begin
		case(sel)
			1'b0: begin o[7:0] = a[7:0]; end
			1'b1: begin o[7:0] = b[7:0]; end
		endcase
	end

endmodule
