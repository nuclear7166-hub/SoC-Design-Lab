`timescale 1ns / 1ps
module FNDdisplay(reset, clk, RxData,rxdata100,rxdata10,rxdata0);

	input				reset;
	input				clk;
	input   [7:0]   RxData;

	output reg [3:0] rxdata100, rxdata10, rxdata0;

// always for converting to integer
	always @ (RxData) begin
				rxdata100 <= RxData/100;
//				rxdata10 <= (RxData - (RxData/100)*100)/10;
				rxdata10 <= RxData/10%10;
				rxdata0 <= RxData % 10;
			end
	

endmodule