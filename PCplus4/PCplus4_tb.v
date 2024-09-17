`timescale 1ps/1ps
module PC_plus4_tb();
    reg clk;                    
    reg rst_n;                
    wire [31:0] pc_out;         

    PC_PCplus4 uut (
        .clk(clk),
        .rst_n(rst_n),
        .pc_out(pc_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;

        #10 rst_n = 1;


        #500; // run simualtion in 500ns
        
        $finish;
    end

    always @(posedge clk) begin
        $display("PC = %d", pc_out);
    end

endmodule