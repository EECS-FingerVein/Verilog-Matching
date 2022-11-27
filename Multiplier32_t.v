`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 
// Design Name: 
// Module Name: Multiplier32_t
//////////////////////////////////////////////////////////////////////////////////
module Multiplier32_t;
    reg clk; 
    reg reset;
    reg [15:0]A;
    reg [15:0]B;
    wire [31:0]outProduct;

    Multiplier32  UUT(
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .outProduct(outProduct)
    );

    always #1 clk = ~clk;
    initial begin
    clk = 1;
    reset = 1;
    # 2;
    reset = 0;
    A = 16'd1000;
    B = 16'd5;
    # 10;
    A = 16'd250;
    B = 16'd300;
    # 10;
    A = 16'd765;
    B = 16'd8;
    # 10;
    A = 16'd30;
    B = 16'd1;
    # 10;
    end
endmodule
