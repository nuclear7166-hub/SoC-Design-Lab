`timescale 1ns / 1ps

module top_fndcontrol2(
    input clk,
    input reset,
//    input en,
    input mode,
    input [3:0] btn,
//    input  [3:0] fndin,
//    input  [3:0] ina, inb, inc, ind,
    output  [3:0] fndsel,
    output  [6:0] fnd,
    output [7:0] led_out
//    output  [3:0] leda,
 //   output  [3:0] ledb
);


wire [7:0] led;
wire  w_clkout;
wire [1:0] w_counter;
wire [3:0] w_datafnd;
wire [3:0] w_outa, w_outb, w_outc, w_outd;
wire [3:0] leda;
wire  [3:0] ledb;
//wire [7:0] led;
assign w_outa = {3'b000,btn[0]};
//assign w_outa = btn[0:0];
assign w_outb = {2'b00,btn[1],1'b0};
//assign w_outb = btn[1:1];
assign w_outc = {1'b0,btn[2],2'b00};
//assign w_outc = btn[2:2];
assign w_outd = {btn[3],3'b000};
//assign w_outd = btn[3:3];
assign leda = led[3:0];
assign ledb = led[7:4];
assign led_out = {ledb, leda};
//wire [3:0] w_ina, w_inb;

    spi_task U0(
	.reset(reset)   ,
	.clock(clk)   ,
	.btn (btn)    ,
	.led(led)
    );


    counter U1 (
      .inclk(w_clkout),
      .reset(reset),
      .out_counter(w_counter)
  );  
   clockdivider U2 (
      .clk(clk),
      .reset(reset),
      .clk1000Hz(w_clkout)
  ); 
 
    datamux4x1 U3 (
      .mode(mode),
      .ina  (w_outa),
      .inb  (w_outb),
      .inc  (w_outc),
      .ind  (w_outd),
      .ine  (leda),
      .inf  (ledb),
      .insel(w_counter),
      .outy  (w_datafnd)
  );  


  mux4x1 U4 (
//  .clk(clk),
      .s(w_counter),
      .y(fndsel)
  );

  fnddecoder U5 (
 //     .clk(clk),
        .reset(reset),
      .a(w_datafnd),
 //       .a(fndin),
      .fnd(fnd)
  );

endmodule