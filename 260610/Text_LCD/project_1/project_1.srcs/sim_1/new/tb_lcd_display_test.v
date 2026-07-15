`timescale 1ns / 1ps
module tb_lcd_display_test;

parameter STEP = 20;

reg clk, rst;
wire lcd_rs, lcd_rw, lcd_e;
wire [7:0] lcd_data;

lcd_display_test U0(
    .clk(clk),
    .rst(rst),
    .lcd_rs(lcd_rs),
    .lcd_rw(lcd_rw),
    .lcd_e(lcd_e),
    .lcd_data(lcd_data) );
    
    initial begin
        clk = 0; rst = 1; #(STEP/2);
        rst = 0; #30;
        rst = 1;
        #(STEP*10_000_000);
        $stop;
    end
    
    always #(STEP/2) clk = ~clk;
endmodule
