module Adder_PC_Plus_4_tb;

reg [31:0] PC_in;
wire [31:0] PCplus4_in;

Adder_PC_Plus_4 dut(
    .PC_in(PC_in),
    .PCplus4_in(PCplus4_in)
);

task test;
input [31:0] a;
begin
    PC_in= a;
    #10;
    //$display("PC=%d PCplus4=%d",PC_in,PCplus4_in);
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