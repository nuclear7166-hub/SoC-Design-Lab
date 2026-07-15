`timescale 1ns / 1ps
module fnddecoder(
input  [3:0] a,
    output  reg [7:0] fnd        );
always @ (a) begin
 case (a)
            4'h0 : fnd = 8'h40;
            4'h1 : fnd = 8'h79;
            4'h2 : fnd = 8'h24;
            4'h3 : fnd = 8'h30;
            4'h4 : fnd = 8'h19;
            4'h5 : fnd = 8'h12;
            4'h6 : fnd = 8'h02;
            4'h7 : fnd = 8'h58;
            4'h8 : fnd = 8'h00;
            4'h9 : fnd = 8'h10;
            4'ha : fnd = 8'h20;
            4'hb : fnd = 8'h03;
            4'hc : fnd = 8'h27;
            4'hd : fnd = 8'h21;
            4'he : fnd = 8'h04;
            4'hf : fnd = 8'h0e;            
            default:  fnd = 8'hff;
        endcase   end
endmodule
