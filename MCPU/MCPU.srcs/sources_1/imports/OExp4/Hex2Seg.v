`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:38 11/20/2017 
// Design Name: 
// Module Name:    Hex2Seg 
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
module Hex2Seg(input [3:0] Hex,
					input LE,
					input point,
					input flash,
					output [7:0] Segment
    );
	 
	 wire en = LE & flash;
	 MC14495_ZJU MSEG(.D_3(Hex[3]),.D_2(Hex[2]),.D_1(Hex[1]),.D_0(Hex[0]),.LE(en),.Point(point),
							.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.p(p));
	 assign Segment = {a,b,c,d,e,f,g,p};
endmodule


