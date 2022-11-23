`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2022/11/23 15:39:25
// Design Name: 
// Module Name: DivideNum_t
//////////////////////////////////////////////////////////////////////////////////
module DivideNum_t;
    parameter N = 16;
    reg clk; 
    reg reset;
    reg enable;
    reg [15:0]dividend;
    reg [15:0]divisor;
    wire [15:0]quotient;
    wire [15:0]remainder;
    wire checkflag;

    DivideNum #(.N(N)) UUT(
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder),
        .checkflag(checkflag)
    );

    always #1 clk = ~clk;
    initial begin
    clk = 1;
    reset = 1;
    enable = 0;
    dividend = 16'd100;
    divisor = 16'd5;
    # 2 reset = 0;
    enable = 1;
    dividend = 16'd57600;
    divisor = 16'd150;
    #32;
    enable = 0;
    end
endmodule