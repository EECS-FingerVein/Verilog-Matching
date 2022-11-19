`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 
// Design Name: 
// Module Name: SquareRoot
//////////////////////////////////////////////////////////////////////////////////

module SquareRoot(outdata,checkflag,clk,indata);
 input wire clk;
 input wire [31:0] indata;
 output reg [15:0] outdata = 0;
 output reg checkflag = 0;
 
 reg [31:0] buffdata = 32'b0;
 reg [2:0] state = 4'd0;
 reg [15:0] num_test = 16'd0; 
 integer shiftnum= 0;
 
 always @(posedge clk)
 begin
    case(state)
    4'd0:
    begin
        buffdata <= indata;
        num_test <= 16'd0;
        shiftnum =0;  
        state <= 4'd1;   
        checkflag <= checkflag;
    end
    4'd1:
    begin
        checkflag <= 0;
        num_test <= num_test+(16'h8000 >>shiftnum);
        if(shiftnum >= 16)
            state <= 4'd3;
        else
            state <= 4'd2;
    end
    4'd2:
    begin
        if(num_test*num_test > buffdata)
            begin
            num_test <= num_test-(16'h8000 >> shiftnum);
            end
        shiftnum = shiftnum +1;
        state <= 4'd1;   
    end  
    4'd3:
    begin
        outdata <= num_test;
        checkflag <= 1;
        state <=4'd0;
    end   
    endcase 
 end  
endmodule
