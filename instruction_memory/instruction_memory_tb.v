`timescale 1ps/1ps
module instruction_memory_tb();
    reg [31:0] address;
    wire [31:0] instruction;

instruction_memory ins_mem(
    .address(address),
    .instruction(instruction)
);
initial begin
    address = 32'd0;
    #5;
    address = 32'd4;
    #5;
end
endmodule