`timescale 1ns / 1ps

module StoreMask(
				input [1:0] MemWrite,
				input [1:0] ByteSelect,
				input [31:0] Data_in,
				output reg [3:0] mem_w,
				output reg [31:0] Data_out
				);

always @ (*) begin
        case(MemWrite)
            2'b00: begin
            	Data_out <= Data_in;
            	mem_w <= 4'b0000;
            end
            2'b01: begin
            	Data_out <= Data_in;
            	mem_w <= 4'b1111;
            end
            2'b10: begin
                case(ByteSelect[1])
                    1'b0: begin
                    	Data_out <= Data_in;
                    	mem_w <= 4'b0011;
                    end
                    1'b1: begin
                    	Data_out <= {Data_in[15:0], {16{1'b0}}};
                    	mem_w <= 4'b1100;
                    end
                endcase
            end
            2'b11: begin
                case(ByteSelect[1:0])
                    2'b00: begin
                    	Data_out <= Data_in;
                    	mem_w <= 4'b0001;
                    end
                    2'b01: begin
                    	Data_out <= {Data_in[23:0], {8{1'b0}}};
                    	mem_w <= 4'b0010;
                    end
                    2'b10: begin
                    	Data_out <= {Data_in[15:0], {16{1'b0}}};
                    	mem_w <= 4'b0100;
                    end
                    2'b11: begin
                    	Data_out <= {Data_in[7:0], {24{1'b0}}};
                    	mem_w <= 4'b1000;
                    end
                endcase
            end
        endcase    
    end


endmodule