`timescale 1ns / 1ps
module clockdivider(
input clk,
input reset,	
output reg clk1000Hz
    );
    reg [25:0] cnt =0;

    //1000Hz¹ß»ý
    always @(posedge clk,negedge reset)begin
        if(~reset)begin
        cnt <=0;
       end else begin
        if(cnt >=49_999)begin
        cnt<=0;
        clk1000Hz <= ~clk1000Hz;
        end else begin
        cnt <= cnt +1;
        end
        end
    end
endmodule