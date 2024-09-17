`timescale 1ps/1ps
module RISCV_single_clock_top_tb();
    reg clk;
    reg rst_n;
    wire [31:0] ALUResult;
RISCV_single_clock_top dut(
    .clk(clk),
    .rst_n(rst_n),
    .ALUResult(ALUResult)
);

always #5 clk = ~clk;
initial begin
    clk = 0;
    rst_n = 0;

    #10 rst_n = 1;
    #10000;
    $finish;
end
endmodule