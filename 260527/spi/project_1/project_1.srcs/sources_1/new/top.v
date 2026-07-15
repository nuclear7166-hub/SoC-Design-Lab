`timescale 1ns / 1ps
module top(
    reset,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd,
    oTP_JA1,
    oTP_JA2,
    oTP_JA3
    );
    
    input reset;
    input sys_clock;
    input usb_uart_rxd;
    output usb_uart_txd;
    output oTP_JA1;
    output oTP_JA2;
    output oTP_JA3;
    
    wire usb_uart_rxd;
    wire spi_ss;
    wire spi_sck;
    wire spi_mosi;
    wire spi_miso;
    wire oTP_JA1 = spi_ss;
    wire oTP_JA2 = spi_sck;
    wire oTP_JA3 = spi_mosi;
    wire oTP_JA4 = spi_miso;
    
    spi spi_i(
        .reset(reset),
        .spi_io0_i(1'b0),
        .spi_io0_o(spi_mosi),
        .spi_io0_t( ),
        .spi_io1_i(spi_miso),
        .spi_io1_o( ),
        .spi_io1_t( ),
        .spi_sck_i(1'b0),
        .spi_sck_o(spi_sck),
        .spi_sck_t( ),
        .spi_ss_i(1'b0),
        .spi_ss_o(spi_ss),
        .spi_ss_t( ),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd) );
endmodule