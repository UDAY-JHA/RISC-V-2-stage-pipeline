`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: Immediate_Extend_Unit
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

//Why do we need it?
//Suppose we have: addi x1, x2, 10
//The value 10 is stored inside the instruction as a 12-bit immediate.
//The ALU works on 32-bit numbers, so we must convert:
//000000001010   (12 bits)  into 00000000000000000000000000001010  (32 bits)
//This is the job of the Immediate Extend Unit.
 
//////////////////////////////////////////////////////////////////////////////////


module Immediate_Extend_Unit(
    input [31:7]instr,
    input [1:0] imm_src,
    output reg [31:0] imm_data_in
    );
    //use instrunction table
    // fill lsb left by 0's, and msb left by msb of instruction
    
    always @(*) begin
    case(imm_src)
        2'b00: imm_data_in = {{20{instr[31]}}, instr[31:20]};// I
        2'b01: imm_data_in = {{20{instr[31]}}, instr[31:25], instr[11:7]};// S
        2'b10: imm_data_in = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};// B
        2'b11: imm_data_in = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};// J
    endcase
end
    
endmodule
