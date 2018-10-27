`timescale 1ns / 1ps

module Regs(input clk,
			input rst,
			input L_S,
			input [4:0] R_addr_A,
			input [4:0] R_addr_B,
			input [4:0] Wt_addr,
			input [4:0] Test_addr,
			input [31:0] Wt_data,
			output [31:0] rdata_A,
			output [31:0] rdata_B,
			output [31:0] test_data,
			output [1023:0] Reg_out
);

reg [31:0] register [1:31];
integer i;

	assign rdata_A = (R_addr_A == 0) ? 0 : register[R_addr_A];
	assign rdata_B = (R_addr_B == 0) ? 0 : register[R_addr_B];
	assign test_data = (Test_addr == 0) ? 0 : register[Test_addr];
    assign Reg_out = {register[5'd31], register[5'd30], register[5'd29], register[5'd28], 
                      register[5'd27], register[5'd26], register[5'd25], register[5'd24], 
                      register[5'd23], register[5'd22], register[5'd21], register[5'd20], 
                      register[5'd19], register[5'd18], register[5'd17], register[5'd16], 
                      register[5'd15], register[5'd14], register[5'd13], register[5'd12], 
                      register[5'd11], register[5'd10], register[5'd9],  register[5'd8], 
                      register[5'd7],  register[5'd6],  register[5'd5],  register[5'd4], 
                      register[5'd3],  register[5'd2],  register[5'd1],  {32{1'b0}}};
    
	always @ (posedge clk or posedge rst) begin
		if(rst == 1) begin
			for(i = 1; i < 32; i = i + 1) register[i] <= 0;
		end
		else begin
			if((Wt_addr != 0) && (L_S == 1)) begin
				register[Wt_addr] <= Wt_data;
			end 
		end
	end


endmodule