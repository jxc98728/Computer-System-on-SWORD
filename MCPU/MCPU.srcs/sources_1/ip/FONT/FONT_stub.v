// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Fri Aug 31 16:32:27 2018
// Host        : ChrisThinkPad running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {e:/Verilog
//               Project/Architecture/MCPU/MCPU.srcs/sources_1/ip/FONT/FONT_stub.v}
// Design      : FONT
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1" *)
module FONT(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[14:0],douta[0:0]" */;
  input clka;
  input [14:0]addra;
  output [0:0]douta;
endmodule
