module PC_PCplus4(
    input clk,
    input rst_n,
    output [31:0] pc_out

);
wire [31:0] pc_current;
wire [31:0] pc_next;
assign pc_out = pc_current;
PC dut2(
    .clk(clk),
    .rst_n(rst_n),
    .pc_in(pc_next),
    .pc_out(pc_current)
);

PCplus4 dut1(
    .pc(pc_current),
    .pc_plus4(pc_next)
);
endmodule

module PC(
    input clk,
    input rst_n,
    input [31:0] pc_in,
    output reg [31:0] pc_out
);
always @(posedge clk or negedge rst_n)begin
  if(~rst_n) begin
    pc_out <= 32'b0;
  end
  else begin
    pc_out <= pc_in;
  end
end
endmodule
