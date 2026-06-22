`timescale 1ns / 1ps

module data_path(
    input clk,
    input rst,
    output [31:0] result
    );

    wire [31:0] PC;
    wire [31:0] PCplus4;
    wire [31:0] PC_target;
    wire [31:0] PC_nxt;

    wire [31:0] instr;

    wire [31:0] data1;
    wire [31:0] data2;

    wire [31:0] imm_data;

    wire [31:0] src2;

    wire [31:0] ALU_result;
    wire [31:0] rd_data;

    wire Zero;
    wire Neg;
    wire Carry;

    wire ALU_src;
    wire result_src;
    wire mem_rd;
    wire mem_wr;
    wire reg_wr;
    wire branch;
    wire jump;

    wire [1:0] imm_src;
    wire [1:0] ALU_op;
    wire [2:0] ALU_ctrl;

    wire PC_src;

    assign PC_src = branch & Zero;

    Programm_Counter PC_UNIT(
        .PC_nxt(PC_nxt),
        .clk(clk),
        .rst(rst),
        .PC(PC)
    );

    Instruction_Memory IM(
        .pc(PC),
        .instr(instr)
    );

    Control_Unit CU(
    .op_code(instr[6:0]),
    .func3(instr[14:12]),
    .func7(instr[31:25]),
    .Zero(Zero),
    .PC_src(PC_src),
    .ALU_src(ALU_src),
    .result_src(result_src),
    .mem_rd(mem_rd),
    .mem_wr(mem_wr),
    .reg_wr(reg_wr),
    .branch(branch),
    .jump(jump),
    .imm_src(imm_src),
    .ALU_ctrl(ALU_ctrl)
);

    Register_File RF(
        .rs1(instr[19:15]),
        .clk(clk),
        .rs2(instr[24:20]),
        .rd(instr[11:7]),
        .reg_wr(reg_wr),
        .wr_data(result),
        .data1(data1),
        .data2(data2)
    );

    Immediate_Extend_Unit IMM_EXT(
        .instr(instr[31:7]),
        .imm_src(imm_src[1:0]),
        .imm_data(imm_data)
    );

    MUX_ALU_Src ALU_SRC_MUX(
        .ALU_src(ALU_src),
        .data2(data2),
        .imm_data(imm_data),
        .src2(src2)
    );

    ALU ALU_UNIT(
        .src1(data1),
        .src2(src2),
        .ALU_ctrl(ALU_ctrl),
        .ALU_result(ALU_result),
        .Zero(Zero),
        .Neg(Neg),
        .Carry(Carry)
    );

    Data_Memory DM(
        .data_address(ALU_result),
        .wr_data(data2),
        .clk(clk),
        .mem_wr(mem_wr),
        .rd_data(rd_data),
        .rst(rst)
    );

    MUX_Result_Src RESULT_MUX(
        .result_src(result_src),
        .ALU_result(ALU_result),
        .rd_data(rd_data),
        .result(result)
    );

    Adder_PC_Plus_4 PC4(
        .PC(PC),
        .PCplus4(PCplus4)
    );

    Adder_PC_Target PCT(
        .PC(PC),
        .imm_data(imm_data),
        .PC_target(PC_target)
    );

    MUX_PC_Src PC_MUX(
        .PC_src(PC_src),
        .PCplus4(PCplus4),
        .PC_target(PC_target),
        .PC_nxt(PC_nxt)
    );
    
    

endmodule