`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 13:54:25
// Design Name: 
// Module Name: datapath
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
module data_path(
    input clk,
    input rst,
    output [31:0] result
    );


    // Stage 1 Signals
    wire [31:0] PC_in;
    wire [31:0] PCplus4_in;

    wire [31:0] instr;

    wire [31:0] data1_in;
    wire [31:0] data2_in;

    wire [31:0] imm_data_in;

    wire ALU_src_in;
    wire result_src_in;
    wire mem_rd_in;
    wire mem_wr_in;
    wire reg_wr_in;
    wire branch_in;
    wire jump_in;

    wire [1:0] imm_src;
    wire [2:0] ALU_ctrl_in;

    // Pipeline Register Outputs

    wire [31:0] PC_out;
    wire [31:0] PCplus4_out;

    wire [31:0] data1_out;
    wire [31:0] data2_out;

    wire [31:0] imm_data_out;

    wire [4:0] rd_out;

    wire ALU_src_out;
    wire result_src_out;
    wire mem_rd_out;
    wire mem_wr_out;
    wire reg_wr_out;
    wire branch_out;
    wire jump_out;

    wire [2:0] ALU_ctrl_out;


    // Stage 2 Signals
    wire [31:0] src2;

    wire [31:0] ALU_result;
    wire [31:0] rd_data;

    wire [31:0] PC_target;
    wire [31:0] PC_nxt;

    wire Zero;
    wire Neg;
    wire Carry;

    wire PC_src;


    // Branch Decision

    assign PC_src = jump_out | (branch_out & Zero);

    // Program Counter

    Programm_Counter PC_UNIT(
        .PC_nxt(PC_nxt),
        .clk(clk),
        .rst(rst),
        .PC_in(PC_in)
    );

    // Instruction Memory

    Instruction_Memory IM(
        .pc_in(PC_in),
        .instr(instr)
    );
    
    // Control Unit

    Control_Unit CU(
        .op_code(instr[6:0]),
        .func3(instr[14:12]),
        .func7(instr[31:25]),

        .ALU_src_in(ALU_src_in),
        .result_src_in(result_src_in),
        .mem_rd_in(mem_rd_in),
        .mem_wr_in(mem_wr_in),
        .reg_wr_in(reg_wr_in),
        .branch_in(branch_in),
        .jump_in(jump_in),

        .imm_src(imm_src),
        .ALU_ctrl_in(ALU_ctrl_in)
    );

    // Register File

    Register_File RF(
        .rs1(instr[19:15]),
        .rs2(instr[24:20]),

        .clk(clk),

        .rd_out(rd_out),
        .reg_wr_out(reg_wr_out),

        .wr_data(result),

        .data1_in(data1_in),
        .data2_in(data2_in)
    );

    // Immediate Generator

    Immediate_Extend_Unit IMM_EXT(
        .instr(instr[31:7]),
        .imm_src(imm_src),
        .imm_data_in(imm_data_in)
    );

    // PC + 4 Adder

    Adder_PC_Plus_4 PC4(
        .PC_in(PC_in),
        .PCplus4_in(PCplus4_in)
    );
    
    // Pipeline Register

    PIPELINE_REG PIPE_REG(

        .clk(clk),
        .rst(rst),

        .PC_in(PC_in),
        .PCplus4_in(PCplus4_in),

        .data1_in(data1_in),
        .data2_in(data2_in),

        .imm_data_in(imm_data_in),

        .rd_in(instr[11:7]),

        .ALU_src_in(ALU_src_in),
        .result_src_in(result_src_in),

        .mem_rd_in(mem_rd_in),
        .mem_wr_in(mem_wr_in),
        .reg_wr_in(reg_wr_in),

        .branch_in(branch_in),
        .jump_in(jump_in),

        .ALU_ctrl_in(ALU_ctrl_in),

        .PC_out(PC_out),
        .PCplus4_out(PCplus4_out),

        .data1_out(data1_out),
        .data2_out(data2_out),

        .imm_data_out(imm_data_out),

        .rd_out(rd_out),

        .ALU_src_out(ALU_src_out),
        .result_src_out(result_src_out),

        .mem_rd_out(mem_rd_out),
        .mem_wr_out(mem_wr_out),
        .reg_wr_out(reg_wr_out),

        .branch_out(branch_out),
        .jump_out(jump_out),

        .ALU_ctrl_out(ALU_ctrl_out)
    );

    // ALU Source MUX

    MUX_ALU_Src ALU_SRC_MUX(
        .ALU_src_out(ALU_src_out),
        .data2_out(data2_out),
        .imm_data_out(imm_data_out),
        .src2(src2)
    );

    // ALU

    ALU ALU_UNIT(
        .src1(data1_out),
        .src2(src2),

        .ALU_ctrl_out(ALU_ctrl_out),

        .ALU_result(ALU_result),

        .Zero(Zero),
        .Neg(Neg),
        .Carry(Carry)
    );
    
    // Data Memory

    Data_Memory DM(
        .data_address(ALU_result),
        .wr_data(data2_out),

        .clk(clk),
        .rst(rst),

        .mem_wr_out(mem_wr_out),

        .rd_data(rd_data)
    );

    // Result Select MUX

    MUX_Result_Src RESULT_MUX(
        .result_src_out(result_src_out),

        .ALU_result(ALU_result),
        .rd_data(rd_data),

        .result(result)
    );

    // Branch Target Adder

    Adder_PC_Target PC_TARGET(
        .PC_out(PC_out),
        .imm_data_out(imm_data_out),
        .PC_target(PC_target)
    );

    // PC Source MUX

    MUX_PC_Src PC_MUX(
        .PC_src(PC_src),

        .PCplus4_in(PCplus4_in),
        .PC_target(PC_target),

        .PC_nxt(PC_nxt)
    );
    
    assign PC_src = jump_out | (branch_out & Zero);
endmodule