`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 
// Design Name: 
// Module Name: Multiplier32
//////////////////////////////////////////////////////////////////////////////////
module Multiplier32(
 input clk,
 input reset,
 input [15:0]A,
 input [15:0]B,
 output [31:0]outProduct
    );
 wire [31:0]outP1;
 wire [31:0]outP2;
 wire [31:0]outP3;
 wire [31:0]outP4;
 wire [31:0]outPA1;
 wire [31:0]outPA2;
 
  Multiplier Xn1(clk,reset,A[15:0],B[3:0],outP1[31:0]);
  Multiplier Xn2(clk,reset,A[15:0],B[7:4],outP2[31:0]);
  Multiplier Xn3(clk,reset,A[15:0],B[11:8],outP3[31:0]);  
  Multiplier Xn4(clk,reset,A[15:0],B[15:12],outP4[31:0]); 
  assign outPA1 = outP1 +(outP2 <<4); 
  assign outPA2 = (outP3 << 8) +(outP4 << 12);   
  assign outProduct = outPA1 + outPA2;   
endmodule
