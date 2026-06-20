`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: Decoder_Main
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


module Decoder_Main(
    input [6:0] op_code,
    output reg ALU_src,
    output reg result_src,
    output reg mem_rd,
    output reg mem_wr,
    output reg reg_wr,
    output reg branch,
    output reg jump,
    output reg [1:0] imm_src,
    output reg [1:0] ALU_op
    );
    
    always @(*) begin
        case(op_code)
            7'b0000011: begin // Load Word Instruction(Mem to reg)
                reg_wr = 1;
                mem_wr = 0; 
                mem_rd = 1 ;
                branch = 0; //=0 if not B type, =1 if B type
                jump = 0 ;
                ALU_src = 1; // =0 if reg operand, =1 if imm operand
                ALU_op = 2'b00; 
                imm_src = 2'b00;   // = 0: I type, 1:S type, 2: B type, 3: J type 
                result_src = 1'b1 ; // = 0 if result is alu result, = 1 if mem result
            end
            7'b0110011: begin  // R type
                reg_wr = 1 ;
                mem_wr = 0 ;
                mem_rd = 0 ;
                branch = 0 ;
                jump = 0 ;
                ALU_src = 0 ;
                ALU_op = 2'b10 ;
                imm_src = 2'b00 ;
                result_src = 1'b0 ;
            end
            7'b0100011: begin // Store Word Instruction(reg to mem)
                reg_wr = 0 ;
                mem_wr = 1 ;
                mem_rd = 0 ;
                branch = 0 ;
                jump = 0 ;
                ALU_src = 1 ;
                ALU_op = 2'b00 ;
                imm_src = 2'b01 ;
                result_src = 1'bx ;
            end
            7'b1100011: begin // Branch Instruction
                reg_wr = 0 ;
                mem_wr = 0 ;
                mem_rd = 0 ;
                branch = 1 ;
                jump = 0 ;
                ALU_src = 0 ;
                ALU_op = 2'b01 ;
                imm_src = 2'b10 ;
                result_src = 1'bx ;
            end
            7'b0010011: begin // I-type Instruction
                reg_wr = 1 ;
                mem_wr = 0 ;
                mem_rd = 0 ;
                branch = 0 ;
                jump = 0 ;
                ALU_src = 1 ;
                ALU_op = 2'b10 ;
                imm_src = 2'b00 ;
                result_src = 1'b0 ;
            end
            default: begin
                reg_wr = 0;
                mem_wr = 0;
                mem_rd = 0 ;
                branch = 0;
                jump = 0 ;
                ALU_src = 0;
                ALU_op = 2'b00;
                imm_src = 2'b00;
                result_src = 1'b1 ;
            end
        endcase
    end
    
    
endmodule
