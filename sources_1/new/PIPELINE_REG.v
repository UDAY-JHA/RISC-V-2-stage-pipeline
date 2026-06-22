`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 14:31:30
// Design Name: 
// Module Name: PIPELINE_REG
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


module PIPELINE_REG(
    input clk,
    input rst,

    input [31:0] PC_in,
    input [31:0] PCplus4_in,
    input [31:0] data1_in,
    input [31:0] data2_in,
    input [31:0] imm_data_in,
    input [4:0]  rd_in,
    input ALU_src_in,
    input result_src_in,
    input mem_rd_in,
    input mem_wr_in,
    input reg_wr_in,
    input branch_in,
    input jump_in,
    input [2:0] ALU_ctrl_in,

    output reg [31:0] PC_out,
    output reg [31:0] PCplus4_out,
    output reg [31:0] data1_out,
    output reg [31:0] data2_out,
    output reg [31:0] imm_data_out,
    output reg [4:0]  rd_out,

    output reg ALU_src_out,
    output reg result_src_out,
    output reg mem_rd_out,
    output reg mem_wr_out,
    output reg reg_wr_out,
    output reg branch_out,
    output reg jump_out,
    output reg [2:0] ALU_ctrl_out
);

always @(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        PC_out         <= 32'b0;
        PCplus4_out    <= 32'b0;
        data1_out      <= 32'b0;
        data2_out      <= 32'b0;
        imm_data_out   <= 32'b0;
        rd_out         <= 5'b0;

        ALU_src_out    <= 1'b0;
        result_src_out <= 1'b0;
        mem_rd_out     <= 1'b0;
        mem_wr_out     <= 1'b0;
        reg_wr_out     <= 1'b0;
        branch_out     <= 1'b0;
        jump_out       <= 1'b0;
        ALU_ctrl_out   <= 3'b0;
    end
    else
    begin
        PC_out         <= PC_in;
        PCplus4_out    <= PCplus4_in;
        data1_out      <= data1_in;
        data2_out      <= data2_in;
        imm_data_out   <= imm_data_in;
        rd_out         <= rd_in;

        ALU_src_out    <= ALU_src_in;
        result_src_out <= result_src_in;
        mem_rd_out     <= mem_rd_in;
        mem_wr_out     <= mem_wr_in;
        reg_wr_out     <= reg_wr_in;
        branch_out     <= branch_in;
        jump_out       <= jump_in;
        ALU_ctrl_out   <= ALU_ctrl_in;
    end
end

endmodule