`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2018 09:20:58 PM
// Design Name: 
// Module Name: MIO_BUS
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


module MIO_BUS(	input clk,
				input rst,
				input[3:0]BTN,
				input[15:0]SW,
				input[3:0]mem_w,
				input[31:0]Cpu_data2bus,				//data from CPU
				input[31:0]addr_bus,
				input[31:0]ram_data_out,
				input[15:0]led_out,
				input[31:0]counter_out,
				input counter0_out,
				input counter1_out,
				input counter2_out,

				input [9:0]keys,
				input key_ready,

				
				output reg [18:0]vram_addr,
				output reg [11:0]vram_data_in,
				output reg vram_we,
				
				output reg [11:0]text_addr,
				output reg [15:0]text_data_in,
				output reg text_we,
                
                output reg graphic_or_text,
                
				output reg[31:0]Cpu_data4bus,				//write to CPU
				output reg[31:0]ram_data_in,				//from CPU write to Memory
				output reg[13:0]ram_addr,				    //Memory Address signals
				output reg[3:0]data_ram_we,
				output reg GPIOf0000000_we,
				output reg GPIOe0000000_we,
				output reg counter_we,
				output reg[31:0]Peripheral_in
				);

initial graphic_or_text = 1'b1;
	//reg data_ram_rd,GPIOf0000000_rd,GPIOe0000000_rd,counter_rd;
	
	always @ * begin
		data_ram_we = 0;
		counter_we = 0;
		GPIOf0000000_we = 0;
		GPIOe0000000_we = 0;
		vram_we = 0;
		ram_addr = 13'h0;
		ram_data_in = 32'h0;
		vram_addr = 19'h0;
		vram_data_in = 12'h0;
		Peripheral_in = 32'h0;
		
		case(addr_bus[31:28])
           
              	// RAM       
                4'h0: begin
                     data_ram_we = mem_w;
                     ram_addr = addr_bus[15:2];
                     ram_data_in = Cpu_data2bus;
                     Cpu_data4bus = ram_data_out;
                     
                end
              
             	// 7-Segment
                4'he: begin
                    GPIOe0000000_we = mem_w;
                    Peripheral_in = Cpu_data2bus;
                    Cpu_data4bus = counter_out;
                    
                end
                
              	// LED & Counter
                4'hf: begin
                    if(addr_bus[2]) begin
                        counter_we = mem_w;
                        Peripheral_in = Cpu_data2bus;
                        Cpu_data4bus = counter_out;
                       
                    end
                    else begin
                        GPIOf0000000_we = mem_w;
                        Peripheral_in = Cpu_data2bus;
                        Cpu_data4bus = {counter0_out, counter1_out, counter2_out, 9'b0, BTN[3:0], SW[15:0]};
                        
                    end
                end
                
             
             	// VRAM - Graph Mode
             	4'hc: begin
             		vram_we = mem_w;
             		vram_addr = addr_bus[18:0];
             		vram_data_in = Cpu_data2bus[11:0];
             	end

             	// VRAM - Text Mode
                4'hb: begin
                    text_we = mem_w;
                    text_addr = addr_bus[11:0];
                    text_data_in = Cpu_data2bus[15:0];              
                end
                
                4'ha: begin
                    graphic_or_text = mem_w ? Cpu_data2bus[0] : graphic_or_text;
                    Cpu_data4bus = {{31{1'b0}}, graphic_or_text};
                end

             	// PS2 Keyboard

             	4'hd: begin
             		Cpu_data4bus = {{22{1'b0}}, keys[9:0]};
             	end
		endcase 
	end 
  
	

endmodule