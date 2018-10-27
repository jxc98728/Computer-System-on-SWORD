`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2018 05:13:22 PM
// Design Name: 
// Module Name: Display
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
`timescale 1ns / 1ps

module Flicker_MUSER_SWORD(flash_clk, 
                           LE, 
                           LE_OUT);

    input flash_clk;
    input LE;
   output LE_OUT;
   
   
   AND2  XLXI_2 (.I0(flash_clk), 
                .I1(LE), 
                .O(LE_OUT));
endmodule
`timescale 1ns / 1ps

module MC14495_ZJU_MUSER_SWORD(D_0, 
                               D_1, 
                               D_2, 
                               D_3, 
                               LE, 
                               Point, 
                               a, 
                               b, 
                               c, 
                               d, 
                               e, 
                               f, 
                               g, 
                               p);

    input D_0;
    input D_1;
    input D_2;
    input D_3;
    input LE;
    input Point;
   output a;
   output b;
   output c;
   output d;
   output e;
   output f;
   output g;
   output p;
   
   wire D2;
   wire XLXN_43;
   wire XLXN_51;
   wire XLXN_53;
   wire XLXN_54;
   wire XLXN_55;
   wire XLXN_56;
   wire XLXN_57;
   wire XLXN_58;
   wire XLXN_61;
   wire XLXN_62;
   wire XLXN_63;
   wire XLXN_64;
   wire XLXN_65;
   wire XLXN_66;
   wire XLXN_67;
   wire XLXN_68;
   wire XLXN_72;
   wire XLXN_73;
   wire XLXN_74;
   wire XLXN_76;
   wire XLXN_77;
   wire XLXN_78;
   wire XLXN_80;
   wire XLXN_81;
   wire XLXN_82;
   wire XLXN_83;
   wire XLXN_84;
   wire XLXN_85;
   wire XLXN_86;
   wire XLXN_105;
   wire XLXN_117;
   
   INV  XLXI_1 (.I(D_1), 
               .O(XLXN_43));
   INV  XLXI_3 (.I(D_3), 
               .O(XLXN_105));
   INV  XLXI_4 (.I(D_0), 
               .O(XLXN_117));
   AND4  XLXI_5 (.I0(D_0), 
                .I1(D2), 
                .I2(XLXN_43), 
                .I3(XLXN_105), 
                .O(XLXN_51));
   AND4  XLXI_6 (.I0(XLXN_117), 
                .I1(XLXN_43), 
                .I2(D_2), 
                .I3(XLXN_105), 
                .O(XLXN_63));
   AND4  XLXI_7 (.I0(D_0), 
                .I1(XLXN_43), 
                .I2(D_2), 
                .I3(D_3), 
                .O(XLXN_53));
   AND4  XLXI_8 (.I0(D_0), 
                .I1(D_1), 
                .I2(D2), 
                .I3(D_3), 
                .O(XLXN_54));
   AND4  XLXI_9 (.I0(D_0), 
                .I1(XLXN_43), 
                .I2(D_2), 
                .I3(XLXN_105), 
                .O(XLXN_55));
   AND3  XLXI_10 (.I0(XLXN_117), 
                 .I1(D_1), 
                 .I2(D_2), 
                 .O(XLXN_56));
   AND3  XLXI_11 (.I0(XLXN_117), 
                 .I1(D_2), 
                 .I2(D_3), 
                 .O(XLXN_57));
   AND3  XLXI_12 (.I0(D_0), 
                 .I1(D_1), 
                 .I2(D_3), 
                 .O(XLXN_58));
   AND3  XLXI_13 (.I0(D_1), 
                 .I1(D_2), 
                 .I2(D_3), 
                 .O(XLXN_62));
   AND3  XLXI_14 (.I0(D_0), 
                 .I1(D_1), 
                 .I2(D_2), 
                 .O(XLXN_64));
   AND4  XLXI_15 (.I0(XLXN_117), 
                 .I1(D_1), 
                 .I2(D2), 
                 .I3(D_3), 
                 .O(XLXN_65));
   AND4  XLXI_16 (.I0(XLXN_117), 
                 .I1(D_1), 
                 .I2(D2), 
                 .I3(XLXN_105), 
                 .O(XLXN_61));
   AND4  XLXI_17 (.I0(XLXN_117), 
                 .I1(XLXN_43), 
                 .I2(D_2), 
                 .I3(D_3), 
                 .O(XLXN_74));
   AND4  XLXI_18 (.I0(D_0), 
                 .I1(D_1), 
                 .I2(D_2), 
                 .I3(XLXN_105), 
                 .O(XLXN_73));
   AND3  XLXI_19 (.I0(D_0), 
                 .I1(D_1), 
                 .I2(XLXN_105), 
                 .O(XLXN_76));
   AND3  XLXI_20 (.I0(D_0), 
                 .I1(D2), 
                 .I2(XLXN_105), 
                 .O(XLXN_78));
   AND3  XLXI_21 (.I0(XLXN_43), 
                 .I1(D2), 
                 .I2(XLXN_105), 
                 .O(XLXN_72));
   AND3  XLXI_22 (.I0(D_1), 
                 .I1(D2), 
                 .I2(XLXN_105), 
                 .O(XLXN_77));
   AND3  XLXI_23 (.I0(D_0), 
                 .I1(XLXN_43), 
                 .I2(D2), 
                 .O(XLXN_68));
   AND3  XLXI_24 (.I0(XLXN_43), 
                 .I1(D_2), 
                 .I2(XLXN_105), 
                 .O(XLXN_67));
   AND2  XLXI_25 (.I0(D_0), 
                 .I1(XLXN_105), 
                 .O(XLXN_66));
   OR4  XLXI_26 (.I0(XLXN_54), 
                .I1(XLXN_53), 
                .I2(XLXN_63), 
                .I3(XLXN_51), 
                .O(XLXN_80));
   OR4  XLXI_27 (.I0(XLXN_58), 
                .I1(XLXN_57), 
                .I2(XLXN_56), 
                .I3(XLXN_55), 
                .O(XLXN_81));
   OR4  XLXI_28 (.I0(XLXN_65), 
                .I1(XLXN_64), 
                .I2(XLXN_63), 
                .I3(XLXN_51), 
                .O(XLXN_83));
   OR3  XLXI_29 (.I0(XLXN_74), 
                .I1(XLXN_73), 
                .I2(XLXN_72), 
                .O(XLXN_86));
   OR3  XLXI_30 (.I0(XLXN_68), 
                .I1(XLXN_67), 
                .I2(XLXN_66), 
                .O(XLXN_84));
   OR3  XLXI_31 (.I0(XLXN_62), 
                .I1(XLXN_61), 
                .I2(XLXN_57), 
                .O(XLXN_82));
   OR4  XLXI_32 (.I0(XLXN_76), 
                .I1(XLXN_77), 
                .I2(XLXN_78), 
                .I3(XLXN_53), 
                .O(XLXN_85));
   OR2  XLXI_33 (.I0(LE), 
                .I1(XLXN_80), 
                .O(a));
   OR2  XLXI_34 (.I0(LE), 
                .I1(XLXN_81), 
                .O(b));
   OR2  XLXI_35 (.I0(LE), 
                .I1(XLXN_82), 
                .O(c));
   OR2  XLXI_36 (.I0(LE), 
                .I1(XLXN_83), 
                .O(d));
   OR2  XLXI_37 (.I0(LE), 
                .I1(XLXN_84), 
                .O(e));
   OR2  XLXI_38 (.I0(LE), 
                .I1(XLXN_85), 
                .O(f));
   OR2  XLXI_39 (.I0(LE), 
                .I1(XLXN_86), 
                .O(g));
   INV  XLXI_40 (.I(Point), 
                .O(p));
   INV  XLXI_42 (.I(D_2), 
                .O(D2));
endmodule
`timescale 1ns / 1ps

