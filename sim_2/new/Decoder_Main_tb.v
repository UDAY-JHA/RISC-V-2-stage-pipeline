module Decoder_Main_tb ;

reg [6:0] op_code;

wire ALU_src_in;
wire [1:0] result_src_in;
wire mem_rd_in;
wire mem_wr_in;
wire reg_wr_in;
wire branch_in;
wire jump_in;
wire [2:0] imm_src;
wire [1:0] ALU_op;

Decoder_Main dut(
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

task test;
input [6:0] opcode;
begin
    op_code = opcode;
    #10;

    $display("opcode=%b reg_wr=%b mem_wr=%b branch=%b ALU_op=%b",
              op_code,reg_wr_in,mem_wr_in,branch_in,ALU_op);
end
endtask

initial begin
    test(7'b0000011); // lw
    test(7'b0100011); // sw
    test(7'b1100011); // beq
    test(7'b0010011); // addi
    test(7'b0110011); // R type

    $finish;
end

endmodule