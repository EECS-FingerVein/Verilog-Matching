`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2022/11/19 16:53:28
// Design Name: 
// Module Name: SquareRoot_t
//////////////////////////////////////////////////////////////////////////////////
module SquareRoot_t();
    reg clk;
    reg [31:0]indata = 32'd1000;
    //reg shiftnum = 0;
    wire [15:0] outdata;
    wire checkflag;
    
    SquareRoot UUT(
    .clk(clk),
    .indata(indata),     
    .outdata(outdata),
    .checkflag(checkflag)
    );
    
    always #1 clk=~clk;
    initial begin
        clk=1'b1;
        indata=32'd57200;
        #10
        indata = 32'd57200;
    forever
    begin 
        if(indata>0)
        begin
            #100 indata = indata-32'd1;
        end
    end
    end    
endmodule
