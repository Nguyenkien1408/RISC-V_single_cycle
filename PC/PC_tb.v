`timescale 1ps/1ps
module PC_tb();

reg clk;                      
reg rst_n;               
reg [31:0] pc_in;            
wire [31:0] pc_out;          

PC uut (
    .clk(clk),
    .rst_n(rst_n),
    .pc_in(pc_in),
    .pc_out(pc_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst_n = 0;
    pc_in = 32'd0;

    $display("Starting testbench...");

    // Reset PC về giá trị 0
    rst_n = 0;
    #10;
    rst_n = 1;
    $display("PC after reset: %d", pc_out);

    // Đưa giá trị mới vào pc_in và kiểm tra cập nhật PC
    pc_in = 32'd4;
    #10;
    $display("PC updated to: %d", pc_out);

    // Thay đổi giá trị pc_in và kiểm tra lại
    pc_in = 32'd8;
    #10;
    $display("PC updated to: %d", pc_out);

    // Tiếp tục thay đổi giá trị
    pc_in = 32'd12;
    #10;
    $display("PC updated to: %d", pc_out);

    // Kết thúc mô phỏng
    $display("Testbench completed.");
    $finish;
end

endmodule