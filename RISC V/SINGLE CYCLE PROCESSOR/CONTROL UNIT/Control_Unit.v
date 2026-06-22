module Control_Unit(
    input [6:0] op_code,
    input [2:0] func3,
    input [6:0] func7,
    input Zero,

    output PC_src,

    output ALU_src,
    output result_src,
    output mem_rd,
    output mem_wr,
    output reg_wr,
    output branch,
    output jump,

    output [1:0] imm_src,
    output [2:0] ALU_ctrl
    );

    wire [1:0] ALU_op;

    Decoder_Main MAIN_DECODER(
        .op_code(op_code),
        .ALU_src(ALU_src),
        .result_src(result_src),
        .mem_rd(mem_rd),
        .mem_wr(mem_wr),
        .reg_wr(reg_wr),
        .branch(branch),
        .jump(jump),
        .imm_src(imm_src),
        .ALU_op(ALU_op)
    );

    Decoder_ALU ALU_DECODER(
        .ALU_op(ALU_op),
        .func3(func3),
        .func7(func7),
        .ALU_ctrl(ALU_ctrl)
    );

    assign PC_src = (branch & Zero) | jump;

endmodule