`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2018 05:15:39 PM
// Design Name: 
// Module Name: signed_multiplier_test
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


module signed_multiplier_test(

    );
reg [31:0] A, B;
wire [63:0] P;

initial begin
    A = 32'h00000000;
    B = 32'h00000000;
    #10;
    A = 32'd640;
    B = 32'd240;
    #100;
    A = 32'hffffffff;
    B = 32'h7fffffff;
    
end

Signed_Multiplier M0(.A(A), .B(B), .P(P));



endmodule
