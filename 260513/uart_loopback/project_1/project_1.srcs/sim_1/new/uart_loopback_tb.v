`timescale 1ns / 1ps

module uart_loopback_tb();
    reg reset, mclk;
    
    initial begin
            reset = 0;
            mclk = 0;

#10000 reset = 1;

end

    always #5 mclk = ~mclk; // 100 Mhz
        
    reg [9:0] cnt;
    always @(posedge mclk or negedge reset)     begin
        if(~reset) cnt <= 10'b0;
            else cnt <= (cnt==10'd1023) ? 10'd1023 : cnt+1'b1;
 end
    wire [15:0] baudrate = 16'd868;
    wire [7:0] tdata = 8'h55; // 0101_0101
    wire [1:0] parity_sel = 2'b00;
    wire stop_sel = 1'b0 ;
    
    reg send;
    always @(posedge mclk or negedge reset)     begin
        if(~reset) send <= 1'b0;
            else send <= (cnt==10'd1000) ? 1'b1 : 1'b0;
end
    wire txd;
    
    uart_tx uart_tx(
        .reset(reset), 
        .mclk (mclk), 
        .baudrate (baudrate),
        .parity_sel(parity_sel),
        .stop_sel(stop_sel),
        .tdata(tdata),
        .send(send),
        .txd(txd),
        .done(done)    );
        
    wire uart_txd ;
    wire [7:0] led;
    
    uart_loopback uart_loopback(
        .reset(reset),
        .clock(mclk),
        .uart_txd(uart_txd),
        .uart_rxd(txd),
        .sw(4'b00),
        .led(led)     );
        
endmodule