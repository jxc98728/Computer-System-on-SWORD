`timescale 1ns / 1ps

module MCPU(input clk, 
            input reset,
            input MIO_ready,
            input INT,
            input [4:0] Regs_ctrl,
            input [31:0] Data_in,
            output mem_w,
            output CPU_MIO,
            output reg [4:0] state,
            output [31:0] PC_out,
            output [31:0] inst_out,
            output [31:0] Addr_out,
            output [31:0] Data_out,
            output [31:0] Regs_out
);

/* Controller */
wire zero, overflow;
wire [31:0] Inst;

reg MemRead, MemWrite, IorD, IRWrite, Zeroext, Shift, Eret;
reg RegWrite, ALUSrcA, PCWrite, PCWriteCond, Branch;
reg [1:0] RegDst, MemtoReg, ALUSrcB, PCSource;
reg [3:0] ALU_operation;


parameter AND = 4'h0, OR  = 4'h1, ADD = 4'h2, SUB = 4'h3, XOR = 4'h4;
parameter SLL = 4'h5, SRL = 4'h6, SLT = 4'h7, NOR = 4'h8, NOP = 4'h9;

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
parameter EX_ERET = 5'b10010;
parameter EX_INT  = 5'b10011;
parameter MEM_RD  = 5'b01011;
parameter MEM_WD  = 5'b01100;
parameter WB_R    = 5'b01101;
parameter WB_I    = 5'b01110;
parameter WB_LW   = 5'b01111;
parameter WB_LUI  = 5'b10000;
parameter ERROR   = 5'b10001;

`define CPU_Ctrl_Signals {PCWrite, PCWriteCond, Branch, IRWrite, IorD, RegWrite, PCSource, ALUSrcA, ALUSrcB, MemtoReg, RegDst, MemRead, MemWrite, Zeroext, Shift, Eret}


    assign mem_w = ~MemRead & MemWrite;

    /*  Finite State Machine */

    always @ (posedge clk or posedge reset) begin
        
        if (reset == 1'b1) begin
            state <= START;
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
                                6'b001000: state <= EX_JR;   // JR
                                6'b001001: state <= EX_JALR; // JALR
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
                        6'b000100: state <= EX_BEQ;  // BEQ
                        6'b000101: state <= EX_BNE;  // BNE
                        6'b000010: state <= EX_J;    // J
                        6'b000011: state <= EX_JAL;  // JAL
                        6'b010000: state <= EX_ERET; // ERET
                        default:   state <= ERROR;
                    endcase
                end

                EX_R: begin
                    state <= WB_R;
                end

                EX_I: begin
                    state <= WB_I;
                end

                EX_MEM: begin
                    case(Inst[31:26])
                        6'b101011: state <= MEM_WD; // SW
                        6'b100011: state <= MEM_RD; // LW
                        default:   state <= ERROR;
                    endcase
                end

                EX_BEQ: begin
                    state <= IF;
                end

                EX_BNE: begin
                    state <= IF;
                end

                EX_JR: begin
                    state <= IF;
                end

                EX_JAL: begin
                    state <= IF;
                end

                EX_J: begin
                    state <= IF;
                end
                
                EX_ERET: begin
                    state <= IF;
                end

                EX_JALR: begin
                    state <= IF;
                end

                MEM_WD: begin
                    state <= IF;
                end

                MEM_RD: begin
                    state <= WB_LW;
                end

                WB_R: begin
                    state <= IF;
                end

                WB_I: begin
                    state <= IF;
                end

                WB_LW: begin
                    state <= IF;
                end

                WB_LUI: begin
                    state <= IF;
                end

                ERROR: begin
                    state <= IF;
                end

                default: begin
                    state <= IF;
                end

            endcase 
        end
    end

    always @ (*) begin
        
        case(state)

            IF: begin
                `CPU_Ctrl_Signals <= 20'b1001_0000_0010_0001_0000;
                ALU_operation <= ADD;
            end

            ID: begin
                `CPU_Ctrl_Signals <= 20'b0000_0000_0110_0000_0000;
                ALU_operation <= ADD;
            end

            EX_R: begin

                if(Inst[5:0] == 6'b000000 || Inst[5:0] == 6'b000010) begin
                    `CPU_Ctrl_Signals <= 20'b0000_0000_1000_0000_0010;
                end
                    
                else begin
                    `CPU_Ctrl_Signals <= 20'b0000_0000_1000_0000_0000;
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
                endcase
            end

            EX_MEM: begin
                `CPU_Ctrl_Signals <= 20'b0000_0000_1100_0000_0000;
                ALU_operation <= ADD;
            end

            EX_I: begin

                if(Inst[31:26] == 6'b001100 || Inst[31:26] == 6'b001101 || Inst[31:26] == 6'b001110) begin
                    `CPU_Ctrl_Signals <= 20'b0000_0000_1100_0000_0100;
                end

                else begin
                    `CPU_Ctrl_Signals <= 20'b0000_0000_1100_0000_0000;
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
                `CPU_Ctrl_Signals <= 20'b0110_0001_1000_0000_0000;
                ALU_operation <= SUB;
            end

            EX_BNE: begin
                `CPU_Ctrl_Signals <= 20'b0100_0001_1000_0000_0000;
                ALU_operation <= SUB;
            end

            EX_J: begin
                `CPU_Ctrl_Signals <= 20'b1000_0010_0000_0000_0000;
                ALU_operation <= NOP;
            end

            EX_JR: begin
                `CPU_Ctrl_Signals <= 20'b1000_0011_1000_0000_0000;
                ALU_operation <= NOP;
            end

            EX_JAL: begin
                `CPU_Ctrl_Signals <= 20'b1000_0110_0001_1100_0000;
                ALU_operation <= NOP;
            end

            EX_JALR: begin
                `CPU_Ctrl_Signals <= 20'b1000_0111_1001_1100_0000;
                ALU_operation <= NOP;
            end
            
            EX_ERET: begin
                `CPU_Ctrl_Signals <= 20'b1000_0000_0000_0000_0001;
                ALU_operation <= NOP;
            end

            MEM_RD: begin
                `CPU_Ctrl_Signals <= 20'b0000_1000_1000_0001_0000;
                ALU_operation <= NOP;
            end

            MEM_WD: begin
                `CPU_Ctrl_Signals <= 20'b0000_1000_1000_0000_1000;
                ALU_operation <= NOP;
            end

            WB_R: begin
                `CPU_Ctrl_Signals <= 20'b0000_0100_1000_0010_0000;
                ALU_operation <= NOP;
            end

            WB_I: begin
                `CPU_Ctrl_Signals <= 20'b0000_0100_1000_0000_0000;
                ALU_operation <= NOP;
            end

            WB_LW: begin
                `CPU_Ctrl_Signals <= 20'b0000_0100_0000_1000_0000;
                ALU_operation <= NOP;
            end

            WB_LUI: begin
                `CPU_Ctrl_Signals <= 20'b0000_0100_0001_0000_0000;
                ALU_operation <= NOP;
            end

            ERROR: begin
                `CPU_Ctrl_Signals <= 20'b0000_0000_0000_0000_0000;
                ALU_operation <= 4'b0000;
            end

            default: begin
                `CPU_Ctrl_Signals <= 20'b0000_0000_0000_0000_0000;
                ALU_operation <= 4'b0000;
            end

        endcase
    end


/* Data Path */
wire Int;
wire [4:0] rs, rt, rd;
wire [15:0] Imm_16;
wire [31:0] Imm_32;
wire [31:0] MDR;
wire [31:0] Shamt, Offset;
wire [31:0] ALU_A, ALU_B, ALU_Res, ALU_Out;
wire [31:0] Reg_A, Reg_B, Reg_Din;
wire [31:0] PC_Out, PC_New, PC_Next, PC_INT, PC_4, PC_Branch, PC_Jump, PC_Jr;

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
    assign PC_Jr = ALU_Out;
    

    assign PC_out = PC_Out;
    assign inst_out = Inst;
    assign Addr_out = (IorD == 1'b0) ? PC_Out : ALU_Out;
    assign Data_out = Reg_B;

    assign PC_INT = PCWrite ? PC_New : PC_Out;

    MUX4T1_5         M0     (Inst[20:16], Inst[15:11], 5'b11111, 5'b00000, RegDst, rd);
    MUX4T1_32        M1     (ALU_Out, MDR, {Imm_16, {16{1'b0}}}, PC_Out, MemtoReg, Reg_Din);
    MUX4T1_32        M2     ((Shift == 1'b0) ? Reg_B : Shamt, 32'h00000004, Imm_32, Offset, ALUSrcB, ALU_B);
    MUX4T1_32        M3     (PC_4, PC_Branch, PC_Jump, PC_Jr, PCSource, PC_New);

    ALU              A0(ALU_A, ALU_B, ALU_operation, zero, overflow, ALU_Res);
    Regs             A1(clk, reset, RegWrite, rs, rt, rd, Regs_ctrl, Reg_Din, Reg_A, Reg_B, Regs_out);
    Interrupt        A3(clk, reset, INT, Eret, state, PC_INT, Int, PC_Next);
    

    REG32   PC      (clk, reset, MIO_ready & (Int | PCWrite | (PCWriteCond & (~(Branch ^ zero)))), PC_Next, PC_Out);
    REG32   ALUOut  (clk, 1'b0, 1'b1, ALU_Res, ALU_Out);
    REG32   IR      (clk, reset, IRWrite, Data_in, Inst);
    REG32   DataReg (clk, 1'b0, 1'b1, Data_in, MDR);

endmodule 