module MUX441_sch_MUSER_SWORD(I0, 
                              I1, 
                              I2, 
                              I3, 
                              s, 
                              o);

    input [3:0] I0;
    input [3:0] I1;
    input [3:0] I2;
    input [3:0] I3;
    input [1:0] s;
   output [3:0] o;
   
   wire XLXN_5;
   wire XLXN_7;
   wire XLXN_19;
   wire XLXN_20;
   wire XLXN_22;
   wire XLXN_23;
   wire XLXN_40;
   wire XLXN_41;
   wire XLXN_42;
   wire XLXN_44;
   wire XLXN_55;
   wire XLXN_56;
   wire XLXN_57;
   wire XLXN_59;
   wire XLXN_84;
   wire XLXN_85;
   wire XLXN_86;
   wire XLXN_88;
   wire XLXN_141;
   wire XLXN_144;
   wire XLXN_147;
   wire XLXN_150;
   
   INV  XLXI_1 (.I(s[1]), 
               .O(XLXN_5));
   INV  XLXI_2 (.I(s[0]), 
               .O(XLXN_7));
   AND2  XLXI_3 (.I0(XLXN_7), 
                .I1(XLXN_5), 
                .O(XLXN_141));
   AND2  XLXI_4 (.I0(s[0]), 
                .I1(XLXN_5), 
                .O(XLXN_144));
   AND2  XLXI_5 (.I0(s[1]), 
                .I1(XLXN_7), 
                .O(XLXN_147));
   AND2  XLXI_6 (.I0(s[1]), 
                .I1(s[0]), 
                .O(XLXN_150));
   AND2  XLXI_7 (.I0(I0[0]), 
                .I1(XLXN_141), 
                .O(XLXN_19));
   AND2  XLXI_8 (.I0(I1[0]), 
                .I1(XLXN_144), 
                .O(XLXN_20));
   AND2  XLXI_9 (.I0(I2[0]), 
                .I1(XLXN_147), 
                .O(XLXN_22));
   AND2  XLXI_10 (.I0(I3[0]), 
                 .I1(XLXN_150), 
                 .O(XLXN_23));
   OR4  XLXI_11 (.I0(XLXN_23), 
                .I1(XLXN_22), 
                .I2(XLXN_20), 
                .I3(XLXN_19), 
                .O(o[0]));
   AND2  XLXI_17 (.I0(I3[1]), 
                 .I1(XLXN_150), 
                 .O(XLXN_41));
   AND2  XLXI_18 (.I0(I0[1]), 
                 .I1(XLXN_141), 
                 .O(XLXN_40));
   AND2  XLXI_19 (.I0(I1[1]), 
                 .I1(XLXN_144), 
                 .O(XLXN_42));
   AND2  XLXI_20 (.I0(I2[1]), 
                 .I1(XLXN_147), 
                 .O(XLXN_44));
   OR4  XLXI_21 (.I0(XLXN_41), 
                .I1(XLXN_44), 
                .I2(XLXN_42), 
                .I3(XLXN_40), 
                .O(o[1]));
   AND2  XLXI_32 (.I0(I3[2]), 
                 .I1(XLXN_150), 
                 .O(XLXN_56));
   AND2  XLXI_33 (.I0(I0[2]), 
                 .I1(XLXN_141), 
                 .O(XLXN_55));
   AND2  XLXI_34 (.I0(I1[2]), 
                 .I1(XLXN_144), 
                 .O(XLXN_57));
   AND2  XLXI_35 (.I0(I2[2]), 
                 .I1(XLXN_147), 
                 .O(XLXN_59));
   OR4  XLXI_36 (.I0(XLXN_56), 
                .I1(XLXN_59), 
                .I2(XLXN_57), 
                .I3(XLXN_55), 
                .O(o[2]));
   AND2  XLXI_58 (.I0(I3[3]), 
                 .I1(XLXN_150), 
                 .O(XLXN_85));
   AND2  XLXI_59 (.I0(I0[3]), 
                 .I1(XLXN_141), 
                 .O(XLXN_84));
   AND2  XLXI_60 (.I0(I1[3]), 
                 .I1(XLXN_144), 
                 .O(XLXN_86));
   AND2  XLXI_61 (.I0(I2[3]), 
                 .I1(XLXN_147), 
                 .O(XLXN_88));
   OR4  XLXI_62 (.I0(XLXN_85), 
                .I1(XLXN_88), 
                .I2(XLXN_86), 
                .I3(XLXN_84), 
                .O(o[3]));
