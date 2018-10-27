// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Sep 12 17:13:22 2018
// Host        : ChrisThinkPad running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {e:/Verilog
//               Project/Architecture/MCPU/MCPU.srcs/sources_1/ip/Signed_Multiplier/Signed_Multiplier_sim_netlist.v}
// Design      : Signed_Multiplier
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Signed_Multiplier,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module Signed_Multiplier
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
  Signed_Multiplier_mult_gen_v12_0_14 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Signed_Multiplier_mult_gen_v12_0_14
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
  Signed_Multiplier_mult_gen_v12_0_14_viv i_mult
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
c0+KH0SnLdxwBmSNr2gKioICNH4aI4Cbw24/PQqvpSr1/gJec7Y2tlxeNWePWr7gyHABcE91ux/w
KPPedoJgc48uIq9C5LJS5lBjfa6VGx6qASovZfxGPmwkqHcEVOjl0NvckRQU0k3y0isPtJayHeT1
m/cmxrD/YzqEMjyEhiqOgEFCWWw5jtt+sp1QPlOqENrulHfx97xe9ozS6Gl0GJXnUvxtrZsIygfE
8X6F31HtZeXnLmZ+HVdtIBeBv5omTqwqMZMJyXWayDLNSx4mX3TzJVVfzhI9ud7Kq6YWyrrQNJpu
ZlU4Y6siWPwaSIie/eFVpXPppn/S4y3I/Zy5nQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZuBh5jQNbxnxVr2ApYZk9/WPq0PuZmFiWL3QjxAkWvyTKINi4AgaOYFV/jrpQBIQGrVV9lX7TYsw
6e4ZRvQjV4Dn4SkZZRUKBKaGu6zLfCTAFD4jcHY3PZvKUu0vuXxJQq/5+76cDya3xTnIHFTZeNTj
fHfVEMDwTrnODGPoZlRdMxbq/r1VHlDGLG/HorkQCvYG31gPzlWjtyV057Lx5vyvU1jsVsFsBMHP
JOSbi1BpKkVasRUKhP6myLNc9mFJJ1CWmn9DU2WunYOStv+H+VFo1Ky/GHVGVxdYMF0oV5xza1Ah
xPaCUEFYH4CRc61bRu5oCdWLKT8ufhNJWPe3bA==

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
