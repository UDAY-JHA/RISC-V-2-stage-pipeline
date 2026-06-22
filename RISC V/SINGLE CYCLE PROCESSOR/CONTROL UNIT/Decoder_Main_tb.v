module Decoder_Main_tb;

reg [6:0] op_code;

wire ALU_src;
wire [1:0] result_src;
wire mem_rd;
wire mem_wr;
wire reg_wr;
wire branch;
wire jump;
wire [2:0] imm_src;
wire [1:0] ALU_op;

Decoder_Main dut(
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

task test;
input [6:0] opcode;
begin
    op_code = opcode;
    #10;

    $display("opcode=%b reg_wr=%b mem_wr=%b branch=%b ALU_op=%b",
              op_code,reg_wr,mem_wr,branch,ALU_op);
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