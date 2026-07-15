//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Tue May 26 17:00:09 2026
//Host        : Çö¿ì running 64-bit major release  (build 9200)
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
    mclk,
    resetn,
    spi_io0_io,
    spi_io1_io,
    spi_sck_io,
    spi_ss_io,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  input [0:0]btn0_tri_i;
  input [0:0]btn1_tri_i;
  input [1:0]btn23_tri_i;
  output [3:0]led_4bits_tri_o;
  output mclk;
  input resetn;
  inout spi_io0_io;
  inout spi_io1_io;
  inout spi_sck_io;
  inout [0:0]spi_ss_io;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire [0:0]btn0_tri_i;
  wire [0:0]btn1_tri_i;
  wire [1:0]btn23_tri_i;
  wire [3:0]led_4bits_tri_o;
  wire mclk;
  wire resetn;
  wire spi_io0_i;
  wire spi_io0_io;
  wire spi_io0_o;
  wire spi_io0_t;
  wire spi_io1_i;
  wire spi_io1_io;
  wire spi_io1_o;
  wire spi_io1_t;
  wire spi_sck_i;
  wire spi_sck_io;
  wire spi_sck_o;
  wire spi_sck_t;
  wire [0:0]spi_ss_i_0;
  wire [0:0]spi_ss_io_0;
  wire [0:0]spi_ss_o_0;
  wire spi_ss_t;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  mb1 mb1_i
       (.btn0_tri_i(btn0_tri_i),
        .btn1_tri_i(btn1_tri_i),
        .btn23_tri_i(btn23_tri_i),
        .led_4bits_tri_o(led_4bits_tri_o),
        .mclk(mclk),
        .resetn(resetn),
        .spi_io0_i(spi_io0_i),
        .spi_io0_o(spi_io0_o),
        .spi_io0_t(spi_io0_t),
        .spi_io1_i(spi_io1_i),
        .spi_io1_o(spi_io1_o),
        .spi_io1_t(spi_io1_t),
        .spi_sck_i(spi_sck_i),
        .spi_sck_o(spi_sck_o),
        .spi_sck_t(spi_sck_t),
        .spi_ss_i(spi_ss_i_0),
        .spi_ss_o(spi_ss_o_0),
        .spi_ss_t(spi_ss_t),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
  IOBUF spi_io0_iobuf
       (.I(spi_io0_o),
        .IO(spi_io0_io),
        .O(spi_io0_i),
        .T(spi_io0_t));
  IOBUF spi_io1_iobuf
       (.I(spi_io1_o),
        .IO(spi_io1_io),
        .O(spi_io1_i),
        .T(spi_io1_t));
  IOBUF spi_sck_iobuf
       (.I(spi_sck_o),
        .IO(spi_sck_io),
        .O(spi_sck_i),
        .T(spi_sck_t));
  IOBUF spi_ss_iobuf_0
       (.I(spi_ss_o_0),
        .IO(spi_ss_io[0]),
        .O(spi_ss_i_0),
        .T(spi_ss_t));
endmodule
