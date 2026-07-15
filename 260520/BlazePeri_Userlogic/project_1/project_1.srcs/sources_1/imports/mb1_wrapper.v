//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Wed May 20 16:53:53 2026
//Host        : SmST08 running 64-bit major release  (build 9200)
//Command     : generate_target mb1_wrapper.bd
//Design      : mb1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mb1_wrapper
   (btn0_tri_i,
    btn1_tri_i,
    btn23_tri_i,
    led_4bits_tri_o,
    resetn,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  input [0:0]btn0_tri_i;
  input [0:0]btn1_tri_i;
  input [1:0]btn23_tri_i;
  output [3:0]led_4bits_tri_o;
  input resetn;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire [0:0]btn0_tri_i;
  wire [0:0]btn1_tri_i;
  wire [1:0]btn23_tri_i;
  wire [3:0]led_4bits_tri_o;
  wire resetn;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  mb1 mb1_i
       (.btn0_tri_i(btn0_tri_i),
        .btn1_tri_i(btn1_tri_i),
        .btn23_tri_i(btn23_tri_i),
        .led_4bits_tri_o(led_4bits_tri_o),
        .resetn(resetn),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
