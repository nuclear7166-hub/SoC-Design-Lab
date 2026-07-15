`timescale 1ns / 1ps

module fnddecoder(
input  [3:0] a,
input reset,
 //   input clk,
    output  reg [6:0] fnd    
    );
//reg [7:0] fndout;
//assign fnd = fndout;
    always @ (a) begin
    if (reset==1'b0)
     fnd = 7'b1111111;
     else
        case (a)
			4'b0000 : fnd = 7'b1000000; //0
			4'b0001 : fnd = 7'b1111001; //1
			4'b0010 : fnd = 7'b0100100; //2
			4'b0011 : fnd = 7'b0110000; //3
			4'b0100 : fnd = 7'b0011001; //4
			4'b0101 : fnd = 7'b0010010; //5
			4'b0110 : fnd = 7'b00000010; //6
			4'b0111 : fnd = 7'b1011000; //7
			4'b1000 : fnd = 7'b00000000; //8
			4'b1001 : fnd = 7'b00010000; //9
			4'b1010 : fnd = 7'b0100000; //10
			4'b1011 : fnd = 7'b0000011; //11
			4'b1100 : fnd = 7'b0100111; //12
			4'b1101 : fnd = 7'b0100001; //13
			4'b1110 : fnd = 7'b0000100; //14
			4'b1111 : fnd = 7'b0001110; //15
         
            default:  fnd = 8'hff;
        endcase
    end
endmodule
