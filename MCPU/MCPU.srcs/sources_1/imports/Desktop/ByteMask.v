`timescale 1ns / 1ps

module LoadMask	(
				input [31:0] Data_in,
				input [1:0] LoadMode,
				input [1:0] Select,
				output reg [31:0] Data_out
				);

	always @ (*) begin

		case(LoadMode)

			// Load Word
			2'b00: Data_out <= Data_in;

			// Load Half Word Signed

			2'b01: begin
				case(Select[1])
					1'b0: Data_out <= {{16{Data_in[15]}}, Data_in[15:0]};
					1'b1: Data_out <= {{16{Data_in[31]}}, Data_in[31:16]};
				endcase
			end

			// Load Half Word Unsigned

			2'b10: begin
				case(Select[1])
					1'b0: Data_out <= {{16{1'b0}}, Data_in[15:0]};
					1'b1: Data_out <= {{16{1'b0}}, Data_in[31:16]};
				endcase
			end

			// Load Byte

			2'b11: begin
				case(Select)
				    2'b00: Data_out <= {{24{1'b0}}, Data_in[7:0]};
				    2'b01: Data_out <= {{24{1'b0}}, Data_in[15:8]};
				    2'b10: Data_out <= {{24{1'b0}}, Data_in[23:16]};
				    2'b11: Data_out <= {{24{1'b0}}, Data_in[31:24]};
				endcase
			end
		endcase
	end

endmodule