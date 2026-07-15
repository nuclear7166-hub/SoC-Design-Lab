`timescale 1ns / 1ps
module userMapTop(
    reset,
    sys_clock,
    gpio,
    uart_rxd,
    uart_txd,
    pwm_out    );
    
    input reset;
    input sys_clock;
    output [3:0] gpio;
    input uart_rxd;
    output uart_txd;
    output [3:0] pwm_out;
    
    wire [12:0] BRAM1_addr;
    wire BRAM1_clk;
    wire [31:0] BRAM1_din;
    wire [31:0] BRAM1_dout;
    wire BRAM1_en;
    wire BRAM1_rst;
    wire [3:0] BRAM1_we;
    wire [12:0] BRAM2_addr;
    wire BRAM2_clk;
    wire [31:0] BRAM2_din;
    wire [31:0] BRAM2_dout;
    wire BRAM2_en;
    wire BRAM2_rst;
    wire [3:0] BRAM2_we;
    wire [3:0] gpio;
    wire mclk;
    wire uart_txd;
    
    system_wrapper system_wrapper(
        .BRAM1_addr(BRAM1_addr),
        .BRAM1_clk(BRAM1_clk),
        .BRAM1_din(BRAM1_din),
        .BRAM1_dout(BRAM1_dout),
        .BRAM1_en(BRAM1_en),
        .BRAM1_rst(BRAM1_rst),
        .BRAM1_we(BRAM1_we),
        .BRAM2_addr(BRAM2_addr),
        .BRAM2_clk(BRAM2_clk),
        .BRAM2_din(BRAM2_din),
        .BRAM2_dout(BRAM2_dout),
        .BRAM2_en(BRAM2_en),
        .BRAM2_rst(BRAM2_rst),
        .BRAM2_we(BRAM2_we),
        .gpio_tri_o(gpio),
        .mclk(mclk),
        .reset(reset),
        .sys_clock(sys_clock),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd)     );
        
        wire [31:0] bram_addra1 = {19'b0, BRAM1_addr};
        wire rsta_busy1;
        
        spram_2048x32 mem1(
            .clka(BRAM1_clk),
            .rsta(BRAM1_rst),
            .ena(BRAM1_en),
            .wea(BRAM1_we),
            .addra(bram_addra1),
            .dina(BRAM1_din),
            .douta(BRAM1_dout),
            .rsta_busy(rsta_busy1)  );
            
    wire [15:0] pwm_freq1;
    wire [15:0] pwm_freq2;
    wire [15:0] pwm_freq3;
    wire [15:0] pwm_freq4;
    wire [6:0] pwm_duty1;
    wire [6:0] pwm_duty2;
    wire [6:0] pwm_duty3;
    wire [6:0] pwm_duty4;
    wire ax_reg_rst = ~BRAM2_rst;
    
    ax_reg ax_reg(
        .reset(ax_reg_rst),
        .clock(BRAM2_clk),
        .ena(BRAM2_en),
        .wea(BRAM2_we),
        .addr(BRAM2_addr),
        .din(BRAM2_din),
        .dout(BRAM2_dout),
        
        .pwm_freq1(pwm_freq1),
        .pwm_freq2(pwm_freq2),
        .pwm_freq3(pwm_freq3),
        .pwm_freq4(pwm_freq4),
        .pwm_duty1(pwm_duty1),
        .pwm_duty2(pwm_duty2),
        .pwm_duty3(pwm_duty3),
        .pwm_duty4(pwm_duty4)       );
        
    wire pwm_out1;
    wire pwm_out2;
    wire pwm_out3;
    wire pwm_out4;
    pwm_top pwm_top(
        .reset(reset),
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
        .pwm_out4(pwm_out4)     );
            
        
    wire [3:0] pwm_out = {pwm_out4, pwm_out3, pwm_out2, pwm_out1};
              
endmodule
