`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] src1,                      //ALU_ctrl = 000  add             
    input [31:0] src2,                      //ALU_ctrl = 001  sub
    input [2:0] ALU_ctrl_out,                    //ALU_ctrl = 010 and
    output reg [31:0] ALU_result,            //ALU_ctrl = 011  or
    output reg Zero,                         //ALU_ctrl = 101  slt
    output reg Neg,                           //ALU_ctrl = 110 xor
    output reg Carry                          
    );
    
    reg [32:0]sum ;  
    
    always @(*) begin
        case(ALU_ctrl_out)
             3'b000: ALU_result = src1 + src2 ;  //add
             3'b001: ALU_result = src1 - src2 ; //sub
             3'b010: ALU_result = src1 & src2 ; //and
             3'b011: ALU_result = src1 | src2 ;  //or
             3'b101: if(src1 < src2) ALU_result = 1 ; //slt
             3'b110: ALU_result = src1 ^ src2 ; //xor
             default: ALU_result = 32'b0 ;
        endcase
        
        if(!ALU_result) Zero = 1 ;
        else Zero = 0 ;
        
        if(ALU_result[31] == 1) Neg = 1 ;
        else Neg = 0 ;
        
        sum = src1 + src2 ;
        if(sum[32]) Carry = 1 ;
        else Carry = 0 ;
    end
    
    
endmodule
