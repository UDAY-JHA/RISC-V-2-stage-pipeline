`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 14:26:42
// Design Name: 
// Module Name: data_path_tb
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


module data_path_tb(
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
        #10 rst = 1 ;
        #100 $finish ;
    end
endmodule
