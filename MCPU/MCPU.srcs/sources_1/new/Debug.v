`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2018 11:00:17 PM
// Design Name: 
// Module Name: Debug
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


module Debug(
        input clk,
		input rst,
		input [8:0] row,
		input [9:0] col,
		input [31:0] PC,
		input [31:0] EPC,
		input [31:0] Inst_out,
		input [31:0] Addr_out,
		input [31:0] Data_out,
		input [31:0] Data_in,
		input [31:0] Hi,
		input [31:0] Lo,
		input [31:0] Cause,
		input [31:0] Status,
		input [1023:0] Reg,
		output [11:0] vga_data
    );

reg  [11:0] letter;
reg  [11:0] color;
wire [6:0] bit_addr;
wire [11:0] letter_addr;

wire BorF;


	// letter address = col / 8 + row * 80 / 16 = col / 8 + row + row * 4
	assign letter_addr = {{5{1'b0}}, col[9:3]} + row[8:4] * 7'd80;
	 
	// bit address = row[3:0] * 8 + col[2:0]
	assign bit_addr = {row[3:0], col[2:0]};

	assign vga_data = color;

	always @ (*) begin
		if(rst) begin
			letter <= 12'h0ff;
		end
		else begin
			case(letter_addr)
				12'd0: letter <= 12'h34f;//O
				12'd1: letter <= 12'h368;//h
				12'd2: letter <= 12'h32d;//-
				12'd3: letter <= 12'h34d;//M
				12'd4: letter <= 12'h379;//y
				12'd5: letter <= 12'h32d;//-
				12'd6: letter <= 12'h353;//S
				12'd7: letter <= 12'h377;//w
				12'd8: letter <= 12'h36f;//o
				12'd9: letter <= 12'h372;//r
				12'd10: letter <= 12'h364;//d
				12'd11: letter <= 12'h320;//space
				12'd12: letter <= 12'h344;//D
				12'd13: letter <= 12'h365;//e
				12'd14: letter <= 12'h362;//b
				12'd15: letter <= 12'h375;//u
				12'd16: letter <= 12'h367;//g
				12'd17: letter <= 12'h320;//space
				12'd18: letter <= 12'h34d;//M
				12'd19: letter <= 12'h36f;//o
				12'd20: letter <= 12'h364;//d
				12'd21: letter <= 12'h365;//e
				12'd22: letter <= 12'h320;//space
				12'd23: letter <= 12'h35b;//[
				12'd24: letter <= 12'h356;//V
				12'd25: letter <= 12'h365;//e
				12'd26: letter <= 12'h372;//r
				12'd27: letter <= 12'h373;//s
				12'd28: letter <= 12'h369;//i
				12'd29: letter <= 12'h36f;//o
				12'd30: letter <= 12'h36e;//n
				12'd31: letter <= 12'h320;//space
				12'd32: letter <= 12'h331;//1
				12'd33: letter <= 12'h32e;//.
				12'd34: letter <= 12'h330;//0
				12'd35: letter <= 12'h32e;//.
				12'd36: letter <= 12'h330;//0
				12'd37: letter <= 12'h35d;//]


				12'd80: letter <= 12'h34a;//J
				12'd81: letter <= 12'h369;//i
				12'd82: letter <= 12'h361;//a
				12'd83: letter <= 12'h36e;//n
				12'd84: letter <= 12'h367;//g
				12'd85: letter <= 12'h320;//space
				12'd86: letter <= 12'h358;//X
				12'd87: letter <= 12'h369;//i
				12'd88: letter <= 12'h361;//a
				12'd89: letter <= 12'h36f;//o
				12'd90: letter <= 12'h363;//c
				12'd91: letter <= 12'h368;//h
				12'd92: letter <= 12'h36f;//o
				12'd93: letter <= 12'h36e;//n
				12'd94: letter <= 12'h367;//g
				12'd95: letter <= 12'h32c;//,
				12'd96: letter <= 12'h320;//space
				12'd97: letter <= 12'h343;//C
				12'd98: letter <= 12'h353;//S
				12'd99: letter <= 12'h332;//2
				12'd100: letter <= 12'h330;//0
				12'd101: letter <= 12'h331;//1
				12'd102: letter <= 12'h336;//6
				12'd103: letter <= 12'h32c;//,
				12'd104: letter <= 12'h320;//space
				12'd105: letter <= 12'h35a;//Z
				12'd106: letter <= 12'h34a;//J
				12'd107: letter <= 12'h355;//U
				12'd108: letter <= 12'h32e;//.
				12'd109: letter <= 12'h320;//space
				12'd110: letter <= 12'h341;//A
				12'd111: letter <= 12'h36c;//l
				12'd112: letter <= 12'h36c;//l
				12'd113: letter <= 12'h320;//space
				12'd114: letter <= 12'h372;//r
				12'd115: letter <= 12'h369;//i
				12'd116: letter <= 12'h367;//g
				12'd117: letter <= 12'h368;//h
				12'd118: letter <= 12'h374;//t
				12'd119: letter <= 12'h373;//s
				12'd120: letter <= 12'h320;//space
				12'd121: letter <= 12'h372;//r
				12'd122: letter <= 12'h365;//e
				12'd123: letter <= 12'h373;//s
				12'd124: letter <= 12'h365;//e
				12'd125: letter <= 12'h372;//r
				12'd126: letter <= 12'h376;//v
				12'd127: letter <= 12'h365;//e
				12'd128: letter <= 12'h364;//d
				12'd129: letter <= 12'h32e;//.
				
			

				12'd320: letter <= 12'h150;//P
				12'd321: letter <= 12'h143;//C
				12'd322: letter <= 12'h03a;//:
				12'd332: letter <= 12'h030;//0
				12'd333: letter <= 12'h078;//x
				12'd334: letter <= {{8{1'b0}}, PC[31:28]};
				12'd335: letter <= {{8{1'b0}}, PC[27:24]};
				12'd336: letter <= {{8{1'b0}}, PC[23:20]};
				12'd337: letter <= {{8{1'b0}}, PC[19:16]};
				12'd338: letter <= {{8{1'b0}}, PC[15:12]};
				12'd339: letter <= {{8{1'b0}}, PC[11:8]};
				12'd340: letter <= {{8{1'b0}}, PC[7:4]};
				12'd341: letter <= {{8{1'b0}}, PC[3:0]};

				12'd360: letter <= 12'h145;//E
				12'd361: letter <= 12'h150;//P
				12'd362: letter <= 12'h143;//C
				12'd363: letter <= 12'h03a;//:
				12'd372: letter <= 12'h030;//0
				12'd373: letter <= 12'h078;//x
				12'd374: letter <= {{8{1'b0}}, EPC[31:28]};
				12'd375: letter <= {{8{1'b0}}, EPC[27:24]};
				12'd376: letter <= {{8{1'b0}}, EPC[23:20]};
				12'd377: letter <= {{8{1'b0}}, EPC[19:16]};
				12'd378: letter <= {{8{1'b0}}, EPC[15:12]};
				12'd379: letter <= {{8{1'b0}}, EPC[11:8]};
				12'd380: letter <= {{8{1'b0}}, EPC[7:4]};
				12'd381: letter <= {{8{1'b0}}, EPC[3:0]};


				12'd400: letter <= 12'h149;//I
				12'd401: letter <= 12'h16e;//n
				12'd402: letter <= 12'h173;//s
				12'd403: letter <= 12'h174;//t
				12'd404: letter <= 12'h15f;//_
				12'd405: letter <= 12'h16f;//o
				12'd406: letter <= 12'h175;//u
				12'd407: letter <= 12'h174;//t
				12'd408: letter <= 12'h03a;//:
				12'd412: letter <= 12'h030;//0
				12'd413: letter <= 12'h078;//x
				12'd414: letter <= {{8{1'b0}}, Inst_out[31:28]};
				12'd415: letter <= {{8{1'b0}}, Inst_out[27:24]};
				12'd416: letter <= {{8{1'b0}}, Inst_out[23:20]};
				12'd417: letter <= {{8{1'b0}}, Inst_out[19:16]};
				12'd418: letter <= {{8{1'b0}}, Inst_out[15:12]};
				12'd419: letter <= {{8{1'b0}}, Inst_out[11:8]};
				12'd420: letter <= {{8{1'b0}}, Inst_out[7:4]};
				12'd421: letter <= {{8{1'b0}}, Inst_out[3:0]};

				12'd440: letter <= 12'h141;//A
				12'd441: letter <= 12'h164;//d
				12'd442: letter <= 12'h164;//d
				12'd443: letter <= 12'h172;//r
				12'd444: letter <= 12'h15f;//_
				12'd445: letter <= 12'h16f;//o
				12'd446: letter <= 12'h175;//u
				12'd447: letter <= 12'h174;//t
				12'd448: letter <= 12'h03a;//:
				12'd452: letter <= 12'h030;//0
				12'd453: letter <= 12'h078;//x
				12'd454: letter <= {{8{1'b0}}, Addr_out[31:28]};
				12'd455: letter <= {{8{1'b0}}, Addr_out[27:24]};
				12'd456: letter <= {{8{1'b0}}, Addr_out[23:20]};
				12'd457: letter <= {{8{1'b0}}, Addr_out[19:16]};
				12'd458: letter <= {{8{1'b0}}, Addr_out[15:12]};
				12'd459: letter <= {{8{1'b0}}, Addr_out[11:8]};
				12'd460: letter <= {{8{1'b0}}, Addr_out[7:4]};
				12'd461: letter <= {{8{1'b0}}, Addr_out[3:0]};


				12'd480: letter <= 12'h144;//D
				12'd481: letter <= 12'h161;//a
				12'd482: letter <= 12'h174;//t
				12'd483: letter <= 12'h161;//a
				12'd484: letter <= 12'h15f;//_
				12'd485: letter <= 12'h16f;//o
				12'd486: letter <= 12'h175;//u
				12'd487: letter <= 12'h174;//t
				12'd488: letter <= 12'h03a;//:
				12'd492: letter <= 12'h030;//0
				12'd493: letter <= 12'h078;//x
				12'd494: letter <= {{8{1'b0}}, Data_out[31:28]};
				12'd495: letter <= {{8{1'b0}}, Data_out[27:24]};
				12'd496: letter <= {{8{1'b0}}, Data_out[23:20]};
				12'd497: letter <= {{8{1'b0}}, Data_out[19:16]};
				12'd498: letter <= {{8{1'b0}}, Data_out[15:12]};
				12'd499: letter <= {{8{1'b0}}, Data_out[11:8]};
				12'd500: letter <= {{8{1'b0}}, Data_out[7:4]};
				12'd501: letter <= {{8{1'b0}}, Data_out[3:0]};

				12'd520: letter <= 12'h144;//D
				12'd521: letter <= 12'h161;//a
				12'd522: letter <= 12'h174;//t
				12'd523: letter <= 12'h161;//a
				12'd524: letter <= 12'h15f;//_
				12'd525: letter <= 12'h169;//i
				12'd526: letter <= 12'h16e;//n
				12'd527: letter <= 12'h03a;//:
				12'd532: letter <= 12'h030;//0
				12'd533: letter <= 12'h078;//x
				12'd534: letter <= {{8{1'b0}}, Data_in[31:28]};
				12'd535: letter <= {{8{1'b0}}, Data_in[27:24]};
				12'd536: letter <= {{8{1'b0}}, Data_in[23:20]};
				12'd537: letter <= {{8{1'b0}}, Data_in[19:16]};
				12'd538: letter <= {{8{1'b0}}, Data_in[15:12]};
				12'd539: letter <= {{8{1'b0}}, Data_in[11:8]};
				12'd540: letter <= {{8{1'b0}}, Data_in[7:4]};
				12'd541: letter <= {{8{1'b0}}, Data_in[3:0]};

				

				12'd720: letter <= 12'h248;//H
				12'd721: letter <= 12'h269;//i
				12'd722: letter <= 12'h03a;//:
				12'd725: letter <= 12'h030;//0
				12'd726: letter <= 12'h078;//x
				12'd727: letter <= {{8{1'b0}}, Hi[31:28]};
				12'd728: letter <= {{8{1'b0}}, Hi[27:24]};
				12'd729: letter <= {{8{1'b0}}, Hi[23:20]};
				12'd730: letter <= {{8{1'b0}}, Hi[19:16]};
				12'd731: letter <= {{8{1'b0}}, Hi[15:12]};
				12'd732: letter <= {{8{1'b0}}, Hi[11:8]};
				12'd733: letter <= {{8{1'b0}}, Hi[7:4]};
				12'd734: letter <= {{8{1'b0}}, Hi[3:0]};


				12'd800: letter <= 12'h24c;//L
				12'd801: letter <= 12'h26f;//o
				12'd802: letter <= 12'h03a;//:
				12'd805: letter <= 12'h030;//0
				12'd806: letter <= 12'h078;//x
				12'd807: letter <= {{8{1'b0}}, Lo[31:28]};
				12'd808: letter <= {{8{1'b0}}, Lo[27:24]};
				12'd809: letter <= {{8{1'b0}}, Lo[23:20]};
				12'd810: letter <= {{8{1'b0}}, Lo[19:16]};
				12'd811: letter <= {{8{1'b0}}, Lo[15:12]};
				12'd812: letter <= {{8{1'b0}}, Lo[11:8]};
				12'd813: letter <= {{8{1'b0}}, Lo[7:4]};
				12'd814: letter <= {{8{1'b0}}, Lo[3:0]};


				12'd1040: letter <= 12'h024;//$
				12'd1041: letter <= 12'h530;//0
				12'd1042: letter <= 12'h530;//0
				12'd1043: letter <= 12'h03a;//:
				12'd1045: letter <= 12'h030;//0
				12'd1046: letter <= 12'h078;//x
				12'd1047: letter <= {{8{1'b0}}, Reg[31:28]};
				12'd1048: letter <= {{8{1'b0}}, Reg[27:24]};
				12'd1049: letter <= {{8{1'b0}}, Reg[23:20]};
				12'd1050: letter <= {{8{1'b0}}, Reg[19:16]};
				12'd1051: letter <= {{8{1'b0}}, Reg[15:12]};
				12'd1052: letter <= {{8{1'b0}}, Reg[11:8]};
				12'd1053: letter <= {{8{1'b0}}, Reg[7:4]};
				12'd1054: letter <= {{8{1'b0}}, Reg[3:0]};

				12'd1060: letter <= 12'h024;//$
				12'd1061: letter <= 12'h561;//a
				12'd1062: letter <= 12'h574;//t
				12'd1063: letter <= 12'h03a;//:
				12'd1065: letter <= 12'h030;//0
				12'd1066: letter <= 12'h078;//x
				12'd1067: letter <= {{8{1'b0}}, Reg[63:60]};
				12'd1068: letter <= {{8{1'b0}}, Reg[59:56]};
				12'd1069: letter <= {{8{1'b0}}, Reg[55:52]};
				12'd1070: letter <= {{8{1'b0}}, Reg[51:48]};
				12'd1071: letter <= {{8{1'b0}}, Reg[47:44]};
				12'd1072: letter <= {{8{1'b0}}, Reg[43:40]};
				12'd1073: letter <= {{8{1'b0}}, Reg[39:36]};
				12'd1074: letter <= {{8{1'b0}}, Reg[35:32]};

				12'd1080: letter <= 12'h024;//$
				12'd1081: letter <= 12'h576;//v
				12'd1082: letter <= 12'h530;//0
				12'd1083: letter <= 12'h03a;//:
				12'd1085: letter <= 12'h030;//0
				12'd1086: letter <= 12'h078;//x
				12'd1087: letter <= {{8{1'b0}}, Reg[95:92]};
				12'd1088: letter <= {{8{1'b0}}, Reg[91:88]};
				12'd1089: letter <= {{8{1'b0}}, Reg[87:84]};
				12'd1090: letter <= {{8{1'b0}}, Reg[83:80]};
				12'd1091: letter <= {{8{1'b0}}, Reg[79:76]};
				12'd1092: letter <= {{8{1'b0}}, Reg[75:72]};
				12'd1093: letter <= {{8{1'b0}}, Reg[71:68]};
				12'd1094: letter <= {{8{1'b0}}, Reg[67:64]};

				12'd1100: letter <= 12'h024;//$
				12'd1101: letter <= 12'h576;//v
				12'd1102: letter <= 12'h531;//1
				12'd1103: letter <= 12'h03a;//:
				12'd1105: letter <= 12'h030;//0
				12'd1106: letter <= 12'h078;//x
				12'd1107: letter <= {{8{1'b0}}, Reg[127:124]};
				12'd1108: letter <= {{8{1'b0}}, Reg[123:120]};
				12'd1109: letter <= {{8{1'b0}}, Reg[119:116]};
				12'd1110: letter <= {{8{1'b0}}, Reg[115:112]};
				12'd1111: letter <= {{8{1'b0}}, Reg[111:108]};
				12'd1112: letter <= {{8{1'b0}}, Reg[107:104]};
				12'd1113: letter <= {{8{1'b0}}, Reg[103:100]};
				12'd1114: letter <= {{8{1'b0}}, Reg[99:96]};

				12'd1120: letter <= 12'h024;//$
				12'd1121: letter <= 12'h561;//a
				12'd1122: letter <= 12'h530;//0
				12'd1123: letter <= 12'h03a;//:
				12'd1125: letter <= 12'h030;//0
				12'd1126: letter <= 12'h078;//x
				12'd1127: letter <= {{8{1'b0}}, Reg[159:156]};
				12'd1128: letter <= {{8{1'b0}}, Reg[155:152]};
				12'd1129: letter <= {{8{1'b0}}, Reg[151:148]};
				12'd1130: letter <= {{8{1'b0}}, Reg[147:144]};
				12'd1131: letter <= {{8{1'b0}}, Reg[143:140]};
				12'd1132: letter <= {{8{1'b0}}, Reg[139:136]};
				12'd1133: letter <= {{8{1'b0}}, Reg[135:132]};
				12'd1134: letter <= {{8{1'b0}}, Reg[131:128]};

				12'd1140: letter <= 12'h024;//$
				12'd1141: letter <= 12'h561;//a
				12'd1142: letter <= 12'h531;//1
				12'd1143: letter <= 12'h03a;//:
				12'd1145: letter <= 12'h030;//0
				12'd1146: letter <= 12'h078;//x
				12'd1147: letter <= {{8{1'b0}}, Reg[191:188]};
				12'd1148: letter <= {{8{1'b0}}, Reg[187:184]};
				12'd1149: letter <= {{8{1'b0}}, Reg[183:180]};
				12'd1150: letter <= {{8{1'b0}}, Reg[179:176]};
				12'd1151: letter <= {{8{1'b0}}, Reg[175:172]};
				12'd1152: letter <= {{8{1'b0}}, Reg[171:168]};
				12'd1153: letter <= {{8{1'b0}}, Reg[167:164]};
				12'd1154: letter <= {{8{1'b0}}, Reg[163:160]};

				12'd1160: letter <= 12'h024;//$
				12'd1161: letter <= 12'h561;//a
				12'd1162: letter <= 12'h532;//2
				12'd1163: letter <= 12'h03a;//:
				12'd1165: letter <= 12'h030;//0
				12'd1166: letter <= 12'h078;//x
				12'd1167: letter <= {{8{1'b0}}, Reg[223:220]};
				12'd1168: letter <= {{8{1'b0}}, Reg[219:216]};
				12'd1169: letter <= {{8{1'b0}}, Reg[215:212]};
				12'd1170: letter <= {{8{1'b0}}, Reg[211:208]};
				12'd1171: letter <= {{8{1'b0}}, Reg[207:204]};
				12'd1172: letter <= {{8{1'b0}}, Reg[203:200]};
				12'd1173: letter <= {{8{1'b0}}, Reg[199:196]};
				12'd1174: letter <= {{8{1'b0}}, Reg[195:192]};

				12'd1180: letter <= 12'h024;//$
				12'd1181: letter <= 12'h561;//a
				12'd1182: letter <= 12'h533;//3
				12'd1183: letter <= 12'h03a;//:
				12'd1185: letter <= 12'h030;//0
				12'd1186: letter <= 12'h078;//x
				12'd1187: letter <= {{8{1'b0}}, Reg[255:252]};
				12'd1188: letter <= {{8{1'b0}}, Reg[251:248]};
				12'd1189: letter <= {{8{1'b0}}, Reg[247:244]};
				12'd1190: letter <= {{8{1'b0}}, Reg[243:240]};
				12'd1191: letter <= {{8{1'b0}}, Reg[239:236]};
				12'd1192: letter <= {{8{1'b0}}, Reg[235:232]};
				12'd1193: letter <= {{8{1'b0}}, Reg[231:228]};
				12'd1194: letter <= {{8{1'b0}}, Reg[227:224]};

				12'd1200: letter <= 12'h024;//$
				12'd1201: letter <= 12'h574;//t
				12'd1202: letter <= 12'h530;//0
				12'd1203: letter <= 12'h03a;//:
				12'd1205: letter <= 12'h030;//0
				12'd1206: letter <= 12'h078;//x
				12'd1207: letter <= {{8{1'b0}}, Reg[287:284]};
				12'd1208: letter <= {{8{1'b0}}, Reg[283:280]};
				12'd1209: letter <= {{8{1'b0}}, Reg[279:276]};
				12'd1210: letter <= {{8{1'b0}}, Reg[275:272]};
				12'd1211: letter <= {{8{1'b0}}, Reg[271:268]};
				12'd1212: letter <= {{8{1'b0}}, Reg[267:264]};
				12'd1213: letter <= {{8{1'b0}}, Reg[263:260]};
				12'd1214: letter <= {{8{1'b0}}, Reg[259:256]};

				12'd1220: letter <= 12'h024;//$t
				12'd1221: letter <= 12'h574;//t
				12'd1222: letter <= 12'h531;//1
				12'd1223: letter <= 12'h03a;//:
				12'd1225: letter <= 12'h030;//0
				12'd1226: letter <= 12'h078;//x
				12'd1227: letter <= {{8{1'b0}}, Reg[319:316]};
				12'd1228: letter <= {{8{1'b0}}, Reg[315:312]};
				12'd1229: letter <= {{8{1'b0}}, Reg[311:308]};
				12'd1230: letter <= {{8{1'b0}}, Reg[307:304]};
				12'd1231: letter <= {{8{1'b0}}, Reg[303:300]};
				12'd1232: letter <= {{8{1'b0}}, Reg[299:296]};
				12'd1233: letter <= {{8{1'b0}}, Reg[295:292]};
				12'd1234: letter <= {{8{1'b0}}, Reg[291:288]};

				12'd1240: letter <= 12'h024;//$
				12'd1241: letter <= 12'h574;//t
				12'd1242: letter <= 12'h532;//2
				12'd1243: letter <= 12'h03a;//:
				12'd1245: letter <= 12'h030;//0
				12'd1246: letter <= 12'h078;//x
				12'd1247: letter <= {{8{1'b0}}, Reg[351:348]};
				12'd1248: letter <= {{8{1'b0}}, Reg[347:344]};
				12'd1249: letter <= {{8{1'b0}}, Reg[343:340]};
				12'd1250: letter <= {{8{1'b0}}, Reg[339:336]};
				12'd1251: letter <= {{8{1'b0}}, Reg[335:332]};
				12'd1252: letter <= {{8{1'b0}}, Reg[331:328]};
				12'd1253: letter <= {{8{1'b0}}, Reg[327:324]};
				12'd1254: letter <= {{8{1'b0}}, Reg[323:320]};

				12'd1260: letter <= 12'h024;//$
				12'd1261: letter <= 12'h574;//t
				12'd1262: letter <= 12'h533;//3
				12'd1263: letter <= 12'h03a;//:
				12'd1265: letter <= 12'h030;//0
				12'd1266: letter <= 12'h078;//x
				12'd1267: letter <= {{8{1'b0}}, Reg[383:380]};
				12'd1268: letter <= {{8{1'b0}}, Reg[379:376]};
				12'd1269: letter <= {{8{1'b0}}, Reg[375:372]};
				12'd1270: letter <= {{8{1'b0}}, Reg[371:368]};
				12'd1271: letter <= {{8{1'b0}}, Reg[367:364]};
				12'd1272: letter <= {{8{1'b0}}, Reg[363:360]};
				12'd1273: letter <= {{8{1'b0}}, Reg[359:356]};
				12'd1274: letter <= {{8{1'b0}}, Reg[355:352]};

				12'd1280: letter <= 12'h024;//$
				12'd1281: letter <= 12'h574;//t
				12'd1282: letter <= 12'h534;//4
				12'd1283: letter <= 12'h03a;//:
				12'd1285: letter <= 12'h030;//0
				12'd1286: letter <= 12'h078;//x
				12'd1287: letter <= {{8{1'b0}}, Reg[415:412]};
				12'd1288: letter <= {{8{1'b0}}, Reg[411:408]};
				12'd1289: letter <= {{8{1'b0}}, Reg[407:404]};
				12'd1290: letter <= {{8{1'b0}}, Reg[403:400]};
				12'd1291: letter <= {{8{1'b0}}, Reg[399:396]};
				12'd1292: letter <= {{8{1'b0}}, Reg[395:392]};
				12'd1293: letter <= {{8{1'b0}}, Reg[391:388]};
				12'd1294: letter <= {{8{1'b0}}, Reg[387:384]};

				12'd1300: letter <= 12'h024;//$
				12'd1301: letter <= 12'h574;//t
				12'd1302: letter <= 12'h535;//5
				12'd1303: letter <= 12'h03a;//:
				12'd1305: letter <= 12'h030;//0
				12'd1306: letter <= 12'h078;//x
				12'd1307: letter <= {{8{1'b0}}, Reg[447:444]};
				12'd1308: letter <= {{8{1'b0}}, Reg[443:440]};
				12'd1309: letter <= {{8{1'b0}}, Reg[439:436]};
				12'd1310: letter <= {{8{1'b0}}, Reg[435:432]};
				12'd1311: letter <= {{8{1'b0}}, Reg[431:428]};
				12'd1312: letter <= {{8{1'b0}}, Reg[427:424]};
				12'd1313: letter <= {{8{1'b0}}, Reg[423:420]};
				12'd1314: letter <= {{8{1'b0}}, Reg[419:416]};

				12'd1320: letter <= 12'h024;//$
				12'd1321: letter <= 12'h574;//t
				12'd1322: letter <= 12'h536;//6
				12'd1323: letter <= 12'h03a;//:
				12'd1325: letter <= 12'h030;//0
				12'd1326: letter <= 12'h078;//x
				12'd1327: letter <= {{8{1'b0}}, Reg[479:476]};
				12'd1328: letter <= {{8{1'b0}}, Reg[475:472]};
				12'd1329: letter <= {{8{1'b0}}, Reg[471:468]};
				12'd1330: letter <= {{8{1'b0}}, Reg[467:464]};
				12'd1331: letter <= {{8{1'b0}}, Reg[463:460]};
				12'd1332: letter <= {{8{1'b0}}, Reg[459:456]};
				12'd1333: letter <= {{8{1'b0}}, Reg[455:452]};
				12'd1334: letter <= {{8{1'b0}}, Reg[451:448]};

				12'd1340: letter <= 12'h024;//$
				12'd1341: letter <= 12'h574;//t
				12'd1342: letter <= 12'h537;//7
				12'd1343: letter <= 12'h03a;//:
				12'd1345: letter <= 12'h030;//0
				12'd1346: letter <= 12'h078;//x
				12'd1347: letter <= {{8{1'b0}}, Reg[511:508]};
				12'd1348: letter <= {{8{1'b0}}, Reg[507:504]};
				12'd1349: letter <= {{8{1'b0}}, Reg[503:500]};
				12'd1350: letter <= {{8{1'b0}}, Reg[499:496]};
				12'd1351: letter <= {{8{1'b0}}, Reg[495:492]};
				12'd1352: letter <= {{8{1'b0}}, Reg[491:488]};
				12'd1353: letter <= {{8{1'b0}}, Reg[487:484]};
				12'd1354: letter <= {{8{1'b0}}, Reg[483:480]};

				12'd1360: letter <= 12'h024;//$
				12'd1361: letter <= 12'h573;//s
				12'd1362: letter <= 12'h530;//0
				12'd1363: letter <= 12'h03a;//:
				12'd1365: letter <= 12'h030;//0
				12'd1366: letter <= 12'h078;//x
				12'd1367: letter <= {{8{1'b0}}, Reg[543:540]};
				12'd1368: letter <= {{8{1'b0}}, Reg[539:536]};
				12'd1369: letter <= {{8{1'b0}}, Reg[535:532]};
				12'd1370: letter <= {{8{1'b0}}, Reg[531:528]};
				12'd1371: letter <= {{8{1'b0}}, Reg[527:524]};
				12'd1372: letter <= {{8{1'b0}}, Reg[523:520]};
				12'd1373: letter <= {{8{1'b0}}, Reg[519:516]};
				12'd1374: letter <= {{8{1'b0}}, Reg[515:512]};

				12'd1380: letter <= 12'h024;//$
				12'd1381: letter <= 12'h573;//s
				12'd1382: letter <= 12'h531;//1
				12'd1383: letter <= 12'h03a;//:
				12'd1385: letter <= 12'h030;//0
				12'd1386: letter <= 12'h078;//x
				12'd1387: letter <= {{8{1'b0}}, Reg[575:572]};
				12'd1388: letter <= {{8{1'b0}}, Reg[571:568]};
				12'd1389: letter <= {{8{1'b0}}, Reg[567:564]};
				12'd1390: letter <= {{8{1'b0}}, Reg[563:560]};
				12'd1391: letter <= {{8{1'b0}}, Reg[559:556]};
				12'd1392: letter <= {{8{1'b0}}, Reg[555:552]};
				12'd1393: letter <= {{8{1'b0}}, Reg[551:548]};
				12'd1394: letter <= {{8{1'b0}}, Reg[547:544]};

				12'd1400: letter <= 12'h024;//$
				12'd1401: letter <= 12'h573;//s
				12'd1402: letter <= 12'h532;//2
				12'd1403: letter <= 12'h03a;//:
				12'd1405: letter <= 12'h030;//0
				12'd1406: letter <= 12'h078;//x
				12'd1407: letter <= {{8{1'b0}}, Reg[607:604]};
				12'd1408: letter <= {{8{1'b0}}, Reg[603:600]};
				12'd1409: letter <= {{8{1'b0}}, Reg[599:596]};
				12'd1410: letter <= {{8{1'b0}}, Reg[595:592]};
				12'd1411: letter <= {{8{1'b0}}, Reg[591:588]};
				12'd1412: letter <= {{8{1'b0}}, Reg[587:584]};
				12'd1413: letter <= {{8{1'b0}}, Reg[583:580]};
				12'd1414: letter <= {{8{1'b0}}, Reg[579:576]};

				12'd1420: letter <= 12'h024;//$
				12'd1421: letter <= 12'h573;//s
				12'd1422: letter <= 12'h533;//3
				12'd1423: letter <= 12'h03a;//:
				12'd1425: letter <= 12'h030;//0
				12'd1426: letter <= 12'h078;//x
				12'd1427: letter <= {{8{1'b0}}, Reg[639:636]};
				12'd1428: letter <= {{8{1'b0}}, Reg[635:632]};
				12'd1429: letter <= {{8{1'b0}}, Reg[631:628]};
				12'd1430: letter <= {{8{1'b0}}, Reg[627:624]};
				12'd1431: letter <= {{8{1'b0}}, Reg[623:620]};
				12'd1432: letter <= {{8{1'b0}}, Reg[619:616]};
				12'd1433: letter <= {{8{1'b0}}, Reg[615:612]};
				12'd1434: letter <= {{8{1'b0}}, Reg[611:608]};

				12'd1440: letter <= 12'h024;//$
				12'd1441: letter <= 12'h573;//s
				12'd1442: letter <= 12'h534;//4
				12'd1443: letter <= 12'h03a;//:
				12'd1445: letter <= 12'h030;//0
				12'd1446: letter <= 12'h078;//x
				12'd1447: letter <= {{8{1'b0}}, Reg[671:668]};
				12'd1448: letter <= {{8{1'b0}}, Reg[667:664]};
				12'd1449: letter <= {{8{1'b0}}, Reg[663:660]};
				12'd1450: letter <= {{8{1'b0}}, Reg[659:656]};
				12'd1451: letter <= {{8{1'b0}}, Reg[655:652]};
				12'd1452: letter <= {{8{1'b0}}, Reg[651:648]};
				12'd1453: letter <= {{8{1'b0}}, Reg[647:644]};
				12'd1454: letter <= {{8{1'b0}}, Reg[643:640]};

				12'd1460: letter <= 12'h024;//$
				12'd1461: letter <= 12'h573;//s
				12'd1462: letter <= 12'h535;//5
				12'd1463: letter <= 12'h03a;//:
				12'd1465: letter <= 12'h030;//0
				12'd1466: letter <= 12'h078;//x
				12'd1467: letter <= {{8{1'b0}}, Reg[703:700]};
				12'd1468: letter <= {{8{1'b0}}, Reg[699:696]};
				12'd1469: letter <= {{8{1'b0}}, Reg[695:692]};
				12'd1470: letter <= {{8{1'b0}}, Reg[691:688]};
				12'd1471: letter <= {{8{1'b0}}, Reg[687:684]};
				12'd1472: letter <= {{8{1'b0}}, Reg[683:680]};
				12'd1473: letter <= {{8{1'b0}}, Reg[679:676]};
				12'd1474: letter <= {{8{1'b0}}, Reg[675:672]};

				12'd1480: letter <= 12'h024;//$
				12'd1481: letter <= 12'h573;//s
				12'd1482: letter <= 12'h536;//6
				12'd1483: letter <= 12'h03a;//:
				12'd1485: letter <= 12'h030;//0
				12'd1486: letter <= 12'h078;//x
				12'd1487: letter <= {{8{1'b0}}, Reg[735:732]};
				12'd1488: letter <= {{8{1'b0}}, Reg[731:728]};
				12'd1489: letter <= {{8{1'b0}}, Reg[727:724]};
				12'd1490: letter <= {{8{1'b0}}, Reg[723:720]};
				12'd1491: letter <= {{8{1'b0}}, Reg[719:716]};
				12'd1492: letter <= {{8{1'b0}}, Reg[715:712]};
				12'd1493: letter <= {{8{1'b0}}, Reg[711:708]};
				12'd1494: letter <= {{8{1'b0}}, Reg[707:704]};

				12'd1500: letter <= 12'h024;//$
				12'd1501: letter <= 12'h573;//s
				12'd1502: letter <= 12'h537;//7
				12'd1503: letter <= 12'h03a;//:
				12'd1505: letter <= 12'h030;//0
				12'd1506: letter <= 12'h078;//x
				12'd1507: letter <= {{8{1'b0}}, Reg[767:764]};
				12'd1508: letter <= {{8{1'b0}}, Reg[763:760]};
				12'd1509: letter <= {{8{1'b0}}, Reg[759:756]};
				12'd1510: letter <= {{8{1'b0}}, Reg[755:752]};
				12'd1511: letter <= {{8{1'b0}}, Reg[751:748]};
				12'd1512: letter <= {{8{1'b0}}, Reg[747:744]};
				12'd1513: letter <= {{8{1'b0}}, Reg[743:740]};
				12'd1514: letter <= {{8{1'b0}}, Reg[739:736]};

				12'd1520: letter <= 12'h024;//$
				12'd1521: letter <= 12'h574;//t
				12'd1522: letter <= 12'h538;//8
				12'd1523: letter <= 12'h03a;//:
				12'd1525: letter <= 12'h030;//0
				12'd1526: letter <= 12'h078;//x
				12'd1527: letter <= {{8{1'b0}}, Reg[799:796]};
				12'd1528: letter <= {{8{1'b0}}, Reg[795:792]};
				12'd1529: letter <= {{8{1'b0}}, Reg[791:788]};
				12'd1530: letter <= {{8{1'b0}}, Reg[787:784]};
				12'd1531: letter <= {{8{1'b0}}, Reg[783:780]};
				12'd1532: letter <= {{8{1'b0}}, Reg[779:776]};
				12'd1533: letter <= {{8{1'b0}}, Reg[775:772]};
				12'd1534: letter <= {{8{1'b0}}, Reg[771:768]};

				12'd1540: letter <= 12'h024;//$
				12'd1541: letter <= 12'h574;//t
				12'd1542: letter <= 12'h539;//9
				12'd1543: letter <= 12'h03a;//:
				12'd1545: letter <= 12'h030;//0
				12'd1546: letter <= 12'h078;//x
				12'd1547: letter <= {{8{1'b0}}, Reg[831:828]};
				12'd1548: letter <= {{8{1'b0}}, Reg[827:824]};
				12'd1549: letter <= {{8{1'b0}}, Reg[823:820]};
				12'd1550: letter <= {{8{1'b0}}, Reg[819:816]};
				12'd1551: letter <= {{8{1'b0}}, Reg[815:812]};
				12'd1552: letter <= {{8{1'b0}}, Reg[811:808]};
				12'd1553: letter <= {{8{1'b0}}, Reg[807:804]};
				12'd1554: letter <= {{8{1'b0}}, Reg[803:800]};

				12'd1560: letter <= 12'h024;//$
				12'd1561: letter <= 12'h56b;//k
				12'd1562: letter <= 12'h530;//0
				12'd1563: letter <= 12'h03a;//:
				12'd1565: letter <= 12'h030;//0
				12'd1566: letter <= 12'h078;//x
				12'd1567: letter <= {{8{1'b0}}, Reg[863:860]};
				12'd1568: letter <= {{8{1'b0}}, Reg[859:856]};
				12'd1569: letter <= {{8{1'b0}}, Reg[855:852]};
				12'd1570: letter <= {{8{1'b0}}, Reg[851:848]};
				12'd1571: letter <= {{8{1'b0}}, Reg[847:844]};
				12'd1572: letter <= {{8{1'b0}}, Reg[843:840]};
				12'd1573: letter <= {{8{1'b0}}, Reg[839:836]};
				12'd1574: letter <= {{8{1'b0}}, Reg[835:832]};

				12'd1580: letter <= 12'h024;//$
				12'd1581: letter <= 12'h56b;//k
				12'd1582: letter <= 12'h531;//1
				12'd1583: letter <= 12'h03a;//:
				12'd1585: letter <= 12'h030;//0
				12'd1586: letter <= 12'h078;//x
				12'd1587: letter <= {{8{1'b0}}, Reg[895:892]};
				12'd1588: letter <= {{8{1'b0}}, Reg[891:888]};
				12'd1589: letter <= {{8{1'b0}}, Reg[887:884]};
				12'd1590: letter <= {{8{1'b0}}, Reg[883:880]};
				12'd1591: letter <= {{8{1'b0}}, Reg[879:876]};
				12'd1592: letter <= {{8{1'b0}}, Reg[875:872]};
				12'd1593: letter <= {{8{1'b0}}, Reg[871:868]};
				12'd1594: letter <= {{8{1'b0}}, Reg[867:864]};

				12'd1600: letter <= 12'h024;//$
				12'd1601: letter <= 12'h567;//g
				12'd1602: letter <= 12'h570;//p
				12'd1603: letter <= 12'h03a;//:
				12'd1605: letter <= 12'h030;//0
				12'd1606: letter <= 12'h078;//x
				12'd1607: letter <= {{8{1'b0}}, Reg[927:924]};
				12'd1608: letter <= {{8{1'b0}}, Reg[923:920]};
				12'd1609: letter <= {{8{1'b0}}, Reg[919:916]};
				12'd1610: letter <= {{8{1'b0}}, Reg[915:912]};
				12'd1611: letter <= {{8{1'b0}}, Reg[911:908]};
				12'd1612: letter <= {{8{1'b0}}, Reg[907:904]};
				12'd1613: letter <= {{8{1'b0}}, Reg[903:900]};
				12'd1614: letter <= {{8{1'b0}}, Reg[899:896]};

				12'd1620: letter <= 12'h024;//$
				12'd1621: letter <= 12'h573;//s
				12'd1622: letter <= 12'h570;//p
				12'd1623: letter <= 12'h03a;//:
				12'd1625: letter <= 12'h030;//0
				12'd1626: letter <= 12'h078;//x
				12'd1627: letter <= {{8{1'b0}}, Reg[959:956]};
				12'd1628: letter <= {{8{1'b0}}, Reg[955:952]};
				12'd1629: letter <= {{8{1'b0}}, Reg[951:948]};
				12'd1630: letter <= {{8{1'b0}}, Reg[947:944]};
				12'd1631: letter <= {{8{1'b0}}, Reg[943:940]};
				12'd1632: letter <= {{8{1'b0}}, Reg[939:936]};
				12'd1633: letter <= {{8{1'b0}}, Reg[935:932]};
				12'd1634: letter <= {{8{1'b0}}, Reg[931:928]};

				12'd1640: letter <= 12'h024;//$
				12'd1641: letter <= 12'h566;//f
				12'd1642: letter <= 12'h570;//p
				12'd1643: letter <= 12'h03a;//:
				12'd1645: letter <= 12'h030;//0
				12'd1646: letter <= 12'h078;//x
				12'd1647: letter <= {{8{1'b0}}, Reg[991:988]};
				12'd1648: letter <= {{8{1'b0}}, Reg[987:984]};
				12'd1649: letter <= {{8{1'b0}}, Reg[983:980]};
				12'd1650: letter <= {{8{1'b0}}, Reg[979:976]};
				12'd1651: letter <= {{8{1'b0}}, Reg[975:972]};
				12'd1652: letter <= {{8{1'b0}}, Reg[971:968]};
				12'd1653: letter <= {{8{1'b0}}, Reg[967:964]};
				12'd1654: letter <= {{8{1'b0}}, Reg[963:960]};

				12'd1660: letter <= 12'h024;//$
				12'd1661: letter <= 12'h572;//r
				12'd1662: letter <= 12'h561;//a
				12'd1663: letter <= 12'h03a;//:
				12'd1665: letter <= 12'h030;//0
				12'd1666: letter <= 12'h078;//x
				12'd1667: letter <= {{8{1'b0}}, Reg[1023:1020]};
				12'd1668: letter <= {{8{1'b0}}, Reg[1019:1016]};
				12'd1669: letter <= {{8{1'b0}}, Reg[1015:1012]};
				12'd1670: letter <= {{8{1'b0}}, Reg[1011:1008]};
				12'd1671: letter <= {{8{1'b0}}, Reg[1007:1004]};
				12'd1672: letter <= {{8{1'b0}}, Reg[1003:1000]};
				12'd1673: letter <= {{8{1'b0}}, Reg[999:996]};
				12'd1674: letter <= {{8{1'b0}}, Reg[995:992]};

				
				12'd1840: letter <= 12'h443;//C
				12'd1841: letter <= 12'h461;//a
				12'd1842: letter <= 12'h475;//u
				12'd1843: letter <= 12'h473;//s
				12'd1844: letter <= 12'h465;//e
				12'd1845: letter <= 12'h03a;//:
				
				12'd1920: letter <= {{11{1'b0}}, Cause[31]};
				12'd1921: letter <= {{11{1'b0}}, Cause[30]};
				12'd1922: letter <= {{11{1'b0}}, Cause[29]};
				12'd1923: letter <= {{11{1'b0}}, Cause[28]};

				

				12'd1925: letter <= {{11{1'b0}}, Cause[27]};
				12'd1926: letter <= {{11{1'b0}}, Cause[26]};
				12'd1927: letter <= {{11{1'b0}}, Cause[25]};
				12'd1928: letter <= {{11{1'b0}}, Cause[24]};

				

				12'd1930: letter <= {{11{1'b0}}, Cause[23]};
				12'd1931: letter <= {{11{1'b0}}, Cause[22]};
				12'd1932: letter <= {{11{1'b0}}, Cause[21]};
				12'd1933: letter <= {{11{1'b0}}, Cause[20]};

				

				12'd1935: letter <= {{11{1'b0}}, Cause[19]};
				12'd1936: letter <= {{11{1'b0}}, Cause[18]};
				12'd1937: letter <= {{11{1'b0}}, Cause[17]};
				12'd1938: letter <= {{11{1'b0}}, Cause[16]};

				

				12'd1940: letter <= {{11{1'b0}}, Cause[15]};
				12'd1941: letter <= {{11{1'b0}}, Cause[14]};
				12'd1942: letter <= {{11{1'b0}}, Cause[13]};
				12'd1943: letter <= {{11{1'b0}}, Cause[12]};

				

				12'd1945: letter <= {{11{1'b0}}, Cause[11]};
				12'd1946: letter <= {{11{1'b0}}, Cause[10]};
				12'd1947: letter <= {{11{1'b0}}, Cause[9]};
				12'd1948: letter <= {{11{1'b0}}, Cause[8]};

				

				12'd1950: letter <= {{11{1'b0}}, Cause[7]};
				12'd1951: letter <= {{11{1'b0}}, Cause[6]};
				12'd1952: letter <= {{11{1'b0}}, Cause[5]};
				12'd1953: letter <= {{11{1'b0}}, Cause[4]};

				

				12'd1955: letter <= {{11{1'b0}}, Cause[3]};
				12'd1956: letter <= {{11{1'b0}}, Cause[2]};
				12'd1957: letter <= {{11{1'b0}}, Cause[1]};
				12'd1958: letter <= {{11{1'b0}}, Cause[0]};

				
				12'd2080: letter <= 12'h453;//S
				12'd2081: letter <= 12'h474;//t
				12'd2082: letter <= 12'h461;//a
				12'd2083: letter <= 12'h474;//t
				12'd2084: letter <= 12'h475;//u
				12'd2085: letter <= 12'h473;//s
				12'd2086: letter <= 12'h03a;//:

				
				12'd2160: letter <= {{11{1'b0}}, Status[31]};
				12'd2161: letter <= {{11{1'b0}}, Status[30]};
				12'd2162: letter <= {{11{1'b0}}, Status[29]};
				12'd2163: letter <= {{11{1'b0}}, Status[28]};

				

				12'd2165: letter <= {{11{1'b0}}, Status[27]};
				12'd2166: letter <= {{11{1'b0}}, Status[26]};
				12'd2167: letter <= {{11{1'b0}}, Status[25]};
				12'd2168: letter <= {{11{1'b0}}, Status[24]};

	

				12'd2170: letter <= {{11{1'b0}}, Status[23]};
				12'd2171: letter <= {{11{1'b0}}, Status[22]};
				12'd2172: letter <= {{11{1'b0}}, Status[21]};
				12'd2173: letter <= {{11{1'b0}}, Status[20]};

				

				12'd2175: letter <= {{11{1'b0}}, Status[19]};
				12'd2176: letter <= {{11{1'b0}}, Status[18]};
				12'd2177: letter <= {{11{1'b0}}, Status[17]};
				12'd2178: letter <= {{11{1'b0}}, Status[16]};

				

				12'd2180: letter <= {{11{1'b0}}, Status[15]};
				12'd2181: letter <= {{11{1'b0}}, Status[14]};
				12'd2182: letter <= {{11{1'b0}}, Status[13]};
				12'd2183: letter <= {{11{1'b0}}, Status[12]};

				

				12'd2185: letter <= {{11{1'b0}}, Status[11]};
				12'd2186: letter <= {{11{1'b0}}, Status[10]};
				12'd2187: letter <= {{11{1'b0}}, Status[9]};
				12'd2188: letter <= {{11{1'b0}}, Status[8]};

				
				12'd2190: letter <= {{11{1'b0}}, Status[7]};
				12'd2191: letter <= {{11{1'b0}}, Status[6]};
				12'd2192: letter <= {{11{1'b0}}, Status[5]};
				12'd2193: letter <= {{11{1'b0}}, Status[4]};

				

				12'd2195: letter <= {{11{1'b0}}, Status[3]};
				12'd2196: letter <= {{11{1'b0}}, Status[2]};
				12'd2197: letter <= {{11{1'b0}}, Status[1]};
				12'd2198: letter <= {{11{1'b0}}, Status[0]};

				default: letter <= 12'h020;
			endcase
		end
	end

	always @ (*) begin
		if(BorF) begin
			case(letter[11:8])
				4'h0: color <= 12'hfff; // white
				4'h1: color <= 12'h00f; // red
				4'h2: color <= 12'h0f0; // green
				4'h3: color <= 12'hf00; // blue
				4'h4: color <= 12'hff0; // yellow
				4'h5: color <= 12'h6af; // sandybrown
			endcase
		end
		else begin
			color <= 12'h000;	
		end
	end

	FONT1	     FONT1(
	                .clka(clk),
                    .addra({letter[7:0], bit_addr}),
				    .douta(BorF)
				    );


endmodule
