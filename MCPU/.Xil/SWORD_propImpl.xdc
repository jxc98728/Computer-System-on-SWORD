set_property SRC_FILE_INFO {cfile:{E:/Verilog Project/Architecture/MCPU/MCPU.srcs/constrs_1/new/SWORD.xdc} rfile:../MCPU.srcs/constrs_1/new/SWORD.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
create_clock -name clk_cpu -period 20.00 -waveform {0 10} [get_nets {U8/CPU_clk}]
