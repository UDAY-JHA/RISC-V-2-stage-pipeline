module Control_Unit(
    input [6:0] op_code,
    input [2:0] func3,
    input [6:0] func7,

    output ALU_src_in,
    output result_src_in,
    output mem_rd_in,
    output mem_wr_in,
    output reg_wr_in,
    output branch_in,
    output jump_in,

    output [1:0] imm_src,
    output [2:0] ALU_ctrl_in
    );

    wire [1:0] ALU_op;

    Decoder_Main MAIN_DECODER(
        .op_code(op_code),
        .ALU_src_in(ALU_src_in),
        .result_src_in(result_src_in),
        .mem_rd_in(mem_rd_in),
        .mem_wr_in(mem_wr_in),
        .reg_wr_in(reg_wr_in),
        .branch_in(branch_in),
        .jump_in(jump_in),
        .imm_src(imm_src),
        .ALU_op(ALU_op)
    );

    Decoder_ALU ALU_DECODER(
        .ALU_op(ALU_op),
        .func3(func3),
        .func7(func7),
        .ALU_ctrl_in(ALU_ctrl_in)
    );

   

endmodule