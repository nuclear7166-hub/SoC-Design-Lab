`timescale 1ns / 1ps

module datamux4x1 (
    input  [3:0] ina, inb, inc, ind, ine, inf,
    input  [1:0] insel,
    input   mode,
    output reg [3:0] outy
);


  always @(insel or mode) 
  begin : datamux4x1
    if (mode == 1'b0) begin
    case (insel)
      2'b00: outy = ina;
      2'b01: outy = inb;
      2'b10: outy = ine;
      2'b11: outy = inf;
    endcase 
    end else
    if (mode == 1'b1) begin
     case (insel)
      2'b00: outy = inc;
      2'b01: outy = ind;
      2'b10: outy = ine;
      2'b11: outy = inf;
      endcase
      end
  end
endmodule