endmodule
`timescale 1ns / 1ps

module MUX8T1_8_MUSER_SWORD(I0, 
                            I1, 
                            I2, 
                            I3, 
                            I4, 
                            I5, 
                            I6, 
                            I7, 
                            s, 
                            o);

    input [7:0] I0;
    input [7:0] I1;
    input [7:0] I2;
    input [7:0] I3;
    input [7:0] I4;
    input [7:0] I5;
    input [7:0] I6;
    input [7:0] I7;
    input [2:0] s;
   output [7:0] o;
   
   wire [3:0] o0;
   wire [3:0] o1;
   wire [3:0] o2;
   wire [3:0] o3;
   wire XLXN_48;
   wire XLXN_52;
   wire XLXN_79;
   wire XLXN_80;
   wire XLXN_81;
   wire XLXN_82;
   wire XLXN_87;
   wire XLXN_88;
   wire XLXN_89;
   wire XLXN_90;
   wire XLXN_91;
   wire XLXN_92;
   wire XLXN_93;
   wire XLXN_94;
   wire XLXN_95;
   wire XLXN_96;
   wire XLXN_254;
   
   MUX441_sch_MUSER_SWORD  XLXI_3 (.I0(I0[7:4]), 
                                  .I1(I1[7:4]), 
                                  .I2(I2[7:4]), 
                                  .I3(I3[7:4]), 
                                  .s(s[1:0]), 
                                  .o(o2[3:0]));
   MUX441_sch_MUSER_SWORD  XLXI_4 (.I0(I4[7:4]), 
                                  .I1(I5[7:4]), 
                                  .I2(I6[7:4]), 
                                  .I3(I7[7:4]), 
                                  .s(s[1:0]), 
                                  .o(o3[3:0]));
   INV  XLXI_9 (.I(s[2]), 
               .O(XLXN_254));
   AND2  XLXI_10 (.I0(XLXN_254), 
                 .I1(o0[0]), 
                 .O(XLXN_52));
   AND2  XLXI_11 (.I0(s[2]), 
                 .I1(o1[0]), 
                 .O(XLXN_48));
   OR2  XLXI_12 (.I0(XLXN_52), 
                .I1(XLXN_48), 
                .O(o[0]));
   OR2  XLXI_19 (.I0(XLXN_80), 
                .I1(XLXN_79), 
                .O(o[1]));
   AND2  XLXI_20 (.I0(XLXN_254), 
                 .I1(o0[1]), 
                 .O(XLXN_80));
   AND2  XLXI_21 (.I0(s[2]), 
                 .I1(o1[1]), 
                 .O(XLXN_79));
   OR2  XLXI_22 (.I0(XLXN_82), 
                .I1(XLXN_81), 
                .O(o[2]));
   AND2  XLXI_23 (.I0(XLXN_254), 
                 .I1(o0[2]), 
                 .O(XLXN_82));
   AND2  XLXI_24 (.I0(s[2]), 
                 .I1(o1[2]), 
                 .O(XLXN_81));
   OR2  XLXI_31 (.I0(XLXN_88), 
                .I1(XLXN_87), 
                .O(o[3]));
   AND2  XLXI_32 (.I0(XLXN_254), 
                 .I1(o0[3]), 
                 .O(XLXN_88));
   AND2  XLXI_33 (.I0(s[2]), 
                 .I1(o1[3]), 
                 .O(XLXN_87));
   OR2  XLXI_34 (.I0(XLXN_90), 
                .I1(XLXN_89), 
                .O(o[4]));
   AND2  XLXI_35 (.I0(XLXN_254), 
                 .I1(o2[0]), 
                 .O(XLXN_90));
   AND2  XLXI_36 (.I0(s[2]), 
                 .I1(o3[0]), 
                 .O(XLXN_89));
   OR2  XLXI_37 (.I0(XLXN_92), 
                .I1(XLXN_91), 
                .O(o[5]));
   AND2  XLXI_38 (.I0(XLXN_254), 
                 .I1(o2[1]), 
                 .O(XLXN_92));
   AND2  XLXI_39 (.I0(s[2]), 
                 .I1(o3[1]), 
                 .O(XLXN_91));
   OR2  XLXI_40 (.I0(XLXN_94), 
                .I1(XLXN_93), 
                .O(o[6]));
   AND2  XLXI_41 (.I0(XLXN_254), 
                 .I1(o2[2]), 
                 .O(XLXN_94));
   AND2  XLXI_42 (.I0(s[2]), 
                 .I1(o3[2]), 
                 .O(XLXN_93));
   OR2  XLXI_43 (.I0(XLXN_96), 
                .I1(XLXN_95), 
                .O(o[7]));
   AND2  XLXI_44 (.I0(XLXN_254), 
                 .I1(o2[3]), 
                 .O(XLXN_96));
   AND2  XLXI_45 (.I0(s[2]), 
                 .I1(o3[3]), 
                 .O(XLXN_95));
   MUX441_sch_MUSER_SWORD  XLXI_46 (.I0(I0[3:0]), 
                                   .I1(I1[3:0]), 
                                   .I2(I2[3:0]), 
                                   .I3(I3[3:0]), 
                                   .s(s[1:0]), 
                                   .o(o0[3:0]));
   MUX441_sch_MUSER_SWORD  XLXI_47 (.I0(I4[3:0]), 
                                   .I1(I5[3:0]), 
                                   .I2(I6[3:0]), 
                                   .I3(I7[3:0]), 
                                   .s(s[1:0]), 
                                   .o(o1[3:0]));
endmodule
`timescale 1ns / 1ps

