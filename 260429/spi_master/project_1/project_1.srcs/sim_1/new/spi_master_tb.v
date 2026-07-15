`timescale 1ns / 1ps
module spi_master_tb(   );

    reg     reset, clock;
    initial begin
        reset = 0;
        clock = 0;
        
#10000      reset = 1; end
    
    always #5 clock = ~clock;       // 100MHz
    
    reg [14:0] cnt;
    always @(posedge clock or negedge reset) begin
        if(~reset)  cnt <= 15'b0;
            else cnt <= cnt + 1'b1; end
            
    reg     start_w;
    always @(posedge clock or negedge reset) begin
        if(~reset)  start_w <= 1'b0;
            else start_w <= (cnt == 15'd1000) ? 1'b1 : (cnt == 15'd1010) ? 1'b0 : start_w; end
                    
    reg     start_r;
    always @(posedge clock or negedge reset) begin
        if(~reset)  start_r <= 1'b0;
            else start_r <= (cnt == 15'd6500) ? 1'b1 : (cnt == 15'd6510) ? 1'b0 : start_r; end                    
            
    wire [7:0] rdata;
    wire done, ss, sck, mosi, s_idle, s_ready, s_send, s_done ;
    wire [9:0] sck_cnt;
    wire startw_pedge;
    wire [5:0] sck_index;
    wire rw_flag;
    wire startw_1d;
    wire startw_2d;
    
spi_master spi_master_u1(
 .reset   (reset   ), .clock   (clock   ),
 .freq    (10'd100 ),                                       //sck_freq = 100Mhz/(freq+1) -> (freq=100) -> sck_freq= 100MHz/(100+1) = 0.99Mhz
 .start_w (start_w ), .start_r (start_r ), .startw_1d(startw_1d), .startw_2d(startw_2d),
 .startw_pedge(startw_pedge),
 .addr(8'h55),
 .wdata(8'haa),
 .rdata   (rdata   ),
 .done    (done    ),
 .sck_cnt(sck_cnt),
 .sck_index(sck_index),
 .ss (ss    ),
 .sck     (sck     ),
 .mosi    (mosi    ),
 .s_idle    (s_idle),
 .s_ready  (s_ready),
 .s_send   (s_send),
 .s_done   (s_done),
 .rw_flag(rw_flag),
 .miso  (1'b0   ) );                       
endmodule
