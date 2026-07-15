`timescale 1ns / 1ps

module uart_loopback(   
    reset,
    clock,
    uart_rxd,
    uart_txd,
    sw,
    led     );
    
    input reset , clock , uart_rxd ;
    output uart_txd ;
    input [3:0] sw ;
    output [7:0] led ;
    
    // 1) define state
    reg [1:0] m_state ;
    parameter M_IDLE = 2'd0 ;
    parameter M_FREAD = 2'd1 ;
    parameter M_SEND = 2'd2 ;
    
    // --------------------------------------------
    // 2) state flag
    wire s_idle = (m_state == M_IDLE ) ? 1'b1 : 1'b0 ;
    wire s_fread = (m_state == M_FREAD ) ? 1'b1 : 1'b0 ;
    wire s_send = (m_state == M_SEND ) ? 1'b1 : 1'b0 ;
    
    // 3) code implementation
    reg [2:0] cnt_fread;
    always @(posedge clock or negedge reset)     begin
        if(~reset)      cnt_fread <= 3'b0;
            else        cnt_fread <= ~s_fread ? 3'b0 : cnt_fread+1'b1 ;
end
    reg ren;
    always @(posedge clock or negedge reset)     begin
        if(~reset)      ren <= 1'b0;
            else        ren <= (cnt_fread==3'd2) ? 1'b1 : 1'b0;
end

    wire [7:0] rdata;
    reg [7:0] tdata;
    always @(posedge clock or negedge reset)     begin
        if(~reset)      tdata <= 8'b0;
            else        tdata <= (cnt_fread==3'd7) ? rdata : tdata ;
end

    reg send;
    always @(posedge clock or negedge reset)     begin
        if(~reset)      send <= 1'b0;
            else        send <= (cnt_fread==3'd7) ? 1'b1 : 1'b0 ;
end
    
    reg [2:0] cnt_send;
    always @(posedge clock or negedge reset)        begin
        if(~reset) cnt_send <= 3'b0;
            else cnt_send <= ~s_send ? 3'b0 : (cnt_send==3'd7) ? 3'd7 : cnt_send+1'b1 ;
end
    
    wire trdy ;
    wire rvalid ;
    
    // 4) state transition
    always @(posedge clock or negedge reset)        begin
        if(~reset) m_state <= 1'b0;
            else m_state <= (s_idle & rvalid & trdy) ? M_FREAD :
                            (s_fread & (cnt_fread==3'd7) ) ? M_SEND :
                            (s_send & (cnt_send==3'd7) & trdy ) ? M_IDLE :  m_state ;
end
    
    wire [15:0] baudrate = ~sw[0] ? 16'd868 : // 115,200
                                    16'd2604 ; // 38,400
    
    wire [1:0] parity_sel = (sw[2:1]==2'b00) ? 2'b00 : // none
                            (sw[2:1]==2'b01) ? 2'b01 : // even
                            (sw[2:1]==2'b10) ? 2'b10 : // odd       
                                               2'b00 ;

    wire stop_sel = ~sw[3] ? 1'b0 : // 1-stop
                             1'b1 ; // 2-stop
                             
    wire uart_txd;
    wire overrun;
    wire frame_err;
    wire parity_err;
    
    uart_controller uart_controller(
        .reset (reset),
        .mclk (clock),
        .baudrate (baudrate),
        .parity_sel (parity_sel),
        .stop_sel (stop_sel),
        .tdata (tdata),
        .send (send),
        .trdy (trdy ),
        .txd (uart_txd),
        .rxd (uart_rxd),
        .ren (ren),
        .rdata (rdata),
        .rvalid (rvalid),
        .overrun (overrun),
        .frame_err (frame_err ),
        .parity_err (parity_err)        );
        
    wire [7:0] led = {2'b0, trdy, rvalid, 1'b0, overrun, frame_err, parity_err};
    
endmodule