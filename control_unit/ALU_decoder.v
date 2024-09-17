module ALUdecoder
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
    parameter SLTU_ALU = 4'b1001    //set less than (U)
)(
    input [6:0] op,
    input [2:0] funct3,
    input [6:0] funct7,
    input [1:0] ALUop,
    output reg [3:0] ALUControl
);

always @(funct3, funct7, ALUop) begin
    ///----------------- R-type & I-type ----------------///
    if(ALUop == 2'b10) begin
        case (funct3)
            3'b000: begin
                if(funct7 == 7'b0000000)begin
                    ALUControl = ADD_ALU; //ADD
                end
                else if(funct7 == 7'b0100000) begin
                  ALUControl = SUB_ALU;  //sub
                end
                else ALUControl = ADD_ALU; //ADD imediate
            end
            3'b100: begin //XOR
                ALUControl = XOR_ALU;
            end
            3'b110: begin //OR
                ALUControl = OR_ALU;
            end
            3'b111: begin //AND
                ALUControl = AND_ALU;
            end
            3'b001: begin //SLL (shift left logical)
                ALUControl = SLL_ALU;
            end
            3'b101: begin //SRL (shift right logical)
                if(funct7 == 7'b0000000) begin
                    ALUControl = SRL_ALU;
                end
                else if(funct7 == 7'b0100000) begin
                  ALUControl = SRA_ALU;
                end
                else ALUControl = SRL_ALU;
            end
            3'b010: begin //set less than
                ALUControl = SLT_ALU;
            end
            3'b011: begin //set less than (U)
                ALUControl = SLTU_ALU;
            end
            default: ALUControl = ADD_ALU;
        endcase
    end
    
end

endmodule