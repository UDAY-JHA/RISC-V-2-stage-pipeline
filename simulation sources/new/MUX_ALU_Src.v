`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: MUX_ALU_Src
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


module MUX_ALU_Src(
    input ALU_src_out,
    input [31:0] data2_out,
    input [31:0] imm_data_out,
    output [31:0] src2
    );
    
    assign src2 = (ALU_src_out) ? imm_data_out : data2_out; //ternary operator

endmodule
