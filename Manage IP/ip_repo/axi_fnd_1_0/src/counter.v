`timescale 1ns / 1ps

module counter (
    input inclk,
    input reset,
    output reg [1:0] out_counter
);

//  reg [1:0] r_counter = 0;  // 선언할 때 초기화
//  assign o_counter = r_counter;

  always @(posedge inclk, negedge reset) begin
    if (~reset) begin
      out_counter <= 0;
    end else begin
      out_counter <= out_counter + 1;
    end

  end


endmodule