//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Wed Jun 17 09:24:13 2026
//Host        : Woo running 64-bit major release  (build 9200)
//Command     : generate_target servo_wrapper.bd
//Design      : servo_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module servo_wrapper

   (Servo_0,
    reset,
    sw_tri_i,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  output Servo_0;
  input reset;
  input [3:0]sw_tri_i;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire Servo_0;
  wire reset;
  wire [3:0]sw_tri_i;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  servo servo_i
       (.Servo_0(Servo_0),
        .reset(reset),
        .sw_tri_i(sw_tri_i),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
