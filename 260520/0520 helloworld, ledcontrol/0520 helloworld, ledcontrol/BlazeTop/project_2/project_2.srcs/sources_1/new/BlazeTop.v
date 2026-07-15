`timescale 1ns / 1ps

module BlazeTop(
    reset,
    sys_clk,
    uart_rxd,
    uart_txd,
    led
    );
    
    input reset;
    input sys_clk;
    input uart_rxd;
    output uart_txd;
    output [3:0] led;
    
    system_wrapper u0(
        .reset(reset),
        .sys_clk(sys_clk),
        .uart_rtl_0_rxd(uart_rxd),
        .uart_rtl_0_txd(uart_txd) );
    
    wire [3:0] led;
    
    led_control u1(
        .reset(reset),
        .clock(sys_clk),
        .led(led) );        
endmodule
