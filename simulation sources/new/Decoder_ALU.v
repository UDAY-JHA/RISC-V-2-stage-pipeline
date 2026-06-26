`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 13:43:58
// Design Name: 
// Module Name: Decoder_ALU
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


module Decoder_ALU(
    input [1:0] ALU_op,
    input [2:0] func3,
    input [6:0] func7,
    output reg [2:0] ALU_ctrl_in
    );
    
    always @(*) begin
        case(ALU_op)
            2'b00 : ALU_ctrl_in = 3'b000 ; //add
            2'b01 : ALU_ctrl_in = 3'b001 ; //sub
            2'b10 : begin case(func3)
                        3'b000: case(func7)
                                    2'b00: ALU_ctrl_in = 3'b000 ; //add
                                    2'b01: ALU_ctrl_in = 3'b000 ; //add
                                    2'b10: ALU_ctrl_in = 3'b000 ; //add
                                    default:  ALU_ctrl_in = 3'bxxx ;
                                endcase
                        3'b000: case(func7)
                                    2'b11: ALU_ctrl_in = 3'b001 ; //sub
                                    default:  ALU_ctrl_in = 3'bxxx ;
                                endcase
                        3'b010:  ALU_ctrl_in = 3'b101 ; //slt set less than
                        3'b110:  ALU_ctrl_in = 3'b011 ; //or
                        3'b111:  ALU_ctrl_in = 3'b010 ; //and
                        3'b100:  ALU_ctrl_in = 3'b110 ; //xor
                        default:  ALU_ctrl_in = 3'bxxx ;
                    endcase
                    end
            default:  ALU_ctrl_in = 3'bxxx ;
        endcase
    end
endmodule
