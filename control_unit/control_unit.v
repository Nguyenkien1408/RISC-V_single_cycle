module control_unit(
    input [6:0] op,
    //input zero,
    //output PCSrc,
    //output reg [1:0] ResultSrc,
    //output reg MemWrite,
    //output reg ALUSrc,
    //output reg [1:0] ImmSrc,
    output RegWrite_en,
    output [3:0] ALUControl,
    input [2:0] funct3,
    input [6:0] funct7
);
//wire branch;
//wire jump;
wire [1:0] ALUop;
main_decoder mainDecoder(
    .op(op),
    //.branch(branch),
    //.jump(jump),
    //.ResultSrc(ResultSrc),
    //.MemWrite(MemWrite),
    //.ALUSrc(ALUSrc),
    //.ImmSrc(ImmSrc),
    .RegWrite_en(RegWrite_en),
    .ALUop(ALUop)
);

ALUdecoder ALUdecoder_inst(
    .op(op),
    .funct3(funct3),
    .funct7(funct7),
    .ALUop(ALUop),
    .ALUControl(ALUControl)
);
//assign PCSrc = jump | (zero & branch);
endmodule