`timescale 1ns / 1ps
module uart_rx(
    reset , mclk , baudrate ,
    parity_sel ,                // 0 : none, 1 : even, 2 : odd
    stop_sel ,                  // 0 : 1bits, 1 : 2bits
    ren ,
    rdata ,
    rvalid , // rdata valid flag
    overrun , // rx fifo full
    frame_err , // stop bit error
    parity_err , // parity error
    rxd     );
    
    input reset ;
    input mclk ;
    input [15:0] baudrate ;
    input [1:0] parity_sel ;
    input stop_sel ;
    input ren ;
    output [7:0] rdata ;
    output rvalid ;
    output overrun ;
    output frame_err ;
    output parity_err ;
    input rxd ;
    
    // 1) define state
    reg [1:0] m_state ;
    parameter M_IDLE = 2'b0 ;
    parameter M_RECEIVE = 2'd1 ;
    parameter M_DONE = 2'd2 ;
    
    // 2) state flag
    wire s_idle = (m_state == M_IDLE ) ? 1'b1 : 1'b0 ;
    wire s_receive = (m_state == M_RECEIVE ) ? 1'b1 : 1'b0 ;
    wire s_done = (m_state == M_DONE ) ? 1'b1 : 1'b0 ;
    
   // 3) code implementation
    reg rxd_1d, rxd_2d, rxd_3d;
    wire rxd_nedge = ~rxd_2d & rxd_3d;
        always @(posedge mclk or negedge reset)    begin
            if(~reset) begin
                rxd_1d <= 1'b1;
                rxd_2d <= 1'b1;
                rxd_3d <= 1'b1;
    end
            else begin
                rxd_1d <= rxd;
                rxd_2d <= rxd_1d;
                rxd_3d <= rxd_2d;
    end
end

    reg [15:0] cnt1;
        always @(posedge mclk or negedge reset)    begin
            if(~reset)      cnt1 <= 16'b0;
                else        cnt1 <= ~s_receive ? 16'b0 : (cnt1==baudrate) ? 16'b0 : cnt1+1'b1;
    end
    
    reg [3:0] cnt2;
        always @(posedge mclk or negedge reset)    begin
            if(~reset) cnt2 <= 4'b0;
                else cnt2 <= ~s_receive ? 4'b0 : (cnt1==baudrate) ? cnt2+1'b1 : cnt2;
end
    reg [7:0] rxd_data;
        always @(posedge mclk or negedge reset)     begin
            if(~reset) rxd_data <= 8'b0;
                else begin
                    rxd_data[0] <= ((cnt2==4'd1) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d : rxd_data[0];
                    rxd_data[1] <= ((cnt2==4'd2) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d : rxd_data[1];
                    rxd_data[2] <= ((cnt2==4'd3) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d : rxd_data[2];
                    rxd_data[3] <= ((cnt2==4'd4) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d : rxd_data[3];
                    rxd_data[4] <= ((cnt2==4'd5) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d : rxd_data[4];
                    rxd_data[5] <= ((cnt2==4'd6) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d : rxd_data[5];
                    rxd_data[6] <= ((cnt2==4'd7) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d : rxd_data[6];
                    rxd_data[7] <= ((cnt2==4'd8) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d : rxd_data[7];
    end
end
    wire cal_parity = rxd_data[0]^rxd_data[1]^rxd_data[2]^rxd_data[3]^rxd_data[4]^rxd_data[5]^rxd_data[6]^rxd_data[7];
    reg cal_parity2;
        always @(posedge mclk or negedge reset)     begin
            if(~reset)      cal_parity2 <= 1'b0;
                else        cal_parity2 <= (parity_sel==2'b01) ? cal_parity : (parity_sel==2'b10) ? ~cal_parity : 1'b0 ;
    end
    reg rxd_parity;
        always @(posedge mclk or negedge reset)     begin
            if(~reset) rxd_parity <= 1'b0;
else rxd_parity <= ((cnt2==4'd9) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d : rxd_parity;
    end
    
    reg stop_bit1;
    always @(posedge mclk or negedge reset)    begin
        if(~reset) stop_bit1 <= 1'b0;
            else stop_bit1 <= ((parity_sel==2'b00) & (cnt2==4'd9 ) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d :
                              ((parity_sel!=2'b00) & (cnt2==4'd10) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d :
                              stop_bit1 ;
    end
    
     reg stop_bit2;
          always @(posedge mclk or negedge reset)     begin
               if(~reset)       stop_bit2 <= 1'b0;
                    else        stop_bit2 <= ((parity_sel==2'b00) & (cnt2==4'd10) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d :
                                             ((parity_sel!=2'b00) & (cnt2==4'd11) & (cnt1=={1'b0, baudrate[15:1]})) ? rxd_3d :
                                             stop_bit2 ;
     end
     
     reg [2:0] cnt_done;
          always @(posedge mclk or negedge reset)     begin
               if(~reset) cnt_done <= 3'b0;
                    else cnt_done <= ~s_done ? 3'b0 : cnt_done+1'b1;
     end
     
     // 4) state transition
     always @(posedge mclk or negedge reset)     begin
          if(~reset) m_state <= 1'b0;
               else m_state <= ( s_idle & rxd_nedge ) ? M_RECEIVE :
                               ((parity_sel==2'b0) & (stop_sel==1'b0) & (cnt2==4'd9 ) & (cnt1==baudrate)) ? M_DONE :
                               ((parity_sel==2'b0) & (stop_sel==1'b1) & (cnt2==4'd10) & (cnt1==baudrate)) ? M_DONE :
                               ((parity_sel!=2'b0) & (stop_sel==1'b0) & (cnt2==4'd10) & (cnt1==baudrate)) ? M_DONE :
                               ((parity_sel!=2'b0) & (stop_sel==1'b1) & (cnt2==4'd11) & (cnt1==baudrate)) ? M_DONE :
                               (cnt_done==3'd7) ? M_IDLE : m_state ;
     end
     
     // 5) uart receive state & fifo
     reg frame_err;
          always @(posedge mclk or negedge reset)     begin
               if(~reset)       frame_err <= 1'b0;
                    else        frame_err <= ((cnt_done==3'd5) & (stop_sel==1'b0)) ? ~stop_bit1 : // stop_bit1 = 1 ? frame_err = 0
                                             ((cnt_done==3'd5) & (stop_sel==1'b1)) ? ~(stop_bit1&stop_bit2) : // (stop_bit1 & stop_bit2) = 1 ? frame_error =0
                                             frame_err ;
     end
     
     reg parity_err;
          always @(posedge mclk or negedge reset)     begin
               if(~reset) parity_err <= 1'b0;
                    else parity_err <= (parity_sel==2'b0) ? 1'b0 :
                                       ((cnt_done==3'd5) & (cal_parity2==rxd_parity)) ? 1'b0 :
                                       ((cnt_done==3'd5) & (cal_parity2!=rxd_parity)) ? 1'b1 : parity_err ;
     end
     
     wire fifo_full ;
     wire overrun = fifo_full;
     wire fifo_empty;
     wire rvalid = ~fifo_empty;
     wire [7:0] fifo_din = rxd_data ;
     wire fifo_wen = (cnt_done==3'd2) ? 1'b1 : 1'b0;
     wire fifo_ren = ren ;
     wire [7:0] fifo_dout;
     wire [7:0] rdata = fifo_dout;
     // wire rvalid = valid ;
     
     fifo_16x8 rxd_fifo (
     .clk (mclk ), // input wire clk
     .srst (1'b0 ), // input wire srst(active high)
     .din (fifo_din ), // input wire [7 : 0] din
     .wr_en (fifo_wen ), // input wire wr_en
     .rd_en (fifo_ren ), // input wire rd_en
     .dout (fifo_dout ), // output wire [7 : 0] dout
     .full (fifo_full ), // output wire full
     .empty (fifo_empty ), // output wire empty
     .valid ( ) // output wire valid
     //.valid (rvalid ) // output wire valid
     );
endmodule