module Register_File_tb;

reg clk;
reg [4:0] rs1,rs2,rd;
reg reg_wr;
reg [31:0] wr_data;

wire [31:0] data1,data2;

Register_file dut(
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .clk(clk),
    .reg_wr(reg_wr),
    .wr_data(wr_data),
    .data1(data1),
    .data2(data2)
);

always #5 clk=~clk;

task test ;
    input [4:0]reg1 ;  
    input [4:0]reg2 ; 
    input [4:0]reg3 ; 
    input wr_en ;
    input [31:0]data ;
    
    begin
        rs1 = reg1 ;
        rs2 = reg2 ;
        rd = reg3 ;
        reg_wr = wr_en ;
        wr_data = data ;
        #10 ;
    end
    
endtask

initial begin
    clk=0;

    test(4,5,6,1,123) ;
    test(6,5,6,0,12) ;
    test(2,5,7,1,123) ;
    test(7,5,6,1,1234) ;
    test(4,5,6,1,1235) ;
    test(6,5,6,0,1235) ;
    test(4,5,6,0,1234) ;
    test(4,5,6,1,1235) ;
    test(6,5,6,1,1673) ;
    test(6,5,6,1,18) ;

    $finish;
end

endmodule