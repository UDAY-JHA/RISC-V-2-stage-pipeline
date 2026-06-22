`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: MUX_Result_Src
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


module MUX_Result_Src(
    input result_src,
    input [31:0] ALU_result,
    input [31:0] rd_data,
    output [31:0] result
    );
    
    assign result = (result_src) ? rd_data : ALU_result;
endmodule
