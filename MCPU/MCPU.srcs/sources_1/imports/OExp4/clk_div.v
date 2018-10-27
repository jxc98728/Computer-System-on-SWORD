`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:35 03/06/2018 
// Design Name: 
// Module Name:    clk_div 
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
module clk_div(		input clk,
					input rst,
					input SW2,
					input SW13,
					input ManualClk,
					output reg [31:0] clkdiv,
					output Clk_CPU
    );
	assign Clk_CPU = SW13 ? (ManualClk) : (SW2 ? clkdiv[16]:clkdiv[0]);
	
	
	always @ (posedge clk) begin
        clkdiv <= clkdiv + 1'b1;
	end

endmodule
