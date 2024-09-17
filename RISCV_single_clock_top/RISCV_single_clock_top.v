module RISCV_single_clock_top(
    input clk,
    input rst_n,
    output [31:0] ALUResult //for test
);

wire [31:0] pc_address;
PC_PCplus4 PC_PCplus4_inst(
  .clk(clk),
  .rst_n(rst_n),
  .pc_out(pc_address)
);

wire [31:0] instruction_out;
instruction_memory instruction_memory_inst(
  .address(pc_address),
  .instruction(instruction_out)
);
/////////////////////////////////////////////////////////
wire [6:0] op_code;
assign op_code = instruction_out[6:0];
/////////////////////////////////////////////////////////
wire [2:0] funct3;
wire [6:0] funct7;
assign funct3 = instruction_out[14:12];
assign funct7 = instruction_out[31:25];
////////////////////////////////////////////////////////
wire [4:0] addr1, addr2, addr_target;
assign addr1 = instruction_out[19:15];
assign addr2 = instruction_out[24:20];
assign addr_target = instruction_out[11:7];
/////////////////////////////////////////////////////////
wire [31:0] reg_data1, reg_data2;
wire reg_write_en;
//wire [31:0] ALUResult;
////////////////////////////////////////////////////////
register_file register_file_inst(
  .clk(clk),
  .WE3(reg_write_en),
  .WD3(ALUResult),
  .A1(addr1),
  .A2(addr2),
  .A3(addr_target),
  .RD1(reg_data1),
  .RD2(reg_data2)
);

wire [3:0] ALUControl;
control_unit control_unit_inst(
  .op(op_code),
  .RegWrite_en(reg_write_en),
  .ALUControl(ALUControl),
  .funct3(funct3),
  .funct7(funct7)
);

alu alu_inst(
  .ALUControl(ALUControl),
  .SrcA(reg_data1),
  .SrcB(reg_data2),
  .ALUResult(ALUResult)
);

endmodule

