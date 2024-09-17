module instruction_memory(
    input   [31:0]  address,
    output  reg [31:0]  instruction);

// Instruction memory array (ROM)    
reg [31:0] memory[63:0]; //64 register 32 bit=> số lượng địa chỉ(vị trí) bộ nhớ => bộ nhớ ROM có thể chứa 64 lệnh

initial begin
    memory[0] = 32'b0000000_00010_00001_000_00011_0110011;  // add x3, x1, x2
    memory[1] = 32'b0100000_00010_00001_000_00011_0110011;  // sub x3, x1, x2
    memory[2] = 32'b0000000_00101_00100_111_00110_0110011;  // and x6, x4, x5
    memory[3] = 32'b0000000_00101_00100_110_00110_0110011;  // or  x6, x4, x5
    memory[4] = 32'b0000000_00101_00100_100_00110_0110011;  // xor x6, x4, x5
    memory[5] = 32'b0000000_00010_00001_001_00011_0110011;  // sll x3, x1, x2
    memory[6] = 32'b0000000_00010_00001_101_00011_0110011;  // srl x3, x1, x2
    memory[7] = 32'b0100000_00010_00001_101_00011_0110011;  // sra x3, x1, x2
    memory[8] = 32'b0000000_00010_00001_011_00011_0110011;  //sltu x3, x1, x2
    memory[9] = 32'b0000000_00010_00001_010_00011_0110011;  // slt x3, x1, x2
end
always @(address, instruction) begin
	instruction = memory[address[31:2]]; //[31:2] vi address cua memory la 0, 1, 2 ,3. Neu de [31:0] thi address memory phai la 0, 4, 8, 12
end
endmodule

