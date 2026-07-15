`timescale 1ns / 1ps
module blaze_w5500Top(
    reset,
    sys_clock,
    uart_rxd,
    uart_txd,
    gpio_out,
    spi_scs,
    spi_sck,
    spi_mosi,
    spi_miso
    );
    
    input reset;
    input sys_clock;
    input uart_rxd;
    output uart_txd;
    output [4:0] gpio_out;
    output spi_scs;
    output spi_sck;
    output spi_mosi;
    input spi_miso;
    
    wire uart_txd;
    wire [4:0] gpio_out;
    wire spi_scs;
    wire spi_sck;
    wire spi_mosi;
    
    system system_i(
        .reset(reset),
        .sys_clock(sys_clock),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd),
        .gpio_tri_o(gpio_out),
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
        .spi_ss_o(spi_scs),
        .spi_ss_t( )   );
        
endmodule
