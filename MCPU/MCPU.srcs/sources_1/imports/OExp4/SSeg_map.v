`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:43 11/17/2017 
// Design Name: 
// Module Name:    SSeg_map 
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

module SSeg_map(input [63:0]Disp_num,
					output reg [63:0]SSeg_map	
					);
		always @ * begin
					SSeg_map[63] <= Disp_num[0];
					SSeg_map[62] <= Disp_num[4];
					SSeg_map[61] <= Disp_num[16];
					SSeg_map[60] <= Disp_num[25];
					SSeg_map[59] <= Disp_num[17];
					SSeg_map[58] <= Disp_num[5];
					SSeg_map[57] <= Disp_num[12];
					SSeg_map[56] <= Disp_num[24];
				
					SSeg_map[55] <= Disp_num[1];
					SSeg_map[54] <= Disp_num[6];
					SSeg_map[53] <= Disp_num[18];
					SSeg_map[52] <= Disp_num[27];
					SSeg_map[51] <= Disp_num[19];
					SSeg_map[50] <= Disp_num[7];
					SSeg_map[49] <= Disp_num[13];
					SSeg_map[48] <= Disp_num[26];
				
					SSeg_map[47] <= Disp_num[2];
					SSeg_map[46] <= Disp_num[8];
					SSeg_map[45] <= Disp_num[20];
					SSeg_map[44] <= Disp_num[29];
					SSeg_map[43] <= Disp_num[21];
					SSeg_map[42] <= Disp_num[9];
					SSeg_map[41] <= Disp_num[14];
					SSeg_map[40] <= Disp_num[28];
				
					SSeg_map[39] <= Disp_num[3];
					SSeg_map[38] <= Disp_num[10];
					SSeg_map[37] <= Disp_num[22];
					SSeg_map[36] <= Disp_num[31];
					SSeg_map[35] <= Disp_num[23];
					SSeg_map[34] <= Disp_num[11];
					SSeg_map[33] <= Disp_num[15];
					SSeg_map[32] <= Disp_num[30];
					
					SSeg_map[31] <= Disp_num[32];
					SSeg_map[30] <= Disp_num[36];
					SSeg_map[29] <= Disp_num[48];
					SSeg_map[28] <= Disp_num[57];
					SSeg_map[27] <= Disp_num[49];
					SSeg_map[26] <= Disp_num[37];
					SSeg_map[25] <= Disp_num[44];
					SSeg_map[24] <= Disp_num[56];
				
					SSeg_map[23] <= Disp_num[33];
					SSeg_map[22] <= Disp_num[38];
					SSeg_map[21] <= Disp_num[50];
					SSeg_map[20] <= Disp_num[59];
					SSeg_map[19] <= Disp_num[51];
					SSeg_map[18] <= Disp_num[39];
					SSeg_map[17] <= Disp_num[45];
					SSeg_map[16] <= Disp_num[58];
				
					SSeg_map[15] <= Disp_num[34];
					SSeg_map[14] <= Disp_num[40];
					SSeg_map[13] <= Disp_num[52];
					SSeg_map[12] <= Disp_num[61];
					SSeg_map[11] <= Disp_num[53];
					SSeg_map[10] <= Disp_num[41];
					SSeg_map[9] <= Disp_num[46];
					SSeg_map[8] <= Disp_num[60];
				
					SSeg_map[7] <= Disp_num[35];
					SSeg_map[6] <= Disp_num[42];
					SSeg_map[5] <= Disp_num[54];
					SSeg_map[4] <= Disp_num[63];
					SSeg_map[3] <= Disp_num[55];
					SSeg_map[2] <= Disp_num[43];
					SSeg_map[1] <= Disp_num[47];
					SSeg_map[0] <= Disp_num[62];
				
			end
endmodule
