////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 14.7
//  \   \         Application : sch2hdl
//  /   /         Filename : SWORD.vf
// /___/   /\     Timestamp : 08/27/2018 16:19:36
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: sch2hdl -sympath "E:/Verilog Project/Organization/OExp4 - Copy/ipcore_dir" -intstyle ise -family kintex7 -verilog "E:/Verilog Project/Organization/OExp4 - Copy/SWORD.vf" -w "E:/Verilog Project/Organization/OExp4 - Copy/SWORD.sch"
//Design Name: SWORD
//Device: kintex7
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module SWORD(
        input wire clk_200mhz_p,
		input wire clk_200mhz_n,
	// I/O:			
		input  wire RSTN,
		input  wire[15:0]SW,
		input  wire[3:0]K_COL,
		
    // PS2
		input  wire PS2_clk,
		input  wire PS2_data,
		
    // Serial Port
        input  wire uart_Rx, 
						
		output wire[4:0]K_ROW,
		output wire LEDCLK,
		output wire LEDCLR,
		output wire LEDDT,
		output wire LEDEN,
				
		output wire SEGCLK,
		output wire SEGCLR,
		output wire SEGDT,
		output wire SEGEN,
						
		output wire[7:0]SEGMENT,
		output wire[3:0]AN,
		output wire[7:0]LED,
	//VGA
		output wire[3:0]R,
		output wire[3:0]G,
		output wire[3:0]B,
		output wire HS,
		output wire VS
);
						
wire clk_200mhz;
IBUFDS clk_200m_buf (.O(clk_200mhz), .I(clk_200mhz_p), .IB(clk_200mhz_n));

reg clk_100mhz = 0;				
    
always @ (posedge clk_200mhz) begin
    clk_100mhz <= !clk_100mhz;