module ScanSync_MUSER_SWORD(Hexs, 
                            LES, 
                            point, 
                            Scan, 
                            AN, 
                            Hexo, 
                            LE, 
                            p);

    input [31:0] Hexs;
    input [7:0] LES;
    input [7:0] point;
    input [2:0] Scan;
   output [3:0] AN;
   output [3:0] Hexo;
   output LE;
   output p;
   
   wire [7:0] COM;
   wire G0;
   wire [7:0] Hex;
   wire V5;
   
   MUX8T1_8_MUSER_SWORD  XLXI_1 (.I0({LES[0], point[0], G0, G0, V5, V5, V5, 
         G0}), 
                                .I1({LES[1], point[1], G0, G0, V5, V5, G0, 
         V5}), 
                                .I2({LES[2], point[2], G0, G0, V5, G0, V5, 
         V5}), 
                                .I3({LES[3], point[3], G0, G0, G0, V5, V5, 
         V5}), 
                                .I4({LES[4], point[4], G0, G0, V5, V5, V5, 
         G0}), 
                                .I5({LES[5], point[5], G0, G0, V5, V5, G0, 
         V5}), 
                                .I6({LES[6], point[6], G0, G0, V5, G0, V5, 
         V5}), 
                                .I7({LES[7], point[7], G0, G0, G0, V5, V5, 
         V5}), 
                                .s(Scan[2:0]), 
                                .o(COM[7:0]));
   MUX8T1_8_MUSER_SWORD  XLXI_2 (.I0({Hexs[3:0], G0, G0, G0, G0}), 
                                .I1({Hexs[7:4], G0, G0, G0, G0}), 
                                .I2({Hexs[11:8], G0, G0, G0, G0}), 
                                .I3({Hexs[15:12], G0, G0, G0, G0}), 
                                .I4({Hexs[19:16], G0, G0, G0, G0}), 
                                .I5({Hexs[23:20], G0, G0, G0, G0}), 
                                .I6({Hexs[27:24], G0, G0, G0, G0}), 
                                .I7({Hexs[31:28], G0, G0, G0, G0}), 
                                .s(Scan[2:0]), 
                                .o(Hex[7:0]));
   VCC  XLXI_9 (.P(V5));
   GND  XLXI_11 (.G(G0));
   BUF  XLXI_12 (.I(Hex[7]), 
                .O(Hexo[3]));
   BUF  XLXI_13 (.I(Hex[6]), 
                .O(Hexo[2]));
   BUF  XLXI_14 (.I(Hex[5]), 
                .O(Hexo[1]));
   BUF  XLXI_15 (.I(Hex[4]), 
                .O(Hexo[0]));
   BUF  XLXI_18 (.I(COM[3]), 
                .O(AN[3]));
   BUF  XLXI_19 (.I(COM[2]), 
                .O(AN[2]));
   BUF  XLXI_20 (.I(COM[1]), 
                .O(AN[1]));
   BUF  XLXI_21 (.I(COM[0]), 
                .O(AN[0]));
   BUF  XLXI_26 (.I(COM[7]), 
                .O(LE));
   BUF  XLXI_27 (.I(COM[6]), 
                .O(p));
