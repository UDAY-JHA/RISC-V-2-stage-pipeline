module MUX_PC_Src_tb ;

reg PC_src;
reg [31:0] PCplus4_out;
reg [31:0] PC_target;

wire [31:0] PC_nxt;

MUX_PC_Src dut(
    .PC_src(PC_src),
    .PCplus4_out(PCplus4_out),
    .PC_target(PC_target),
    .PC_nxt(PC_nxt)
);

task test;
input sel;
input [31:0] pc4;
input [31:0] target;

begin
    PC_src    = sel;
    PCplus4_out   = pc4;
    PC_target = target;

    #10;

    //$display("PC_src=%b PCplus4=%d PC_target=%d PC_nxt=%d",PC_src,PCplus4_out,PC_target,PC_nxt);
end
endtask

initial begin

    // Normal sequential execution
    test(0,4,100);
    test(0,8,200);
    test(0,12,300);
    test(0,16,400);
    test(0,20,500);

    // Branch/Jump taken
    test(1,4,100);
    test(1,8,200);
    test(1,12,300);
    test(1,16,400);
    test(1,20,500);

    $finish;
end

endmodule