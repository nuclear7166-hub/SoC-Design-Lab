`timescale 1ns / 1ps

module uart_controller(
    reset, mclk, baudrate,
    parity_sel , // 0 : none, 1 : even, 2 : odd
    stop_sel , // 0 : 1bits, 1 : 2bits
    tdata , // tx data
    send , // send flag
    trdy , // tx ready
    txd , // uart_txd
    rxd , // uart_rxd
    ren , // read enable
    rdata , // rx data
    rvalid , // rdata valid flag
    overrun , // rx fifo full
    frame_err , // stop bit error
    parity_err // parity error  
    );

    input reset , mclk ;
    input [15:0] baudrate ;
    input [1:0] parity_sel ;
    input stop_sel ;
    input [7:0]tdata ;
    input send ;
    output trdy , txd;
    input rxd , ren;
    output [7:0] rdata ;
    output rvalid, overrun, frame_err, parity_err ;
    
    wire trdy ;
    wire txd ;
    
    uart_tx uart_tx(
        .reset(reset),
        .mclk(mclk),
        .baudrate(baudrate),
        .parity_sel(parity_sel),
        .stop_sel(stop_sel),
        .tdata(tdata),
        .send(send),
        .done(trdy),
        .txd(txd)
 );

    wire [7:0] rdata ;
    wire rvalid ;
    wire overrun ;
    wire frame_err ;
    wire parity_err ;
    
    uart_rx uart_rx(
        .reset (reset ),
        .mclk (mclk ),
        .baudrate (baudrate ),
        .parity_sel (parity_sel ),
        .stop_sel (stop_sel ),
        .rdata (rdata ),
        .ren (ren ),
        .rvalid (rvalid ),
        .overrun (overrun ),
        .frame_err (frame_err ),
        .parity_err (parity_err ),
        .rxd (rxd )
 );
 
endmodule