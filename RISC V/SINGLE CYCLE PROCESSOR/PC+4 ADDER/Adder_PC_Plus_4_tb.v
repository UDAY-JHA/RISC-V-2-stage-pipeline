module Adder_PC_Plus_4_tb;

reg [31:0] PC;
wire [31:0] PCplus4;

Adder_PC_Plus_4 dut(
    .PC(PC),
    .PCplus4(PCplus4)
);

task test;
input [31:0] a;
begin
    PC = a;
    #10;
    $display("PC=%d PCplus4=%d",PC,PCplus4);
end
endtask

initial begin
    test(0);
    test(4);
    test(8);
    test(12);
    test(16);
    test(20);
    test(100);
    test(1000);
    test(32'hFFFFFFFC);
    test(32'hFFFFFFFF);
    $finish;
end

endmodule