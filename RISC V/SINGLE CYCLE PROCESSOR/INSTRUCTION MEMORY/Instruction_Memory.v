`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    input [31:0] pc,
    output [31:0] instr
    );
    
    reg [31:0]mem[63:0] ; 
    //mem is preloaded by assembler, as soon as user gives instructions.
    // assembler converts assembly language to machine language  
    
    //initializing rom with programm instructions.
       assign instr = mem[pc[31:2]] ;
       
    initial begin
           // addi x5, x0, 4
    mem[0] = 32'h00400293;

    // addi x6, x0, 5
    mem[1] = 32'h00500313;

    // addi x7, x0, 6
    mem[2] = 32'h00600393;

    // sw x5, 0(x0)
    mem[3] = 32'h00502023;

    // sw x6, 4(x0)
    mem[4] = 32'h00602223;

    // sw x7, 8(x0)
    mem[5] = 32'h00702423;

    // add x5, x6, x7
    mem[6] = 32'h007302B3;

    // and x5, x5, x7
    mem[7] = 32'h0072F2B3;

    // or x5, x6, x7
    mem[8] = 32'h007362B3;

    // nop
    mem[9] = 32'h00000013;
    end

 
    
    // pc = 0,4,8,12 etc
    //binary 0 = 0000000000000000000000000000000 last 2 bits are always 0
    //binary 4 = 0000000000000000000000000000100 4 mem locations can be identified at once by first 30 bits
endmodule
