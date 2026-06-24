module Data_Memory_tb ;

reg clk;
reg mem_wr_out;
reg rst ;

reg [31:0] data_address;
reg [31:0] wr_data;

wire [31:0] rd_data;

Data_Memory dut(
    .data_address(data_address),
    .wr_data(wr_data),
    .clk(clk),
    .mem_wr_out(mem_wr_out),
    .rd_data(rd_data),
    .rst(rst)
);

always #5 clk = ~clk;

task write_mem;
input [31:0] addr;
input [31:0] data;
begin
    data_address = addr;
    wr_data = data;
    mem_wr_out = 1;
    #10;
end
endtask

task read_mem;
input [31:0] addr;
begin
    data_address = addr;
    mem_wr_out = 0;
    #10;

end
endtask

initial begin

    clk = 0;
    rst = 0 ;
    #10 ;
    rst = 1 ;
    write_mem(0,100);
    write_mem(4,200);
    write_mem(8,300);
    write_mem(12,400);
    write_mem(16,500);

    read_mem(0);
    read_mem(4);
    read_mem(8);
    read_mem(12);
    read_mem(16);

    $finish;
end

endmodule