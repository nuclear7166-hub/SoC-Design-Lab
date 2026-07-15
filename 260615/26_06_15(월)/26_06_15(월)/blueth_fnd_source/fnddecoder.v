`timescale 1ns / 1ps
module fnddecoder(
  input [3:0] a,
  output reg [6:0] fnd
);

always @(a) begin
case(a)
4'd0 : fnd = 7'b1000000; //0
4'd1: fnd = 7'b1111001; //1
4'd2 : fnd = 7'b0100100; //2
4'd3 : fnd = 7'b0110000; //3
4'd4 : fnd = 7'b0011001; //4
4'd5 : fnd = 7'b0010010; //5
4'd6 : fnd = 7'b00000010; //6
4'd7 : fnd = 7'b1011000; //7
4'd8: fnd = 7'b00000000; //8
4'd9 : fnd = 7'b00010000; //9
default : fnd = 7'b1111111;
endcase  
    end
endmodule
