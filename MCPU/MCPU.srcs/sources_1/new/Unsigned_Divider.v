`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2018 08:17:33 PM
// Design Name: 
// Module Name: Unsigned_Divider
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


module Unsigned_Divider(
    input clk, // clock
    input reset,
    input start,
    input [31:0] Dividend,
    input [31:0] Divisor,
    output reg finish,
    output error,
    output [31:0] Quotient,
    output [31:0] Remainder
    );

reg active;
reg [4:0] cycle;
reg [31:0] result;
reg [31:0] denom;
reg [31:0] work;

wire [32:0] sub = {work[30:0], result[31]} - denom;

    assign error = !Divisor;
    assign Quotient = result;
    assign Remainder = work;
    

    always @ (posedge clk or posedge reset) begin
        if(reset) begin
            cycle <= 0;
            result <= 0;
            denom <= 0;
            work <= 0;
            active <= 0;
            finish <= 0;
        end
        else if(start) begin
            if(active) begin
                if(sub[32] == 0) begin
                    work <= sub[31:0];
                    result <= {result[30:0], 1'b1};
                end
                else begin
                    work <= {work[30:0], result[31]};
                    result <= {result[30:0], 1'b0};
                end
                if(cycle == 0) begin
                    active <= 0;
                    finish <= 0;
                end
                if(cycle == 1) begin
                    finish <= 1;
                end
                cycle <= cycle - 5'd1;
            end
            else begin
                cycle <= 5'd31;
                result <= Dividend;
                denom <= Divisor;
                work <= 32'h00000000;
                active <= 1;
                finish <= 0;
            end
        end
    end
    
endmodule