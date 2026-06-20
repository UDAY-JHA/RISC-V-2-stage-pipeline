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
    input ALU_src,
    input [31:0] data2,
    input [31:0] imm_data,
    output [31:0] src2
    );
    
    assign src2 = (ALU_src) ? imm_data : data2; //ternary operator

endmodule
