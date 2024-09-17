module muxSrcB(
    input ALUSrc,
    input [31:0] RD2,
    input [31:0] ImmExt,
    output [31:0] SrcB
);
assign SrcB = (ALUSrc == 1) ? ImmExt : RD2;
endmodule