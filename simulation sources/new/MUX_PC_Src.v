`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: MUX_PC_Src
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


module MUX_PC_Src(
    input PC_src,
    input [31:0] PCplus4_in,
    input [31:0] PC_target,
    output [31:0] PC_nxt
    );
    
    assign PC_nxt = (PC_src) ? PC_target : PCplus4_in;
    
endmodule