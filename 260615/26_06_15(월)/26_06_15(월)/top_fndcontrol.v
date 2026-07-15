`timescale 1ns / 1ps
module top_fndcontrol(
    input clk,
    input reset,
    input  [3:0] row,
    output [3:0] col,
    output  [3:0] fndsel,
    output  [7:0] fnd,
    output  [3:0] countbit
);
wire  w_clkout;
wire [1:0] w_counter;
wire [3:0] w_datafnd;
wire [3:0] row,col;
wire [3:0] ina,inb,inc,ind;
wire [3:0] key_value;

keypad keypad(
      .clk(clk),
      .reset(reset),
      .row(row),
     .col(col),
    .key_value(key_value),
    .clk1000hz(w_clkout),
    .key_pressed_flag(key_pressed_flag),
    .clk50hz(clk50hz)

);
    counter U0 (
      .inclk(w_clkout),
      .reset(reset),
      .out_counter(w_counter)
      );
      
   clockdivider U1 (
      .clk(clk),
      .reset(reset),
      .clk1000Hz(w_clkout),
      .clk50hz(clk50hz)
  ); 
    datamux4x1 U2 (
      .ina  (ina),
      .inb  (inb),
      .inc  (inc),
      .ind  (ind),
      .insel(w_counter),
      .outy  (w_datafnd)
  );  
  mux4x1 U3 (
//  .clk(clk),
      .s(w_counter),
      .y(fndsel)
  );
fnddecoder U4 (
 //     .clk(clk),
      .a(w_datafnd),
      .fnd(fnd)
  );
  
 calculator U5 (
.reset(reset),
.key_value(key_value),
.key_pressed_flag(key_pressed_flag),
.digit0(ina),
.digit1(inb),
.digit2(inc),
.digit3(ind),
.clk1000hz(w_clkout),
.countbit(countbit)
);
  
endmodule