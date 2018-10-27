// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Sep 12 17:37:12 2018
// Host        : ChrisThinkPad running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {e:/Verilog
//               Project/Architecture/MCPU/MCPU.srcs/sources_1/ip/Unsigned_Multiplier/Unsigned_Multiplier_sim_netlist.v}
// Design      : Unsigned_Multiplier
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Unsigned_Multiplier,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module Unsigned_Multiplier
   (A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [63:0]P;

  wire [31:0]A;
  wire [31:0]B;
  wire [63:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "63" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Unsigned_Multiplier_mult_gen_v12_0_14 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(1'b0),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "32" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "32" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "0" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "63" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Unsigned_Multiplier_mult_gen_v12_0_14
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [31:0]A;
  input [31:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [63:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [31:0]A;
  wire [31:0]B;
  wire [63:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "63" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Unsigned_Multiplier_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(1'b0),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
TvNAk+dzefmJC5/xfGEoXo1v1zzw15yvf2w3I+7pl9weHnOYLTwk2CtA6qQwUdiv+KPlR09XyHxt
UocEiAlS9g==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ccd1Kr3IgmbU3Zd5R5UGhugxe9OUvTTk5M/+YDzRXyTvXIMaUxHB5fv7SuuebIYqGrGlL5seA2Sg
zO1i2uQFXVFn4M1DHS2E7BwirWBP5gmU/RaWKyEfTu3E5ZGbc1lvK67CCG8szRwdrvmY+Z8CpiC4
+fKoXg6GREReZgylTmE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D4OySXRBGdK3bWTwoBJnna9JJTCfjtow8OCB97TMc0CHJtgWscKG0sA6JP+WmQu+g/St8V3dnWCm
Z/oL2u8esW79WhsyQGAkuc2zUGutMTiH5JtlsxfFXreCjsbpfiQ4cOTSVV8RKFLaZCW+eXj7qQwk
WUd+Rk2Kp6kViZmb9GfGDSBc1qKbMuYuGLGiO+UVYNdt7dkYg9aAhJYx3c/Tx4m6BAZTpzEs9xzl
Mg0Plk7PRG/v5PXojT+9MvJ80iSqd3ejpG6kEE1mYBAhD1zmHQfbte6ipINFibjTuluuS5i0pIbf
HaA/nmULSj1xFBTfeEdDhm4CrFUWEdYvrJoOhg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YmbWYAZhC3ayB3FdtHMbSkvV5OWWIi6gmohNfeiL3hZEqSlPd2B43zehv3FM2BA2v3N0HlGO0TL6
neUbRccVG37R0aVoXEjetzHP+ZMpVpr2wNRYoVv9EAzvD7YjPAyiMQMLJO1wmw/LJVkGpP4UCg4g
tgMS7M+LmVgeot1Fmcwa4mDyquYpShDC0ZhYtWL3VmO204ubc1HcI1fEQiMp+tBP7rYU0jIyGMtz
dXGUYS7PdIYkz5ApCjSfCCueqmWeZf9/KXMkoo9udSh2ZyT9uNr+GM8fH8rcz5nZjN4ShPghIUSN
XIZbR6KJ/+WqugC6B6ULpEZUxft3AS1vxij4dA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pRgO0aX5waanQk0eZ4W7Q+LVxiXC+tf9hFRN9nsdM6xbA9apyUI0wd0pRjkzt/X5yvazLViQDSfS
Bm9cP+mYh23I891gOC2bMeto93RQUYlDhWmKA2HAuokJj6wKo/vk9LA0e/rAjHMWD7cTXHkdXPdz
d92x8sSRX6Z5gz0YOJ8hU+X3aLkMrr/d+Rs3UcELF+MTGSf53SzTuIbnaw08EsHUObyFusQxXlt6
ZuByaRiPP1ofEvMk+UCLRZThOA7sR6SIfjXOTF55TQgss4/Mf30sm+t84LW+xNBWIqVfiQ671PZF
CQ8K4qBj3nTT9D0FTUvfHdTmLtywWgV65+5W3A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
d38DScsESf/yIfST5KEEwSUvjI+Km/dbua2xenGdzq3rgc/diAWKNIN11lcJIPDVBe6fB9J2TqbT
eXC+WnYP2YB9QXYlwKxLW7HOYcLC6Ivx9uoTg503B1azg5yB52W8iAwxelCieuRZ3qo4CxwOJ4w3
kwV+F675PsE0hWvEwTA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Bf4H+OH1vHHXYQ0B+xvr52Pkbk3t9R17gzpbDdSPXjerF+p1mOwTJrxL3jQRkm9rUtVIgJGiq2/s
crniU3gwf/UiAzOrNxcIp9eKlLwDNsxSMYn+mkUQWlDdifqNNVK+YFJD0ZFE6pzyWAfSd99uwvf2
B/+VXkZFAWz3devN4zOqXGE5+OZKTJNNH2fm+gcI0n7V4lPByrga5xMdlx99MQZZRprmMts+yOHQ
eVL2q0jneXaC7j4j8aSjRtpPAjf6aWk9xkdj2iVGAqs6TlpdNPyA9bKumNf3XCjAnjbNwxHWWAao
tHbBrxiXF1qQUoAzJ9mjy31tCjRX+JQOzKafLw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
W7Hqtp06f4kCVnZJcvuCK1uR122fg7um0aCWPgjoisL8ZqvUXN/cnRBHleEhphkfXS2GneevbgeS
vm3/HHbMIe4LRqIvduz6sXtaNRve4wh88Wr5iS3gi3Nk/7GSn8BvvZVCUTIX0U32VhZDv+WNJ78U
NrgBGuDobb2EOm74k53la4yABim1Xu7warzauJqbQM221PEwgTjZHUaO3ccROsjRez95vfN8M4BD
FngT5OcTwEm5NW8LiqXk4n+coa9gAdIQwqa7CM8A0Zguao36nXkqOmPFBNvmqloI4RJ3D1zrrDM+
Wuye8QvEHAsQ9uJOi8lTpuwism41ezzHt0Hpqg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gb18ucNo3B/+3okFx52hCaD/LJ4AcZ/ixW/lmrPaN8rCWkZF34dhg3YBTg9jRd5T8ZXcXVs1bsR4
GubkWGYqqDEdvO+YwbORews4NMP0yUsQfVEEkb+SPBIO/beW5bq5mjy10Yy8SzjlJhrlCX8D56kJ
zK2CmiLd4LVDBt9PglAaj5vpB5o5UDGbffPFS92+b6uAtp2otmd370zX9mr/twiJ6wUeIv7xHt8U
4np+fPRrOLA5RJpVDmARIOWtDQN+a+3O+z7E1ybOPL77KpVaak8/E95YEMq5/dgcWiZw7FZ6hdpI
NIH75VXFdIN1RuBfTg2qFrKJeRGI0z7xku+SGA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28720)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
