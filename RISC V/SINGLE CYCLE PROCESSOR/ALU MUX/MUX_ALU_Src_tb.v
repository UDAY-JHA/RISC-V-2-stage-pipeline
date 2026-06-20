module MUX_ALU_Src_tb;

reg ALU_src;
reg [31:0] data2;
reg [31:0] imm_data;

wire [31:0] src2;

MUX_ALU_Src dut(
    .ALU_src(ALU_src),
    .data2(data2),
    .imm_data(imm_data),
    .src2(src2)
);

task test;
input sel;
input [31:0] a,b;
begin
    ALU_src=sel;
    data2=a;
    imm_data=b;
    #10;
    $display("sel=%b src2=%d",ALU_src,src2);
end
endtask

initial begin
    test(0,10,20);
    test(1,10,20);
    test(0,50,100);
    test(1,50,100);
    test(0,1,2);
    test(1,1,2);
    test(0,1000,2000);
    test(1,1000,2000);
    test(0,55,77);
    test(1,55,77);
    $finish;
end

endmodule