`timescale 1ns / 1ps
module clockdivider (
    input  clk,
    input  reset,
    output reg  clk1Mhz,
    output reg  clk1000hz
);
  reg [25:0] cnt = 0;
  always @(posedge clk or negedge reset) begin
    if (~reset) begin
      cnt <= 0;
      clk1Mhz <= 0;
    end else begin
      if (cnt == (50 - 1)) begin
        cnt <= 0;
        clk1Mhz <= ~clk1Mhz;
      end else begin
        cnt <=  cnt + 1;
      end
    end
  end
  
    reg [25:0] cnt1 = 0;
  always @(posedge clk or negedge reset) begin
    if (~reset) begin
      cnt1 <= 0;
      clk1000hz <= 0;
    end else begin
      if (cnt1 == (50000 - 1)) begin
        cnt1 <= 0;
        clk1000hz <= ~clk1000hz;
      end else begin
        cnt1 <=  cnt1 + 1;
      end
    end
  end
endmodule