`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 19:15:15
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb ;
    reg [31:0] src1 ;                                
    reg [31:0] src2 ;                     
    reg [2:0] ALU_ctrl_out ;                 
    wire [31:0] ALU_result ;           
    wire Zero ;          
    wire Neg ;                  
    wire Carry ;                
    
ALU dut (.src1(src1),
         .src2(src2),
         .ALU_ctrl_out(ALU_ctrl_out),
         .ALU_result(ALU_result),
         .Zero(Zero),
         .Neg(Neg),
         .Carry(Carry)) ;
         
task test; 
    input [31:0]a ;
    input [31:0]b ;
    input [2:0]ctrl ;
        
    begin
    
     src1 = a;
     src2 = b;
     ALU_ctrl_out = ctrl ;
     #10 ;
    
    end
    
endtask

initial begin
    
    test('d7,'d2,3'b000) ;
    test('d6,'d3,3'b001) ;
    test('d5,'d4,3'b010) ;
    test('d4,'d5,3'b011) ;
    test('d3,'d6,3'b101 ) ;
    test('d2,'d7,3'b110) ;
        
    $finish ;
end                       
    
endmodule
