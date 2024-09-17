module main_decoder(
    input [6:0] op,
    //output reg branch, //PCSrc = branch & zero | jump;
    //output reg jump,
    //output reg [1:0] ResultSrc, 
    //output reg MemWrite,
    output reg [1:0] ALUop,
    //output reg ALUSrc,
    //output reg [1:0] ImmSrc,
    output reg RegWrite_en
);
always @(op) begin
    case (op)
        7'b0110011: begin //R-type
            //branch = 0;
            //jump = 0;
            //ResultSrc = 2'b01;
            //MemWrite = 0;
            ALUop = 2'b10;
            //ALUSrc = 0;
            //ImmSrc = 2'b00;
            RegWrite_en = 1;
        end
        7'b0010011: begin // I-Type (imediate)
            //branch = 0;
            //jump = 0;
            //ResultSrc = 2'b01;
            //MemWrite = 0;
            ALUop = 2'b10;
            //ALUSrc = 1;
            //ImmSrc = 2'b00;
            RegWrite_en = 1;
        end
        7'b0100011: begin // S-Type (store)
            //branch = 0;
            //jump = 0;
            //ResultSrc = 2'b00;
            //MemWrite = 1;
            ALUop = 2'b00;
            //ALUSrc = 1;
            //ImmSrc = 2'b01;
            RegWrite_en = 0;
        end
        7'b0000011: begin // L-Type (load)
            //branch = 0;
            //jump = 0;
            //ResultSrc = 2'b10;
            //MemWrite = 0;
            ALUop = 2'b00;
            //ALUSrc = 1;
            //ImmSrc = 2'b00;
            RegWrite_en = 1;
        end
        7'b1100011: begin // B-Type (branch)
            //branch = 1;
            //jump = 0;
            //ResultSrc = 2'b00;
            //MemWrite = 0;
            ALUop = 2'b01;
            //ALUSrc = 0;
            //ImmSrc = 2'b10;
            RegWrite_en = 0;
        end
        7'b1101111: begin // J-Type
            //branch = 0;
            //jump = 1;
            //ResultSrc = 2'b10;
            //MemWrite = 0;
            ALUop = 2'b00;
            //ALUSrc = 0;
            //ImmSrc = 2'b11;
            RegWrite_en = 1;
        end
    endcase
end

endmodule