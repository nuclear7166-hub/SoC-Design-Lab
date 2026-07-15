`timescale 1ns / 1ps
module lcd_display(
    clk,
    reset,
    lcd_rs,
    lcd_rw,
    lcd_e,
    lcd_data, hour, min, sec
    );
    
    input [7:0] hour, min, sec;
    input clk;
    input reset;
    output lcd_rs, lcd_rw, lcd_e;
    output [7:0] lcd_data;
    
    wire [7:0] hour, min, sec;
    wire [4:0] index_char;
    wire [7:0] data_char;
    wire en_clk;
    
    en_clk_lcd LCLK(
        .clk(clk),
        .reset(reset),
        .en_clk(en_clk) );
    
    lcd_display_string STR(
        .clk(clk),
        .reset(reset),
        .index(index_char),
        .out(data_char),
        .hour(hour),
        .min(min),
        .sec(sec) );
        
    lcd_driver DRV(
        .clk(clk),
        .rst(reset),
        .en_clk(en_clk),
        .data_char(data_char),
        .index_char(index_char),
        .lcd_rs(lcd_rs),
        .lcd_rw(lcd_rw),
        .lcd_e(lcd_e),
        .lcd_data(lcd_data) );        
endmodule
