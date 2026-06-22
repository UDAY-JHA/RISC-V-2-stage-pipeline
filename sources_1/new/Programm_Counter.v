`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: Programm_Counter
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


module Programm_Counter(
    input [31:0] PC_nxt,
    input clk,
    input rst,
    output reg [31:0] PC_in
    );
    
    
    always @(posedge clk or negedge rst) begin
        if(!rst) PC_in <= 32'b0 ;
        else PC_in <= PC_nxt ;
    end
endmodule
