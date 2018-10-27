// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Sep 12 17:37:11 2018
// Host        : ChrisThinkPad running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Unsigned_Multiplier_sim_netlist.v
// Design      : Unsigned_Multiplier
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Unsigned_Multiplier,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.1" *) 
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

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "32" *) (* C_B_TYPE = "1" *) 
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
qyBJoXJr4A4CDMDOu1sOSj6UqVK4Ymd3Tah5XmdtDp1mibvHonBlT1Tmq3D7rTcUTl5ikvFgPGBQ
Py0zNXcGwEaYMzLKH8RngJFBDv5e1bz++Ld7L4WxYNC7bxOmD5E9mvjO++hwyHu46lxPAbkddF4J
mC5nId5QyWO7J1eeHAgRBiF7esXQpGrSVTWvUZscNrlSy8XsxWqM9c1+WiEZNyKAZcUD+69Ltt7w
tWQ98yhu6hnCHtxdBKZBM0fmoieM5FbbYcOLgAmnJKrA4Tc1+O00agMAruNNNBJVKmtm45GDh+J7
5vrJmVtSMWqK/l8h7fgtl8HGiR5St92fzuDYzg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jSa4ww9E6RoGFRF4SzDICFDBb5o5nD3AAhTPl2Kkn2STHDLUblHhGBi6EjpDq5YQ2fKabQTo1coF
SZ2MmincRIMlfSGH1akaChCrcKQCsIar0EIZmhcxPQjLDED9YEdKPBGKA6JjpI8t+sa0ay5ZOo61
IxOM38h4AVuduJysxGQZ2iajezlaI7DEgouW7qpqMp7750m8J6m2AySZaeY2RWbLcDy1V7WdKv0x
ZRw455mMhazP9y91IMVmVVclzfi8GpCQW3T/nUlEUvxg/RSN0hQiNjYOfzP1KxB+4v0hwbdXvKqM
V1Qa2HYJV8GFf2SN6LaBm6xJQqXyg2feNY9n6w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28704)
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