endmodule
`timescale 1ns / 1ps

module Seg7_Dev_MUSER_SWORD(flash, 
                            Hexs, 
                            LES, 
                            point, 
                            Scan, 
                            SW0, 
                            AN, 
                            SEGMENT);

    input flash;
    input [31:0] Hexs;
    input [7:0] LES;
    input [7:0] point;
    input [2:0] Scan;
    input SW0;
   output [3:0] AN;
   output [7:0] SEGMENT;
   
   wire [3:0] Hex;
   wire [7:0] SEG_TXT;
   wire XLXN_7;
   wire [7:0] XLXN_24;
   wire XLXN_27;
   wire XLXN_28;
   
   ScanSync_MUSER_SWORD  XLXI_1 (.Hexs(Hexs[31:0]), 
                                .LES(LES[7:0]), 
                                .point(point[7:0]), 
                                .Scan(Scan[2:0]), 
                                .AN(AN[3:0]), 
                                .Hexo(Hex[3:0]), 
                                .LE(XLXN_7), 
                                .p(XLXN_27));
   MC14495_ZJU_MUSER_SWORD  XLXI_2 (.D_0(Hex[0]), 
                                   .D_1(Hex[1]), 
                                   .D_2(Hex[2]), 
                                   .D_3(Hex[3]), 
                                   .LE(XLXN_28), 
                                   .Point(XLXN_27), 
                                   .a(SEG_TXT[0]), 
                                   .b(SEG_TXT[1]), 
                                   .c(SEG_TXT[2]), 
                                   .d(SEG_TXT[3]), 
                                   .e(SEG_TXT[4]), 
                                   .f(SEG_TXT[5]), 
                                   .g(SEG_TXT[6]), 
                                   .p(SEG_TXT[7]));
   Flicker_MUSER_SWORD  XLXI_14 (.flash_clk(flash), 
                                .LE(XLXN_7), 
                                .LE_OUT(XLXN_28));
   Seg_map  XLXI_16 (.Hexs(Hexs[31:0]), 
                    .Scan(Scan[2:0]), 
                    .Seg_map(XLXN_24[7:0]));
   MUX2T1_8  XLXI_17 (.a(XLXN_24[7:0]), 
                     .b(SEG_TXT[7:0]), 
                     .sel(SW0), 
                     .o(SEGMENT[7:0]));
endmodule
`timescale 1ns / 1ps

