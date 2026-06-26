module Adder_PC_Target_tb;

reg [31:0] PC_in;
reg [31:0] imm_data_in;
wire [31:0] PC_target;

Adder_PC_Target dut(
    .PC_in(PC_in),
    .imm_data_in(imm_data_in),
    .PC_target(PC_target)
);

task test;
input [31:0] a,b;
begin
    PC_in=a;
    imm_data_in=b;
    #10;
  
end
endtask

initial begin
    test(0,4);
    test(4,8);
    test(100,20);
    test(200,50);
    test(300,100);
    test(400,200);
    test(500,300);
    test(600,400);
    test(700,500);
    test(800,600);
    $finish;
end

endmodule