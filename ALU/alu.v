module alu
#(
    parameter ADD_ALU = 4'b0000,
    parameter SUB_ALU = 4'b0001,
    parameter XOR_ALU = 4'b0010,
    parameter OR_ALU  = 4'b0011,
    parameter AND_ALU = 4'b0100,
    parameter SLL_ALU = 4'b0101,
    parameter SRL_ALU = 4'b0110,    //SRL (shift right logical)
    parameter SRA_ALU = 4'b0111,    //SRL (shift right arith)
    parameter SLT_ALU = 4'b1000,    //set less than
    parameter SLTU_ALU = 4'b1001    //set less than unsigned
)(
    input [3:0] ALUControl,
    input [31:0] SrcA,
    input [31:0] SrcB,
    output reg [31:0] ALUResult
    //output reg zero
);
//assign zero = (ALUResult == 32'b0);
always @(ALUControl, SrcA, SrcB) begin
    case(ALUControl)
        ADD_ALU: ALUResult = SrcA + SrcB;
        SUB_ALU: ALUResult = SrcA - SrcB;
        XOR_ALU: ALUResult = SrcA ^ SrcB;
        OR_ALU:  ALUResult = SrcA | SrcB;
        AND_ALU: ALUResult = SrcA & SrcB;
        SLL_ALU: ALUResult = SrcA << SrcB[4:0];
        SRL_ALU: ALUResult = SrcA >> SrcB[4:0];
        SRA_ALU: ALUResult = $signed(SrcA) >>> SrcB[4:0];
        SLT_ALU: ALUResult = ($signed(SrcA) < $signed(SrcB)) ? 1 : 0;
        SLTU_ALU: ALUResult = (SrcA < SrcB) ? 1 : 0;
    endcase
end
endmodule