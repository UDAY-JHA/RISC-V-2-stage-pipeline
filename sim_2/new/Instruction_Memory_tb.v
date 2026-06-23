`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 13:45:35
// Design Name: 
// Module Name: Instruction_Memory_tb
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


`timescale 1ns / 1ps

module Instruction_Memory_tb;

    reg [31:0] pc_in;
    wire [31:0] instr;

    Instruction_Memory uut (
        .pc_in(pc_in),
        .instr(instr)
    );

    task apply_test;
        input [31:0] t_pc;
        begin
            pc_in = t_pc;
            #10;
        end
    endtask

    initial begin

        apply_test(32'd0);
        apply_test(32'd4);
        apply_test(32'd8);
        apply_test(32'd12);
        apply_test(32'd16);
        apply_test(32'd20);
        apply_test(32'd24);
        apply_test(32'd28);
        apply_test(32'd32);
       

        $finish;

    end

endmodule
