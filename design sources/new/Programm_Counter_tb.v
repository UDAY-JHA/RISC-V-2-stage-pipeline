module Programm_Counter_tb;

reg clk;
reg rst;
reg [31:0] PC_nxt;

wire [31:0] PC_in;

Programm_Counter dut(
    .PC_nxt(PC_nxt),
    .clk(clk),
    .rst(rst),
    .PC_in(PC_in)
);

always #5 clk=~clk;

task test;
input [31:0] a;
begin
    PC_nxt=a;
    #10;
    $display("PC=%d",PC_in);
end
endtask

initial begin
    clk=0;
    rst=1;

    test(4);
    test(8);
    test(12);
    test(16);
    test(20);
    test(24);
    test(28);
    test(32);
    test(36);
    test(40);

    $finish;
end

endmodule