// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Sep 12 17:13:21 2018
// Host        : ChrisThinkPad running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Signed_Multiplier_sim_netlist.v
// Design      : Signed_Multiplier
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Signed_Multiplier,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_B_TYPE = "0" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(1'b0),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "32" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "32" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "0" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "63" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14
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
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_B_TYPE = "0" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14_viv i_mult
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
gJXbOCY3sX434wc0SmuN2/Gxv0gXVms0KlWGkc5X/swdIRcTzO9EHDlfidopPpIoI7XyGKqoge3S
BtAY5zeEcAndtABqNB4Z5QJz57xZsBjQC7/w9rhziCiVI/gnrd4ADoCRY9wNY6gTp9wXnhGz8tU+
atG+ZNs+zqumoU9sZ2Uukt0VndTukaZh4MBrq745MrDI00yh5+qiYif79TCTjS/y1vAohnD4uAHF
RPq1LGA6YnmfyjTkp9exxo5wsC7yeSiTDgC4awkBdUriZYL87jFibMMl18fDQMGyF/z1eNXByiXe
saFn2zdozk/VGyCq3uZqR3p3FRZkg19CiOzrkQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nS1pLvRl5hFxdZcLhF8id8B/eSBDl1RLDwxjhHE7zHLZCjuSkQ4Sh1U9hZyaj/DtC4kVI73y5Ypw
HZqR2gWs110gh3k/iwIiecMEf5tl/WemH7lDwgVrqNfx1xG1Ke95avNkMnfSUd6wFW4io6N4sHbh
Vv1FVjU45sZSYHdTkxyASquRVjHZ4srv8Q/hi80x/4vo/HkuYmAZm32Hjfo4Y41hQNdt0P1j8aCR
NeDIl4DQ354ETtAqpVscrw1zOcDaUdnUlvpBGNoQ6zfu4WNiyGPno0ZQImmgS2zp9tM4Tckabt4D
kL+Xc4OPZ44hroRoMnVINh8Hg+OrRpYt9js5fA==

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
