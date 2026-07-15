`timescale 1ns / 1ps

module top_pwm( 
    reset, clk, i_ocr, i_en, i_dir, o_dir, 
    o_motor_pwm, w_counter, w_clkout
);

input reset;
input clk;
input [7:0] i_ocr;
input i_en;
input [1:0] i_dir;
output [1:0] o_dir;
output o_motor_pwm;
output [7:0] w_counter;
output w_clkout;

clockdivider_pwm U0 (
    .inclk(clk),
    .reset(reset),
    .clk_out(w_clkout)
); 

counter U1 (
    .inclk(w_clkout),
    .reset(reset),
    .out_counter(w_counter)
);
 
 wire [7:0] w_counter;
 wire [7:0] i_ocr;
 wire [1:0] i_dir;
 wire [1:0] o_dir;


compare U2 (
    .count(w_counter),
    .i_ocr(i_ocr),
    .i_en(i_en),
    .out_pwm(o_motor_pwm)
);   

Run_Control U3 (
    .i_direction(i_dir),
    .o_direction(o_dir),
    .i_en(i_en)
);  

 endmodule