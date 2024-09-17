module register_file(
    input clk,
    input WE3,        //write enabe (write or read ?)
    input [31:0] WD3, //data in
    input [4:0] A1, A2, // input address 1, 2
    input [4:0] A3,   //destination address
    output [31:0] RD1, RD2 //read data 1, 2
);
reg [31:0] register [31:0]; //32 registers 32-bit

initial begin
  register[1] = 32'd7;
  register[2] = 32'd8;  
  register[4] = 32'b1101;  
  register[5] = 32'b0110;  
end

always @(posedge clk)begin
  if(WE3) begin
    register[A3] <= WD3;
  end
end

assign RD1 = (A1==0)? 0: register[A1]; //trong kien truc RISC-V thanh ghi x0 luon chua gia tri 0
assign RD2 = (A2==0)? 0: register[A2];



endmodule