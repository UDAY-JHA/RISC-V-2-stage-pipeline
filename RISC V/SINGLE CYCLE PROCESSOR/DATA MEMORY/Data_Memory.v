`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input [31:0] data_address,
    input [31:0] wr_data,
    input clk,
    input rst,
    input mem_wr,
    output [31:0] rd_data
    );
    integer i ;
    reg [31:0]mem[0:31] ; //data memory  
    
    // read is a combinational operation
    //write is a sequential operation
    
    assign rd_data = mem[data_address[31:2]] ;
    
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            for(i = 0 ; i <= 31 ; i = i + 1 ) begin
                mem[i] = 0 ;
            end
        end
        else if(mem_wr) mem[data_address[31:2]] = wr_data ;          
    end
    
endmodule
