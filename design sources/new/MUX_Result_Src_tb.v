module MUX_Result_Src_tb;

reg result_src_out;
reg [31:0] ALU_result;
reg [31:0] rd_data;

wire [31:0] result;

MUX_Result_Src dut(
    .result_src_out(result_src_out),
    .ALU_result(ALU_result),
    .rd_data(rd_data),
    .result(result)
);

task test;
input sel;
input [31:0] a,b;
begin
    result_src_out=sel;
    ALU_result=a;
    rd_data=b;
    #10;
//    $display("result=%d",result);
end
endtask

initial begin
    test(0,10,20);
    test(1,10,20);
    test(0,30,40);
    test(1,30,40);
    test(0,50,60);
    test(1,50,60);
    test(0,70,80);
    test(1,70,80);
    test(0,90,100);
    test(1,90,100);
    $finish;
end

endmodule