module Decoder_ALU_tb;

reg [1:0] ALU_op;
reg [2:0] func3;
reg [6:0] func7;

wire [2:0] ALU_ctrl_in;

Decoder_ALU dut(
    .ALU_op(ALU_op),
    .func3(func3),
    .func7(func7),
    .ALU_ctrl_in(ALU_ctrl_in)
);

task test;
input [1:0] op;
input [2:0] f3;
input [6:0] f7;
begin
    ALU_op = op;
    func3  = f3;
    func7  = f7;
    #10;

    //$display("ALU_op=%b func3=%b func7=%b => ALU_ctrl=%b",
      //        ALU_op,func3,func7,ALU_ctrl_in);
end
endtask

initial begin
    test(2'b00,3'b000,7'b0000000); // add
    test(2'b01,3'b000,7'b0000000); // sub
    test(2'b10,3'b000,7'b0000000); // add
    test(2'b10,3'b000,7'b0100000); // sub
    test(2'b10,3'b111,7'b0000000); // and
    test(2'b10,3'b110,7'b0000000); // or
    test(2'b10,3'b100,7'b0000000); // xor
    test(2'b10,3'b010,7'b0000000); // slt
    test(2'b10,3'b001,7'b0000000);
    test(2'b11,3'b000,7'b0000000);

    $finish;
end

endmodule