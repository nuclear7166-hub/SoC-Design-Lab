`timescale 1ns / 1ps
module datamux4x1 (
    input  [3:0] ina, inb, inc, ind,
    input  [1:0] insel,
    output reg [3:0] outy
);
  always @(insel) 
  begin : datamux4x1

    case (insel)
      2'b00: outy = ina;
      2'b01: outy = inb;
      2'b10: outy = inc;
      2'b11: outy = ind;
    endcase
  end
endmodule