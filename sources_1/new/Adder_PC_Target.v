`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: Adder_PC_Target
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


module Adder_PC_Target(
    input [31:0] PC_out,
    input [31:0]imm_data_out,
    output [31:0] PC_target
    );
    
    assign PC_target = PC_out + imm_data_out;
    
endmodule