module Display_MUSER_SWORD(clk, 
                           flash, 
                           Hexs, 
                           LES, 
                           point, 
                           rst, 
                           Start, 
                           SW0, 
                           seg_clk, 
                           seg_clrn, 
                           SEG_PEN, 
                           seg_sout);

    input clk;
    input flash;
    input [31:0] Hexs;
    input [7:0] LES;
    input [7:0] point;
    input rst;
    input Start;
    input SW0;
   output seg_clk;
   output seg_clrn;
   output SEG_PEN;
   output seg_sout;
   
   wire [63:0] SEGMENT;
   wire [63:0] XLXN_12;
   wire [63:0] XLXN_13;
   
   P2S  XLXI_1 (.clk(clk), 
               .P_Data(SEGMENT[63:0]), 
               .rst(rst), 
               .Serial(Start), 
               .EN(SEG_PEN), 
               .sout(seg_sout), 
               .s_clk(seg_clk), 
               .s_clrn(seg_clrn));
   HexTo8SEG  XLXI_2 (.flash(flash), 
                     .Hexs(Hexs[31:0]), 
                     .LES(LES[7:0]), 
                     .points(point[7:0]), 
                     .SEG_TXT(XLXN_13[63:0]));
   SSeg_map  XLXI_3 (.Disp_num({Hexs[31:0], Hexs[31:0]}), 
                    .SSeg_map(XLXN_12[63:0]));
   MUX2T1_64  XLXI_4 (.a(XLXN_12[63:0]), 
                     .b(XLXN_13[63:0]), 
                     .sel(SW0), 
                     .o(SEGMENT[63:0]));
endmodule
