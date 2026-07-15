module bramW5500Top(
    reset,
    sys_clock,
    gpio,
    uart_rxd,
    uart_txd,
    pwm_out,
    w_5500_rst,
    w_5500_int,
    w_5500_scs,
    w_5500_sck,
    w_5500_mosi,
    w_5500_miso,
    );
    
    input reset;
    input sys_clock;
    output [3:0] gpio;
    input uart_rxd;
    output uart_txd;
    output [3:0] pwm_out;
    
    output w_5500_rst;
    input w_5500_int;
    output w_5500_scs;
    output w_5500_sck;
    output w_5500_mosi;
    input w_5500_miso;
    
    wire [12:0] bram1_addr;
    wire bram1_clk;
    wire [31:0] bram1_din;
    wire [31:0] bram1_dout;
    wire bram1_en;
    wire bram1_rst;
    wire [3:0] bram1_we;
    wire [12:0] bram2_addr;
    wire bram2_clk;
    wire [31:0] bram2_din;
    wire [31:0] bram2_dout;
    wire bram2_en;
    wire bram2_rst;
    wire [3:0] bram2_we;
    wire [3:0] gpio;
    wire mclk;
    wire uart_txd;
    
    system_wrapper system_wrapper
   (.bram1_addr(bram1_addr),
    .bram1_clk(bram1_clk),
    .bram1_din(bram1_din),
    .bram1_dout(bram1_dout),
    .bram1_en(bram1_en),
    .bram1_rst(bram1_rst),
    .bram1_we(bram1_we),
    .bram2_addr(bram2_addr),
    .bram2_clk(bram2_clk),
    .bram2_din(bram2_din),
    .bram2_dout(bram2_dout),
    .bram2_en(bram2_en),
    .bram2_rst(bram2_rst),
    .bram2_we(bram2_we),
    .gpio_tri_o(gpio),
    .mclk(mclk),
    .reset(reset),
    .sys_clock(sys_clock),
    .uart_rxd(uart_rxd),
    .uart_txd(uart_txd));
    
    wire w5500_scs;
    wire w5500_sck;
    wire w5500_mosi;
    wire eth_start;
    wire eth_ram_sel;
    wire [23:0] eth_addr;
    wire [12:0] eth_size;
    wire eth_done;
    
    eth_task    eth_task(
        .reset(reset),
        .mclk(bram1_clk),
        .eth_start(eth_start),
        .eth_ram_sel(eth_ram_sel),
        .eth_addr(eth_addr),
        .eth_size(eth_size),
        .eth_done(eth_done),
        .eth_scsn(w_5500_scs),
        .eth_sclk(w_5500_sck),
        .eth_mosi(w_5500_mosi),
        .eth_miso(w_5500_miso),
        .mb_rst(bram1_rst),
        .mb_en(bram1_en),
        .mb_we(bram1_we),
        .mb_addr(bram1_addr),
        .mb_din(bram1_din),
        .mb_dout(bram1_dout)    );
        
    wire w5500_rst;
    wire [15:0] pwm_freq1;
    wire [15:0] pwm_freq2;
    wire [15:0] pwm_freq3;
    wire [15:0] pwm_freq4;
    wire [6:0] pwm_duty1;
    wire [6:0] pwm_duty2;
    wire [6:0] pwm_duty3;
    wire [6:0] pwm_duty4;
    wire ax_reg_rst = ~bram2_rst;
    
    ax_reg ax_reg
    (.reset(ax_reg_rst),
	 .clock(bram2_clk),
	 .ena(bram2_en),
	 .wea(bram2_we),
	 .addr(bram2_addr),
	 .din(bram2_din),
	 .dout(bram2_dout),	
	 .pwm_freq1(pwm_freq1), 
	 .pwm_freq2(pwm_freq2), 
	 .pwm_freq3(pwm_freq3), 
	 .pwm_freq4(pwm_freq4),
	 .pwm_duty1(pwm_duty1), 
	 .pwm_duty2(pwm_duty2), 
	 .pwm_duty3(pwm_duty3), 
	 .pwm_duty4(pwm_duty4),
     .eth_rstn(w_5500_rst),
     .eth_start(eth_start),
     .eth_ram_sel(eth_ram_sel),
     .eth_addr(eth_addr),
     .eth_size(eth_size),
     .eth_done(eth_done),
     .eth_intn(w_5500_int)   );
     
     
     wire pwm_out1;
     wire pwm_out2;
     wire pwm_out3;
     wire pwm_out4;
     
     pwm_top pwm_top
     (.reset(reset), 
      .mclk(mclk),
      .pwm_freq1(pwm_freq1), 
      .pwm_freq2(pwm_freq2), 
      .pwm_freq3(pwm_freq3), 
      .pwm_freq4(pwm_freq4),
      .pwm_duty1(pwm_duty1), 
      .pwm_duty2(pwm_duty2), 
      .pwm_duty3(pwm_duty3), 
      .pwm_duty4(pwm_duty4),
      .pwm_out1(pwm_out1), 
      .pwm_out2(pwm_out2), 
      .pwm_out3(pwm_out3), 
      .pwm_out4(pwm_out4)
);

wire [3:0] pwm_out = {pwm_out4, pwm_out3, pwm_out2, pwm_out1};

endmodule
