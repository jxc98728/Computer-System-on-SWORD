`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2018 03:48:57 PM
// Design Name: 
// Module Name: VRAM_Text
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


module VRAM_Text(
			input vga_clk,
			input [8:0]row,
			input [9:0]col,
			output [11:0]vga_data,
									 
			input ram_clk,
			input [15:0]text_data_in,
			input [11:0]text_addr,
			input text_we
		);


wire [15:0] letter;
wire [11:0] letter_addr;
wire [6:0] bit_addr;
wire BorF;
	 
wire [9:0] keys;
wire key_ready;

reg [11:0] color_info;

	// letter address = col / 8 + row * 80 / 16 = col / 8 + row + row * 4
	assign letter_addr = {{5{1'b0}}, col[9:3]} + row[8:4] * 7'd80;
	 
	// bit address = row[3:0] * 8 + col[2:0]
	assign bit_addr = {row[3:0], col[2:0]};


	/*
		Color Scheme: letter[15:8]

		Lower Byte -> Font:

		0 - White
		1 - Black

		Higher Byte -> Background:
                
        0 - Black
        1 - White

	*/

	always @ (*) begin
		
		// 12 - bit
		// 11 - 0
		// bbbb - gggg - rrrr
		
		// Font
		if(BorF) begin
			case(letter[11:8])
				4'h0: color_info <= 12'hfff; // White
				4'h1: color_info <= 12'h000; // Black
				4'h3: color_info <= 12'h00f; // Red
				4'h4: color_info <= 12'h0f0; // Green
				4'h5: color_info <= 12'hf00; // Blue
				4'h6: color_info <= 12'h6af; // SandyBrown
//				4'h7
//				4'h8
//				4'h9
//				4'hA
//				4'hB
//				4'hC
//				4'hD
//				4'hE
//				4'hF
			endcase

		end

		// Background
		else begin
			case(letter[15:12])
				4'h0: color_info <= 12'h000; // Black
                4'h1: color_info <= 12'h111; // White
                4'h3: color_info <= 12'h00f; // Red
                4'h4: color_info <= 12'h0f0; // Green
                4'h5: color_info <= 12'hf00; // Blue
                4'h6: color_info <= 12'h6af; // SandyBrown
//              4'h7
//              4'h8
//              4'h9
//              4'hA
//              4'hB
//              4'hC
//              4'hD
//              4'hE
//              4'hF
			endcase
		end
	end


	assign vga_data = color_info;

	Text_RAM  	RAM_Text(
						.clka(ram_clk),    		// input wire clka
						.wea(text_we),      	// input wire [0 : 0] wea
						.addra(text_addr),  	// input wire [11 : 0] addra
						.dina(text_data_in),    // input wire [15 : 0] dina
						.clkb(vga_clk),    		// input wire clkb
						.addrb(letter_addr),  	// input wire [11 : 0] addrb
						.doutb(letter)    		// output wire [15 : 0] doutb
						);


	FONT    	FONT(
					.clka(vga_clk),     				// input wire clka
					.addra({letter[7:0], bit_addr}),    // input wire [14 : 0] addra
					.douta(BorF)     					// output wire [0 : 0] douta
					);
	
endmodule
