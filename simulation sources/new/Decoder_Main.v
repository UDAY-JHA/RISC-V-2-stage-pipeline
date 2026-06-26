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
    output reg ALU_src_in,
    output reg [1:0]result_src_in,
    output reg mem_rd_in,
    output reg mem_wr_in,
    output reg reg_wr_in,
    output reg branch_in,
    output reg jump_in,
    output reg [2:0] imm_src,
    output reg [1:0] ALU_op
    );
    
    always @(*) begin
        case(op_code)
            7'b0000011: begin // Load Word Instruction(Mem to reg)
                reg_wr_in = 1;
                mem_wr_in = 0; 
                mem_rd_in = 1 ;
                branch_in = 0; //=0 if not B type, =1 if B type
                jump_in = 0 ;
                ALU_src_in = 1; // =0 if reg operand, =1 if imm operand
                ALU_op = 2'b00; 
                imm_src = 2'b00;   // = 0: I type, 1:S type, 2: B type, 3: J type 
                result_src_in = 2'b01 ; // = 0 if result is alu result, = 1 if mem result
            end
            7'b0110011: begin  // R type
                reg_wr_in = 1 ;
                mem_wr_in = 0 ;
                mem_rd_in = 0 ;
                branch_in = 0 ;
                jump_in = 0 ;
                ALU_src_in = 0 ;
                ALU_op = 2'b10 ;
                imm_src = 2'b00 ;
                result_src_in = 2'b00 ;
            end
            7'b0100011: begin // Store Word Instruction(reg to mem)
                reg_wr_in = 0 ;
                mem_wr_in = 1 ;
                mem_rd_in = 0 ;
                branch_in = 0 ;
                jump_in = 0 ;
                ALU_src_in = 1 ;
                ALU_op = 2'b00 ;
                imm_src = 2'b01 ;
                result_src_in = 2'bxx ;
            end
            7'b1100011: begin // Branch Instruction
                reg_wr_in = 0 ;
                mem_wr_in = 0 ;
                mem_rd_in = 0 ;
                branch_in = 1 ;
                jump_in = 0 ;
                ALU_src_in = 0 ;
                ALU_op = 2'b01 ;
                imm_src = 2'b10 ;
                result_src_in = 2'bxx ;
            end
            7'b0010011: begin // I-type Instruction
                reg_wr_in = 1 ;
                mem_wr_in = 0 ;
                mem_rd_in = 0 ;
                branch_in = 0 ;
                jump_in = 0 ;
                ALU_src_in = 1 ;
                ALU_op = 2'b10 ;
                imm_src = 2'b00 ;
                result_src_in = 2'b00 ;
            end
            default: begin
                reg_wr_in = 0;
                mem_wr_in = 0;
                mem_rd_in = 0 ;
                branch_in = 0;
                jump_in = 0 ;
                ALU_src_in = 0;
                ALU_op = 2'b00;
                imm_src = 2'b00;
                result_src_in = 2'b01 ;
            end
        endcase
    end
    
    
endmodule
