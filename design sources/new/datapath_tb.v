`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 14:01:38
// Design Name: 
// Module Name: datapath_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath_tb(
    );

reg clk ;
reg rst ;
wire [31:0]result ;

data_path dut (.clk(clk),
                .rst(rst),
                .result(result)) ;

always #5 clk = ~clk ;

initial begin
    clk = 0 ; rst = 0 ;
    #1 rst = 1 ;
    #200 $finish ;
end
    
endmodule