end

   wire [31:0] Addr_out;
   wire [31:0] Ai;
   wire [31:0] Bi;
   wire [7:0] blink;
   wire [3:0] BTN_OK;
   wire [31:0] Counter_out;
   wire CR;
   wire [31:0] Data_in;
   wire [31:0] Data_out;
   wire [31:0] EPC;
   wire [31:0] HI, LO;
   wire [31:0] Disp_num;
   wire [31:0] Div;
   wire G0;
   wire [31:0] inst;
   wire [7:0] LE_out;
   wire [31:0] PC;
   wire [7:0] point_out;
   wire [3:0] Pulse;
   wire RDY;
   wire readn;
   wire rst;
   wire [4:0] state_out;
   wire [15:0] SW_OK;
   wire V5;
   wire [4:0] Key_out;
   wire [3:0] mem_w;
   
   wire [31:0] ram_data_out;
   wire [31:0] ram_data_in;
   wire [3:0] wea;
   wire [13:0] ram_addr;
   
   wire [31:0] ram_data_raw;
   wire [13:0] ram_addr_raw;
   wire [3:0]ram_we_raw;
   
   
   wire CPU_clk;
   wire CPU_clk_inv;
   wire ram_clk;
   
   wire [1:0] counter_set;
   wire [31:0] Peripheral_in;
   wire GPIOe0000000_we;
   wire GPIOf0000000_we;
   wire counter_we;
   wire [15:0] LED_out;
   wire counter2_out;
   wire counter1_out;
   wire counter0_out;
   wire [31:0] Regs_out;
   wire [1023:0] Reg;
   
   wire [8:0]row;
   wire [9:0]col;
   
   wire [11:0]vram_data_in;
   wire [18:0]vram_addr;
   wire vram_we;
   
   wire [15:0]text_data_in;
   wire [11:0]text_addr;
   wire text_we;
   
   wire [18:0]vga_addr;
   wire [11:0]vga_data;
   wire [11:0]vga_graph; 
   wire [11:0]vga_text;
   wire [11:0]vga_debug;
   wire vga_src;

   wire [9:0] keys;
   wire key_ready;
   
   
  
   assign vga_addr = {1'b0, row[8:0], {9{1'b0}}} + {3'b0, row[8:0], {7{1'b0}}} + {{9{1'b0}}, col};
    
   assign vga_data = SW_OK[13] == 1'b1 ? vga_debug : (vga_src == 1'b1 ? vga_text : vga_graph);
   
   VGA      VGAC(.clk(Div[1]),				// vga clk = 25MHz
                .rst(rst),
                .Din(vga_data),                // bbbb_gggg_rrrr, pixel
                .row(row),                     // pixel ram row address, 480 (512) lines
                .col(col),                     // pixel ram col address, 640 (1024) pixels
                .rdn(),                        // read pixel RAM (active_low)
                .R(R),
                .G(G), 
                .B(B),                  // red, green, blue colors
                .HS(HS), 
                .VS(VS)                // horizontal and vertical synchronization
                ); 
   
   VRAM    Video_RAM(
            .clka(ram_clk),    // ihnput wire clka
            .wea(vram_we),      // input wire [0 : 0] wea
            .addra(vram_addr),  // input wire [18 : 0] addra
            .dina(vram_data_in),    // input wire [11 : 0] dina
            .clkb(clk_100mhz),    // input wire clkb
            .addrb(vga_addr),  // input wire [18 : 0] addrb
            .doutb(vga_graph)  // output wire [11 : 0] doutb
               ); 
   
   VRAM_Text    Text_RAM(
                       .vga_clk(clk_100mhz),
                       .row(row),
                       .col(col),
                       .vga_data(vga_text),             
                       .ram_clk(ram_clk),
                       .text_data_in(text_data_in),
                       .text_addr(text_addr),
                       .text_we(text_we)
                        );
   
   
   PS2      Keyboard(.clk(Div[0]),			     // 50 MHz
                     .rst(rst),                  // reset
                     .ps2_clk(PS2_clk),          // ps2 clock
                     .ps2_data(PS2_data),        // ps2 data
                     .data_out(keys),            // 8-bit code
                     .ready(key_ready)           // code ready
              );
   
   
   Seg7_Dev_MUSER_SWORD  U3 (.flash(Div[25]), 
                                .Hexs(Disp_num[31:0]), 
                                .LES(LE_out[7:0]), 
                                .point(point_out[7:0]), 
                                .Scan({SW_OK[1], Div[19:18]}), 
                                .SW0(SW_OK[0]), 
                                .AN(AN[3:0]), 
                                .SEGMENT(SEGMENT[7:0]));
                                
   SAnti_jitter  U9(.clk(clk_100mhz), 
                        .Key_y(K_COL[3:0]), 
                        .readn(readn), 
                        .RSTN(RSTN), 
                        .SW(SW[15:0]), 
                        .BTN_OK(BTN_OK[3:0]), 
                        .CR(CR), 
                        .Key_out(Key_out[4:0]), 
                        .Key_ready(RDY), 
                        .Key_x(K_ROW[4:0]), 
                        .pulse_out(Pulse[3:0]), 
                        .rst(rst), 
                        .SW_OK(SW_OK[15:0]));
                        
   SEnter_2_32  M4 (.BTN(BTN_OK[2:0]), 
                       .clk(clk_100mhz), 
                       .Ctrl({SW_OK[7:5], SW_OK[15], SW_OK[0]}), 
                       .Din(Key_out[4:0]), 
                       .D_ready(RDY), 
                       .Ai(Ai[31:0]), 
                       .Bi(Bi[31:0]), 
                       .blink(blink[7:0]), 
                       .readn(readn));
                       
   Display_MUSER_SWORD  U6 (.clk(clk_100mhz), 
                               .flash(Div[25]), 
                               .Hexs(Disp_num[31:0]), 
                               .LES(LE_out[7:0]), 
                               .point(point_out[7:0]), 
                               .rst(rst), 
                               .Start(Div[10]), 
                               .SW0(SW_OK[0]), 
                               .seg_clk(SEGCLK), 
                               .seg_clrn(SEGCLR), 
                               .SEG_PEN(SEGEN), 
                               .seg_sout(SEGDT));
                               
   Multi_8CH32  U5 (.clk(CPU_clk_inv), 
                       .Data0(Peripheral_in[31:0]), 
                       .data1(Regs_out[31:0]), 
                       .data2(inst[31:0]), 
                       .data3({{22{1'b0}}, keys[9:0]}), 
                       .data4(Addr_out[31:0]), 
                       .data5(Data_out[31:0]), 
                       .data6(Data_in[31:0]), 
                       .data7(PC[31:0]), 
                       .EN(GPIOe0000000_we), 
                       .LES({64{G0}}), 
                       .point_in({Div[31:0], Div[31:0]}), 
                       .rst(rst), 
                       .Test(SW_OK[7:5]), 
                       .Disp_num(Disp_num[31:0]), 
                       .LE_out(LE_out[7:0]), 
                       .point_out(point_out[7:0]));
                       
   VCC  XLXI_9 (.P(V5));
   
   GND  XLXI_11 (.G(G0));
   
   GPIO  U7 (.clk(CPU_clk_inv), 
                 .EN(GPIOf0000000_we), 
                 .P_Data(Peripheral_in[31:0]), 
                 .rst(rst), 
                 .Start(Div[20]), 
                 .counter_set(counter_set[1:0]), 
                 .GPIOf0(), 
                 .ledclk(LEDCLK), 
                 .ledclrn(LEDCLR), 
                 .LEDEN(LEDEN), 
                 .ledsout(LEDDT), 
                 .LED_out(LED_out[15:0]));
                 
   PIO  U2 (.clk(CPU_clk_inv), 
                .EN(GPIOf0000000_we), 
                .PData_in(Peripheral_in[31:0]), 
                .rst(rst), 
                .counter_set(), 
                .GPIOf0(), 
                .LED_out(LED));
                
                
   MIO_BUS  U4 (.addr_bus(Addr_out[31:0]), 
                    .BTN(BTN_OK[3:0]), 
                    .clk(clk_100mhz), 
                    .counter_out(Counter_out[31:0]), 
                    .counter0_out(counter0_out), 
                    .counter1_out(counter1_out), 
                    .counter2_out(counter2_out), 
                    .Cpu_data2bus(Data_out[31:0]), 
                    .led_out(LED_out[15:0]), 
                    .mem_w(mem_w), 
                    .ram_data_out(ram_data_out[31:0]), 
                    .rst(rst), 
                    .SW(SW_OK[15:0]), 
                    .counter_we(counter_we), 
                    .Cpu_data4bus(Data_in[31:0]), 
                    .data_ram_we(ram_we_raw), 
                    .GPIOe0000000_we(GPIOe0000000_we), 
                    .GPIOf0000000_we(GPIOf0000000_we), 
                    .Peripheral_in(Peripheral_in[31:0]), 
                    .ram_addr(ram_addr_raw), 
                    .ram_data_in(ram_data_raw),
                    .keys(keys[9:0]),
                    .key_ready(key_ready),
                    .vram_addr(vram_addr),
                    .vram_data_in(vram_data_in),
                    .vram_we(vram_we),
                    .text_addr(text_addr),
                    .text_data_in(text_data_in),
                    .text_we(text_we),
                    .graphic_or_text(vga_src)
                    );
                    
   INV  CPU_INV (.I(CPU_clk), 
                .O(CPU_clk_inv));
                
   Counter_x  U10 (.clk(CPU_clk_inv), 
                      .clk0(Div[6]), 
                      .clk1(Div[9]), 
                      .clk2(Div[11]), 
                      .counter_ch(counter_set[1:0]), 
                      .counter_val(Peripheral_in[31:0]), 
                      .counter_we(counter_we), 
                      .rst(rst), 
                      .counter_out(Counter_out[31:0]), 
                      .counter0_OUT(counter0_out), 
                      .counter1_OUT(counter1_out), 
                      .counter2_OUT(counter2_out));
   
   Reprog U12(
              .clkUART(clk_100mhz), 
              .clkMem(ram_clk),
              .uartRx(uart_Rx), 
              .progEN(rst),
              .addrIn(ram_addr_raw), 
              .addrOut(ram_addr),
              .dataIn(ram_data_raw), 
              .dataOut(ram_data_in),
              .weIn(ram_we_raw), 
              .weOut(wea)
   );
   
   
   RAM_B  RAM (   
                .clka(ram_clk),    // input wire clka
                .wea(wea),      // input wire [0 : 0] wea
                .addra(ram_addr[13:0]),  // input wire [13 : 0] addra
                .dina(ram_data_in[31:0]),    // input wire [31 : 0] dina
                .douta(ram_data_out[31:0])  // output wire [31 : 0] douta    
                );
                
                  
                  
   clk_div  U8 (.clk(clk_100mhz), 
                .rst(rst), 
                .SW2(SW_OK[2]), 
                .SW13(SW_OK[13]), 
                .ManualClk(BTN_OK[0]), 
                .clkdiv(Div[31:0]), 
                .Clk_CPU(CPU_clk)
                );
                    
   MCPU  U1 (.clk(CPU_clk), 
                 .Data_in(Data_in[31:0]), 
                 .INT(key_ready), 
                 .MIO_ready(V5), 
                 .Regs_ctrl(SW_OK[12:8]), 
                 .reset(rst), 
                 .Addr_out(Addr_out[31:0]), 
                 .CPU_MIO(), 
                 .Data_out(Data_out[31:0]), 
                 .inst_out(inst[31:0]), 
                 .mem_w(mem_w), 
                 .PC_out(PC[31:0]), 
                 .Regs_out(Regs_out[31:0]), 
                 .state(state_out[4:0]),
                 .EPC(EPC),
                 .Reg(Reg),
                 .Hi_out(HI),
                 .Lo_out(LO)
                 );
                 
   Debug    U13(
                .clk(clk_100mhz),
                .rst(rst),
                .row(row),
                .col(col),
                .PC(PC),
                .EPC(EPC[31:0]),
                .Inst_out(inst[31:0]),
                .Addr_out(Addr_out[31:0]),
                .Data_out(Data_out[31:0]),
                .Data_in(Data_in[31:0]),
                .Hi(HI),
                .Lo(LO),
                .Cause({32{1'b0}}),
                .Status({32{1'b0}}),
                .Reg(Reg),
                .vga_data(vga_debug)
                );
                 
   INV  RAM_INV (.I(CPU_clk), 
                .O(ram_clk));
endmodule
