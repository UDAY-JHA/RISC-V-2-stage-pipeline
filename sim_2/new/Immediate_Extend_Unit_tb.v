module Immediate_Extend_Unit_tb;

    reg [31:7] instr;
    reg [1:0] imm_src;
    wire [31:0] imm_data_in;

    Immediate_Extend_Unit uut (
        .instr(instr),
        .imm_src(imm_src),
        .imm_data_in(imm_data_in)
    );

    task test;
        input [31:7] t_instr;
        input [1:0] t_imm_src;
        begin
            instr = t_instr;
            imm_src = t_imm_src;
            #10;
        end
    endtask

    initial begin

        test({12'd100,13'd0}, 2'b00); //100
        test({12'hFFF,13'd0}, 2'b00); //-1
        test({12'h800,13'd0}, 2'b00); //800

        test({7'd1,13'd0,5'd18}, 2'b01);
        test({7'b1111111,13'd0,5'b01100}, 2'b01);

        test({1'b0,6'b000000,13'd0,4'b1000,1'b0}, 2'b10);
        test({1'b1,6'b111111,13'd0,4'b1100,1'b1}, 2'b10);

        test({1'b0,10'b0100000000,1'b0,8'b00000000,5'd0}, 2'b11);
        test({1'b1,10'b0000000000,1'b1,8'b11111111,5'd0}, 2'b11);
        test({1'b0,10'b1000000000,1'b0,8'b00000000,5'd0}, 2'b11);

        $finish;

    end

endmodule