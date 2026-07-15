`timescale 1ns / 1ps

module clockdivider #(parameter N=50_000) (
    input  clk,
    input  reset,
    output reg  clk1000Hz
);

  reg [25:0] cnt = 0;

  always @(posedge clk, negedge reset) begin
    if (~reset) begin
      cnt <= 0;
//      clkout <= 0;
    end else begin
      if (cnt == (50_000 - 1)) begin
        cnt <= 0;
        clk1000Hz <= ~clk1000Hz;
      end else begin
        cnt <=  cnt + 1;
      end
    end
  end

endmodule