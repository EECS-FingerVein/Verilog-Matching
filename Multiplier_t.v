`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 
// Design Name: 
// Module Name: Multiplier_t
//////////////////////////////////////////////////////////////////////////////////
module Multiplier_t;
    reg clk; 
    reg reset;
    reg [15:0]A;
    reg [3:0]B;
    wire [31:0]outProduct;

    Multiplier  UUT(
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
    A = 16'd6;
    B = 16'd5;
    # 2;
    A = 16'd6;
    B = 16'd5;
    # 100;
    A = 16'd7;
    B = 16'd8;
    # 100;
    end
endmodule