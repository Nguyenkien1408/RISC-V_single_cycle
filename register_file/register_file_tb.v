`timescale 1ps / 1ps

module register_file_tb;

reg clk;
reg WE3;        // Write enable
reg [31:0] WD3; // Data to write
reg [4:0] A1, A2, A3; // Address inputs
wire [31:0] RD1, RD2; // Read outputs

// Khởi tạo module register_file
register_file uut (
    .clk(clk),
    .WE3(WE3),
    .WD3(WD3),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .RD1(RD1),
    .RD2(RD2)
);

// Tạo xung clock
always #10 clk = ~clk; // Clock cycle là 20ns

initial begin
    clk = 0;
    WE3 = 0; A1 = 0; A2 = 0; A3 = 0; WD3 = 0;
    
    // Test Case 1: Write and Read from Register
    @(posedge clk) begin
        WE3 = 1; A3 = 5; WD3 = 32'd100; // Ghi giá trị 100 vào thanh ghi 5
    end
    @(posedge clk) begin
        WE3 = 0; A1 = 5; // Đọc giá trị từ thanh ghi 5
    end
    #500;
    // @(posedge clk);
    // $display("RD1 should be 100, RD1 = %d", RD1);

    // // Test Case 2: Check Register x0 is always zero
    // @(posedge clk) begin
    //     A1 = 0; // Đọc giá trị từ thanh ghi 0
    // end
    // @(posedge clk);
    // $display("RD1 should be 0 (x0 register), RD1 = %d", RD1);

    // // Test Case 3: Simultaneous Read
    // @(posedge clk) begin
    //     A1 = 1; A2 = 2; // Đọc giá trị từ thanh ghi 1 và 2 (khởi tạo sẵn trong module)
    // end
    // @(posedge clk);
    // $display("RD1 should be 7, RD1 = %d", RD1);
    // $display("RD2 should be 8, RD2 = %d", RD2);

    // Kết thúc mô phỏng
    $finish;
end

endmodule
