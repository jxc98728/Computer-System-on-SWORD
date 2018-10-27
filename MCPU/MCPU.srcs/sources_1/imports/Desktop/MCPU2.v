`timescale 1ns / 1ps

module MCPU(input clk, 
            input reset,
            input MIO_ready,
            input INT,
            input [4:0] Regs_ctrl,
            input [31:0] Data_in,
            output CPU_MIO,
            output [3:0] mem_w,
            output reg [4:0] state,
            output [31:0] EPC,
            output [31:0] PC_out,
            output [31:0] inst_out,
            output [31:0] Addr_out,
            output [31:0] Data_out,
            output [31:0] Hi_out,
            output [31:0] Lo_out,
            output [31:0] Regs_out,
            output [1023:0] Reg
);


/* Interrupt Circuit */
reg INT_ena;
reg INT_req;
reg INT_act;
reg INT_clr;

reg [31:0] Int_Vector;

initial INT_ena = 1'b1;


    
    always @ (*) begin
        INT_clr <= reset | INT_act;
    end

    // external interrupt signal triggers of interrupt request
    // if CPU is not in interrupt active status
    always @ (posedge INT or posedge INT_clr) begin
        if(INT_clr) INT_req <= 0;
        else        INT_req <= 1;
    end



/* Controller */
wire zero, overflow, Divu_Finish;
wire [31:0] Inst;

reg MemRead, IorD, IRWrite, Zeroext, Shift, Eret, WriteHILO;
reg RegWrite, ALUSrcA, PCWrite, PCWriteCond, Branch, Int, DivEnable;
reg [1:0] RegDst, ALUSrcB, PCSource, LoadMode, MemWrite;
reg [2:0] MemtoReg;
reg [3:0] ALU_operation;

parameter AND = 4'h0, OR  = 4'h1, ADD = 4'h2, SUB = 4'h3, XOR = 4'h4;
parameter SLL = 4'h5, SRL = 4'h6, SLT = 4'h7, NOR = 4'h8, NOP = 4'h9;
parameter MULT = 4'hA, MULTU = 4'hB, DIV = 4'hC, DIVU = 4'hD;

parameter START   = 5'b11111;
parameter IF      = 5'b00000;
parameter ID      = 5'b00001; 
parameter EX_R    = 5'b00010;
parameter EX_MEM  = 5'b00011;
parameter EX_I    = 5'b00100;
parameter EX_BEQ  = 5'b00101;
parameter EX_BNE  = 5'b00110;
parameter EX_J    = 5'b00111;
parameter EX_JAL  = 5'b01000;
parameter EX_JR   = 5'b01001;
parameter EX_JALR = 5'b01010;
parameter EX_ERET = 5'b01011;
parameter EX_INT  = 5'b01100;
parameter MEM_RD  = 5'b01101;
parameter MEM_SW  = 5'b01110;
parameter MEM_SH  = 5'b10110;
parameter MEM_SB  = 5'b10111;
parameter WB_R    = 5'b01111;
parameter WB_I    = 5'b10000;
parameter WB_LW   = 5'b10001;
parameter WB_LUI  = 5'b10010;
parameter WB_LB	  = 5'b10011;
parameter WB_LH   = 5'b10100;
parameter WB_LHU  = 5'b10101;
parameter WB_MFLO = 5'b11000;
parameter WB_MFHI = 5'b11001;
parameter WB_HILO = 5'b11010;
parameter ERROR   = 5'b11110;

`define CPU_Ctrl_Signals {PCWrite, PCWriteCond, Branch, IRWrite, IorD, RegWrite, PCSource, ALUSrcA, ALUSrcB, MemtoReg, RegDst, MemRead, MemWrite, Zeroext, Shift, Eret, Int, LoadMode, WriteHILO, DivEnable}
    
    /*  Finite State Machine */

    always @ (posedge clk or posedge reset) begin
        
        if (reset) begin
            state <= START;
            INT_ena <= 1'b1;
            INT_act <= 1'b0;
        end

        
        else begin
            case(state)
            
                START: begin
                    state <= IF;
                end

                IF: begin
                    if(MIO_ready) begin
                        state <= ID;
                    end
                    else begin
                        state <= IF;
                    end
                end

                ID: begin
                    case(Inst[31:26])

                        6'b000000: begin
                            case(Inst[5:0])
                                6'b100000: state <= EX_R;    // ADD
                                6'b100010: state <= EX_R;    // SUB
                                6'b100100: state <= EX_R;    // AND
                                6'b100101: state <= EX_R;    // OR
                                6'b100110: state <= EX_R;    // XOR
                                6'b100111: state <= EX_R;    // NOR
                                6'b101010: state <= EX_R;    // SLT
                                6'b000000: state <= EX_R;    // SLL
                                6'b000010: state <= EX_R;    // SRL
                                6'b011000: state <= EX_R;    // MULT
                                6'b011001: state <= EX_R; 	 // MULTU
                                6'b011011: state <= EX_R; 	 // DIVU
                                6'b001000: state <= EX_JR;   // JR
                                6'b001001: state <= EX_JALR; // JALR
                                6'b010010: state <= WB_MFLO; // MFLO
                                6'b010000: state <= WB_MFHI; // MFLO
                                default:   state <= ERROR;
                            endcase
                        end
                        6'b001000: state <= EX_I;    // ADDI
                        6'b001100: state <= EX_I;    // ANDI
                        6'b001101: state <= EX_I;    // ORI
                        6'b001110: state <= EX_I;    // XORI
                        6'b001010: state <= EX_I;    // SLTI
                        6'b001111: state <= WB_LUI;  // LUI
                        6'b100011: state <= EX_MEM;  // LW
                        6'b101011: state <= EX_MEM;  // SW
                        6'b101001: state <= EX_MEM;  // SH
                        6'b101000: state <= EX_MEM;  // SB
                        6'b100000: state <= EX_MEM;  // LB
                        6'b100001: state <= EX_MEM;  // LH
                        6'b100101: state <= EX_MEM;  // LHU
                        6'b000100: state <= EX_BEQ;  // BEQ
                        6'b000101: state <= EX_BNE;  // BNE
                        6'b000010: state <= EX_J;    // J
                        6'b000011: state <= EX_JAL;  // JAL
                        6'b010000: state <= EX_ERET; // ERET
                        default:   state <= ERROR;
                    endcase
                end

                EX_R: begin
                	if(Inst[5:0] == 6'b011011) begin // division
                		if(Divu_Finish) begin            		    
                			state <= WB_HILO;
                		end
                		else begin          		    
                			state <= EX_R;
                		end
                	end
                	else if(Inst[5:0] == 6'b011000 || Inst[5:0] == 6'b011001) begin // multiply
                		state <= WB_HILO;
                	end
                	else begin
                		state <= WB_R;
                	end
                end

                EX_I: begin
                    state <= WB_I;
                end

                EX_MEM: begin
                    case(Inst[31:26])
                        6'b101011: state <= MEM_SW; // SW
                        6'b101001: state <= MEM_SH; // SH
                        6'b101000: state <= MEM_SB; // SB
                        6'b100011: state <= MEM_RD; // LW
                        6'b100000: state <= MEM_RD; // LB
                        6'b100001: state <= MEM_RD; // LH
                        6'b100101: state <= MEM_RD; // LHU
                        default:   state <= ERROR;
                    endcase
                end

                EX_BEQ: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                EX_BNE: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                EX_JR: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                EX_JAL: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                EX_J: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end
                
                EX_ERET: begin
                    INT_act <= 1'b0;
                    INT_ena <= 1'b1;
                    state <= IF;
                end

                EX_INT: begin
                    state <= IF;
                end

                EX_JALR: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                MEM_SW: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                MEM_SH: begin
                	if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end

                end

                MEM_SB: begin
                	if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                MEM_RD: begin
                	case(Inst[31:26])
                		6'b100011: state <= WB_LW; // LW
                        6'b100000: state <= WB_LB; // LB
                        6'b100001: state <= WB_LH; // LH
                        6'b100101: state <= WB_LHU;// LHU
                        default: state <= ERROR;
                	endcase
                end

                WB_R: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                WB_I: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                WB_LW: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                WB_LB: begin
                	if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                WB_LH: begin
                	if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                WB_LHU: begin
                	if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                WB_LUI: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                WB_MFHI: begin
                	if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                WB_MFLO: begin
                	if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                WB_HILO: begin
                	if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                ERROR: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end

                default: begin
                    if(INT_req & INT_ena) begin
                        state <= EX_INT;
                        INT_act <= 1'b1;
                        INT_ena <= 1'b0;
                    end
                    else begin
                        state <= IF;
                    end
                end
            endcase 
        end
    end

    always @ (*) begin
        
        case(state)

            IF: begin
                `CPU_Ctrl_Signals <= 27'b1001_0000_001_000_001_00_0000_0000;
                ALU_operation <= ADD;
            end

            ID: begin
                `CPU_Ctrl_Signals <= 27'b0000_0000_011_000_000_00_0000_0000;
                ALU_operation <= ADD;
            end

            EX_R: begin
            	if(Inst[5:0] == 6'b011011) begin
                	`CPU_Ctrl_Signals <= 27'b0000_0000_100_000_000_00_0000_0001;
                end

                else if(Inst[5:0] == 6'b000000 || Inst[5:0] == 6'b000010) begin
                    `CPU_Ctrl_Signals <= 27'b0000_0000_100_000_000_00_0100_0000;
                end
                    
                else begin
                    `CPU_Ctrl_Signals <= 27'b0000_0000_100_000_000_00_0000_0000;
                end
                 
                case(Inst[5:0])
                    6'b100000: ALU_operation <= ADD;  // add
                    6'b100010: ALU_operation <= SUB;  // sub
                    6'b100100: ALU_operation <= AND;  // and
                    6'b100101: ALU_operation <= OR;   // or
                    6'b100110: ALU_operation <= XOR;  // xor
                    6'b100111: ALU_operation <= NOR;  // nor
                    6'b101010: ALU_operation <= SLT;  // slt
                    6'b000000: ALU_operation <= SLL;  // sll
                    6'b000010: ALU_operation <= SRL;  // srl
                    6'b011000: ALU_operation <= MULT; // mult
                    6'b011001: ALU_operation <= MULTU;// multu
                    6'b011011: ALU_operation <= DIVU; // divu
                endcase

            end

            EX_MEM: begin
                `CPU_Ctrl_Signals <= 27'b0000_0000_110_000_000_00_0000_0000;
                ALU_operation <= ADD;
            end

            EX_I: begin

                if(Inst[31:26] == 6'b001100 || Inst[31:26] == 6'b001101 || Inst[31:26] == 6'b001110) begin
                    `CPU_Ctrl_Signals <= 27'b0000_0000_110_000_000_00_1000_0000;
                end

                else begin
                    `CPU_Ctrl_Signals <= 27'b0000_0000_110_000_000_00_0000_0000;
                end

                case(Inst[31:26])
                    6'b001000: ALU_operation <= ADD;  // addi 
                    6'b001100: ALU_operation <= AND;  // andi
                    6'b001101: ALU_operation <= OR;   // ori
                    6'b001110: ALU_operation <= XOR;  // xori
                    6'b001010: ALU_operation <= SLT;  // slti
                endcase
            end

            EX_BEQ: begin
                `CPU_Ctrl_Signals <= 27'b0110_0001_100_000_000_00_0000_0000;
                ALU_operation <= SUB;
            end

            EX_BNE: begin
                `CPU_Ctrl_Signals <= 27'b0100_0001_100_000_000_00_0000_0000;
                ALU_operation <= SUB;
            end

            EX_J: begin
                `CPU_Ctrl_Signals <= 27'b1000_0010_000_000_000_00_0000_0000;
                ALU_operation <= NOP;
            end

            EX_JR: begin
                `CPU_Ctrl_Signals <= 27'b1000_0011_100_000_000_00_0000_0000;
                ALU_operation <= NOP;
            end

            EX_JAL: begin
                `CPU_Ctrl_Signals <= 27'b1000_0110_000_011_100_00_0000_0000;
                ALU_operation <= NOP;
            end

            EX_JALR: begin
                `CPU_Ctrl_Signals <= 27'b1000_0111_100_011_100_00_0000_0000;
                ALU_operation <= NOP;
            end
            
            EX_ERET: begin
                `CPU_Ctrl_Signals <= 27'b1000_0000_000_000_000_00_0010_0000;
                ALU_operation <= NOP;
            end

            EX_INT: begin
                `CPU_Ctrl_Signals <= 27'b1000_0000_000_000_000_00_0001_0000;
                ALU_operation <= NOP;
            end

            MEM_RD: begin
                `CPU_Ctrl_Signals <= 27'b0000_1000_110_000_001_00_0000_0000;
                ALU_operation <= ADD;
            end

            MEM_SW: begin
                `CPU_Ctrl_Signals <= 27'b0000_1000_100_000_000_01_0000_0000;
                ALU_operation <= NOP;
            end

            MEM_SH: begin
            	`CPU_Ctrl_Signals <= 27'b0000_1000_100_000_000_10_0000_0000;
                ALU_operation <= NOP;
            end

            MEM_SB: begin
            	`CPU_Ctrl_Signals <= 27'b0000_1000_100_000_000_11_0000_0000;
                ALU_operation <= NOP;
            end

            WB_R: begin
                `CPU_Ctrl_Signals <= 27'b0000_0100_100_000_010_00_0000_0000;
                ALU_operation <= NOP;
            end

            WB_I: begin
                `CPU_Ctrl_Signals <= 27'b0000_0100_110_000_000_00_0000_0000;
                ALU_operation <= NOP;
            end

            WB_LW: begin
                `CPU_Ctrl_Signals <= 27'b0000_0100_000_001_000_00_0000_0000;
                ALU_operation <= NOP;
            end

            WB_LB: begin
            	`CPU_Ctrl_Signals <= 27'b0000_0100_110_001_000_00_0000_1100;
                ALU_operation <= ADD;
            end

            WB_LH: begin
            	`CPU_Ctrl_Signals <= 27'b0000_0100_110_001_000_00_0000_1000;
                ALU_operation <= ADD;
            end

            WB_LHU: begin
            	`CPU_Ctrl_Signals <= 27'b0000_0100_110_001_000_00_0000_0100;
                ALU_operation <= ADD;
            end

            WB_LUI: begin
                `CPU_Ctrl_Signals <= 27'b0000_0100_000_010_000_00_0000_0000;
                ALU_operation <= NOP;
            end

            WB_MFLO: begin
            	`CPU_Ctrl_Signals <= 27'b0000_0100_100_101_010_00_0000_0000;
                ALU_operation <= NOP;
            end

            WB_MFHI: begin
            	`CPU_Ctrl_Signals <= 27'b0000_0100_100_100_010_00_0000_0000;
                ALU_operation <= NOP;
            end

            WB_HILO: begin
            	`CPU_Ctrl_Signals <= 27'b0000_0000_100_000_000_00_0000_0010;
                if(Inst[5:0] == 6'b011011) begin
                    ALU_operation <= DIVU;
                end
                else if(Inst[5:0] == 6'b011000) begin
                    ALU_operation <= MULT;
                end
                else if(Inst[5:0] == 6'b011001) begin
                    ALU_operation <= MULTU;
                end
                else begin
                    ALU_operation <= NOP;
                end
            end

            ERROR: begin
                `CPU_Ctrl_Signals <= 27'b0000_0000_000_000_000_00_0000_0000;
                ALU_operation <= 4'b0000;
            end

            default: begin
                `CPU_Ctrl_Signals <= 27'b0000_0000_000_000_000_00_0000_0000;
                ALU_operation <= 4'b0000;
            end

        endcase
    end


/* Data Path */

wire [4:0] rs, rt, rd;
wire [15:0] Imm_16;
wire [31:0] Imm_32;
wire [31:0] MDR, MDR_Ready;
wire [31:0] Shamt, Offset;
wire [31:0] ALU_A, ALU_B, ALU_Res, ALU_Out, ALU_LO, ALU_HI;
wire [31:0] Reg_A, Reg_B, Reg_Din;
wire [31:0] EPC_Out;
wire [31:0] PC_Out, PC_New, PC_Next, PC_INT, PC_4, PC_Branch, PC_Jump, PC_Jr;
wire [31:0] HI, LO;

    assign rs = Inst[25:21];
    assign rt = Inst[20:16];

    assign Imm_16 = Inst[15:0];
    assign Imm_32 = (Zeroext == 1'b0) ? {{16{Imm_16[15]}}, Imm_16[15:0]} : {{16{1'b0}}, Imm_16[15:0]};

    assign Shamt = {{27{1'b0}}, Inst[10:6]};
    assign Offset = {Imm_32[29:0], {2{1'b0}}};

    assign ALU_A = (ALUSrcA == 1'b0) ? PC_Out : ((Shift == 1'b1) ? Reg_B : Reg_A);

    assign PC_4 = ALU_Res;
    assign PC_Branch = ALU_Out;
    assign PC_Jump = {PC_Out[31:28], Inst[25:0], {2{1'b0}}};
    assign PC_Jr = Reg_A;
    

    assign PC_out = PC_Out;
    assign inst_out = Inst;
    assign Addr_out = (IorD == 1'b0) ? PC_Out : ALU_Out;
    assign EPC = EPC_Out;
    assign Hi_out = HI;
    assign Lo_out = LO;

    assign PC_New = (Int == 1'b1) ? 32'h00000004 : ((Eret == 1'b1) ? EPC_Out : PC_Next);

    MUX4T1_5      	M0     (Inst[20:16], Inst[15:11], 5'b11111, 5'b00000, RegDst, rd);
    MUX4T1_32       M2     ((Shift == 1'b0) ? Reg_B : Shamt, 32'h00000004, Imm_32, Offset, ALUSrcB, ALU_B);
    MUX4T1_32       M3     (PC_4, PC_Branch, PC_Jump, PC_Jr, PCSource, PC_Next);
    MUX8T1_32       M1     (ALU_Out, MDR_Ready, {Imm_16, {16{1'b0}}}, PC_Out, HI, LO, {32{1'b0}}, {32{1'b0}}, MemtoReg, Reg_Din);

    ALU             A0(clk, reset, DivEnable, ALU_A, ALU_B, ALU_operation, zero, overflow, Divu_Finish, ALU_HI, ALU_LO, ALU_Res);
    Regs            A1(clk, reset, RegWrite, rs, rt, rd, Regs_ctrl, Reg_Din, Reg_A, Reg_B, Regs_out, Reg);
    LoadMask 		A2(MDR, LoadMode, ALU_Out[1:0], MDR_Ready);
    StoreMask		A3(MemWrite, ALU_Out[1:0], Reg_B, mem_w, Data_out); 
   
   	REG32 	LOREG 	(clk, reset, WriteHILO, ALU_LO, LO);
   	REG32  	HIREG 	(clk, reset, WriteHILO, ALU_HI, HI);
    REG32   PC      (clk, reset, MIO_ready & (PCWrite | (PCWriteCond & (~(Branch ^ zero)))), PC_New, PC_Out);
    REG32   EPCReg  (clk, reset, Int, PC_Out, EPC_Out);
    REG32   ALUOut  (clk, 1'b0, 1'b1, ALU_Res, ALU_Out);
    REG32   IR      (clk, reset, IRWrite, Data_in, Inst);
    REG32   DataReg (clk, 1'b0, 1'b1, Data_in, MDR);

endmodule 