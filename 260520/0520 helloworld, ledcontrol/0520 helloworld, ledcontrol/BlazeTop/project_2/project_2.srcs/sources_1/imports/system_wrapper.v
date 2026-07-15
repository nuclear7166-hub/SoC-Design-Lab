//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Wed May 20 11:59:14 2026
//Host        : SmST08 running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (reset,
    sys_clk,
    uart_rtl_0_rxd,
    uart_rtl_0_txd);
  input reset;
  input sys_clk;
  input uart_rtl_0_rxd;
  output uart_rtl_0_txd;

  wire reset;
  wire sys_clk;
  wire uart_rtl_0_rxd;
  wire uart_rtl_0_txd;

  system system_i
       (.reset(reset),
        .sys_clk(sys_clk),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd));
endmodule
