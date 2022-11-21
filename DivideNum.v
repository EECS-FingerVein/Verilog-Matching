`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2022/11/20 11:39:46
// Design Name: 
// Module Name: DivideNum
//////////////////////////////////////////////////////////////////////////////////
module DivideNum #(parameter N = 16)(
input clk,
input rstn,
input enable,
input [15:0]dividend, //³Q°£¼??
input [15:0]divisor,  //°£¼??
output reg [15:0] quotient,
output reg [15:0] remainder,
output reg checkflag
);

reg [1:0] state;
reg [1:0] state_next;
reg [31:0] dividend_next;
reg [15:0] remainder_next;
reg count;//??��?�為16

//idle   ==> 2'd0
//shift  ==> 2'd1
//done ==> 2'd2

always @ (posedge clk or negedge rstn)
begin 
    if(!rstn)
    begin
        count <= N;
        state <= 2'd0;
    end
    else
    begin
        state <= state_next;
        if(state == 2'd1)
            count <= count - 1;
        else    
            count <= N;
    end
end

always @ (*)
begin 
    case(state)
        3'd0:
        begin
            dividend_next <= 32'b0;
            checkflag <= 1'b0;
            if(enable)
                begin
                    dividend_next <= {(16'b0),dividend};
                    state_next <= 2'd1;  
                end
            else
                begin  
                    state_next <= 2'd0;
                end
        end
        3'd1://shift
        begin
            checkflag = 1'b0; 
            dividend_next <= (dividend_next << 1);
            if(dividend_next[31:16] >= divisor)
            begin
                dividend_next[0] <= 1'b1;
                dividend_next[31:16] <= dividend_next[31:16] - divisor; 
            end            
            else
            begin
                dividend_next <= dividend_next;
            end
            if (count == 1)
                state_next = 2'd2;
            else
                state_next = 2'd1;             
        end
        3'd2://done
        begin 
            quotient <= dividend_next[15:0];
            remainder <= dividend_next[31:16];
            checkflag = 1'b1;
            state_next <= 2'd0;         
        end
        default:
        begin
            checkflag = 1'b0;
            state_next <= 2'd0; 
        end
    endcase

end
endmodule
