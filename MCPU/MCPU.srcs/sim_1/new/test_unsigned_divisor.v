`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2018 08:36:49 PM
// Design Name: 
// Module Name: test_unsigned_divisor
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


module test_unsigned_divisor(
    );

reg clk;
reg reset;
reg start;
reg [31:0] A, B;

wire finish;
wire error;
wire [31:0] Q, R;

Unsigned_Divider D0(clk, reset, start, A, B, finish, error, Q, R);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    start = 1;
    reset = 1;
    #50;
    A = 32'd5;
    B = 32'd4;
    reset = 0;
    #500;
    start = 1;
    A = 32'hfffffff7;
    B = 32'd3;
end

always @ (posedge clk) begin
    if(finish) begin
        #10;
        start = 0;
    end
end

endmodule
