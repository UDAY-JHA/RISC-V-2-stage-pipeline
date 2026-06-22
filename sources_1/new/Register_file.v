`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: Register_file
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


module Register_File(
    input [4:0] rs1,
    input clk,
    input [4:0] rs2,
    input [4:0] rd_out,
    input reg_wr_out,
    input [31:0] wr_data,
    output reg [31:0] data1_in,
    output reg [31:0] data2_in
    );
    
    reg [31:0]file[0:31] ; //32 registers each of 32 bits
    
    //data is written sequentially
    always @(posedge clk) begin
        if(reg_wr_out) file[rd_out] <= wr_data ;
    end
    
    //data is read combinationally
    always @(*) begin
          data1_in = file[rs1] ;
          data2_in = file[rs2] ;
    end
    
    initial begin
        file[0] = 'd0 ;
        file[1] = 'd1 ;
        file[2] = 'd2 ;
        file[3] = 'd3 ;
        file[4] = 'd4 ;
        file[5] = 'd5 ;
        file[6] = 'd6 ;
        file[7] = 'd7 ;
        file[8] = 'd8 ;
        file[9] = 'd9 ;
        file[10] = 'd0 ;
        file[11] = 'd1 ;
        file[12] = 'd2 ;
        file[13] = 'd3 ;
        file[14] = 'd4;
        file[15] = 'd5 ;
        file[16] = 'd6 ;
        file[17] = 'd7 ;
        file[18] = 'd8 ;
        file[19] = 'd9 ;
        file[20] = 'd0 ;
        file[21] = 'd1 ;
        file[22] = 'd2 ;
        file[23] = 'd3 ;
        file[24] = 'd4 ;
        file[25] = 'd5 ;
        file[26] = 'd6 ;
        file[27] = 'd7 ;
        file[28] = 'd8 ;
        file[29] = 'd9 ;
        file[30] = 'd0 ;
        file[31] = 'd1 ;
    end
    
endmodule
