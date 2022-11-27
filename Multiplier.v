`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:
// Design Name: 
// Module Name: Multiplier
//////////////////////////////////////////////////////////////////////////////////
module Multiplier(
  input clk,
  input reset,
  input [15:0]A,
  input [3:0]B,
  output reg [31:0]outProduct
);
  reg [31:0] temp1;
  reg [31:0] temp2;
  reg [31:0] temp3;
  reg [31:0] temp4;
  
  reg [31:0] X1_add;
  reg [31:0] X2_add;

  always @ (posedge clk or posedge reset)
  begin
    if(reset)
      begin
        temp1 <= 32'b0;
        temp2 <= 32'b0;
        temp3 <= 32'b0;
        temp4 <= 32'b0;    
        X1_add <= 32'b0;
        X2_add <= 32'b0; 
        outProduct <= 32'b0; 
      end 
    else
        begin
            temp1 <= B[0] ? {16'b0,A} : 32'b0;
            temp2 <= B[1] ? {15'b0,A,1'b0} : 32'b0; 
            temp3 <= B[2] ? {14'b0,A,2'b0} : 32'b0;
            temp4 <= B[3] ? {13'b0,A,3'b0} : 32'b0;
      
            X1_add <= temp1 + temp2;
            X2_add <= temp3 + temp4;
           
            outProduct <= X1_add + X2_add;
         end
    end   
endmodule
