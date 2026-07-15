`timescale 1ns / 1ps


`define		rPWM_FREQ1		13'h0020
`define		rPWM_FREQ2		13'h0024
`define		rPWM_FREQ3		13'h0028
`define		rPWM_FREQ4		13'h002c
                                         
`define		rPWM_DUTY1		13'h0030
`define		rPWM_DUTY2		13'h0034
`define		rPWM_DUTY3		13'h0038
`define		rPWM_DUTY4		13'h003c

// ETHERNET Controller (W5500)
`define		rETH_CTRL		13'h0040
`define		rETH_ADDR		13'h0044
`define		rETH_SIZE		13'h0048

module ax_reg(
	reset        ,
	clock        ,
	ena          ,
	wea          ,
	addr         ,
	din          ,
	dout         ,
	             
	pwm_freq1    , 
	pwm_freq2    , 
	pwm_freq3    , 
	pwm_freq4    ,
	pwm_duty1    , 
	pwm_duty2    , 
	pwm_duty3    , 
	pwm_duty4    ,
	
	eth_rstn     ,
	eth_start    ,
	eth_ram_sel  ,	// 0 : spi control,  1 : mcu control
	eth_addr     ,
	eth_size     ,	// size - 1
	eth_done     ,
	eth_intn       	
);
input		reset       ;
input		clock       ;
input		ena         ;
input	[3:0]	wea         ;
input	[12:0]	addr        ;
input	[31:0]	din         ;
output	[31:0]	dout        ;
	                    
output	[15:0]	pwm_freq1   ; 
output	[15:0]	pwm_freq2   ; 
output	[15:0]	pwm_freq3   ; 
output	[15:0]	pwm_freq4   ;
output	[6:0]	pwm_duty1   ; 
output	[6:0]	pwm_duty2   ; 
output	[6:0]	pwm_duty3   ; 
output	[6:0]	pwm_duty4   ;

output		eth_rstn    ;
output		eth_start   ;
output		eth_ram_sel ;
output	[23:0]	eth_addr    ;
output	[12:0]	eth_size    ;
input		eth_done    ;
input		eth_intn    ;

reg	[15:0]	pwm_freq1   ; 
reg	[15:0]	pwm_freq2   ; 
reg	[15:0]	pwm_freq3   ; 
reg	[15:0]	pwm_freq4   ;
reg	[6:0]	pwm_duty1   ; 
reg	[6:0]	pwm_duty2   ; 
reg	[6:0]	pwm_duty3   ; 
reg	[6:0]	pwm_duty4   ;

reg		eth_rstn    ;
reg		eth_start   ;
reg		eth_ram_sel ;
reg	[23:0]	eth_addr    ;
reg	[12:0]	eth_size    ;

always @(posedge clock or negedge reset)
begin
	if (~reset) begin
		pwm_freq1   <= 16'd100;
		pwm_freq2   <= 16'd100;
		pwm_freq3   <= 16'd100;
		pwm_freq4   <= 16'd100;
		pwm_duty1   <= 7'd0;
		pwm_duty2   <= 7'd0;
		pwm_duty3   <= 7'd0;
		pwm_duty4   <= 7'd0;

		eth_rstn    <= 1'b1;
		eth_start   <= 1'b0;
		eth_ram_sel <= 1'b0;
		eth_addr    <= 24'b0;
		eth_size    <= 13'b0;
	end                           
	else begin
		pwm_freq1   <= ((addr==`rPWM_FREQ1) & ena & (wea==4'b1111)) ? din[15:0] : pwm_freq1  ;
		pwm_freq2   <= ((addr==`rPWM_FREQ2) & ena & (wea==4'b1111)) ? din[15:0] : pwm_freq2  ;
		pwm_freq3   <= ((addr==`rPWM_FREQ3) & ena & (wea==4'b1111)) ? din[15:0] : pwm_freq3  ;
		pwm_freq4   <= ((addr==`rPWM_FREQ4) & ena & (wea==4'b1111)) ? din[15:0] : pwm_freq4  ;
                                                                                                     
		pwm_duty1   <= ((addr==`rPWM_DUTY1) & ena & (wea==4'b1111)) ? din[6:0]  : pwm_duty1  ;
		pwm_duty2   <= ((addr==`rPWM_DUTY2) & ena & (wea==4'b1111)) ? din[6:0]  : pwm_duty2  ;
		pwm_duty3   <= ((addr==`rPWM_DUTY3) & ena & (wea==4'b1111)) ? din[6:0]  : pwm_duty3  ;
		pwm_duty4   <= ((addr==`rPWM_DUTY4) & ena & (wea==4'b1111)) ? din[6:0]  : pwm_duty4  ;

		eth_rstn    <= ((addr==`rETH_CTRL ) & ena & (wea==4'b1111)) ? din[2]    : eth_rstn   ;
		eth_ram_sel <= ((addr==`rETH_CTRL ) & ena & (wea==4'b1111)) ? din[1]    : eth_ram_sel;
		eth_start   <= ((addr==`rETH_CTRL ) & ena & (wea==4'b1111)) ? din[0]    : eth_start  ;
		eth_addr    <= ((addr==`rETH_ADDR ) & ena & (wea==4'b1111)) ? din[23:0] : eth_addr   ;
		eth_size    <= ((addr==`rETH_SIZE ) & ena & (wea==4'b1111)) ? din[12:0] : eth_size   ;

	end
end

wire	[31:0]	dout  = (addr==`rPWM_FREQ1 ) ? {16'b0, pwm_freq1   } : 
                        (addr==`rPWM_FREQ2 ) ? {16'b0, pwm_freq2   } : 
                        (addr==`rPWM_FREQ3 ) ? {16'b0, pwm_freq3   } : 
                        (addr==`rPWM_FREQ4 ) ? {16'b0, pwm_freq4   } : 
                        (addr==`rPWM_DUTY1 ) ? {16'b0, pwm_duty1   } : 
                        (addr==`rPWM_DUTY2 ) ? {16'b0, pwm_duty2   } : 
                        (addr==`rPWM_DUTY3 ) ? {16'b0, pwm_duty3   } : 
                        (addr==`rPWM_DUTY4 ) ? {16'b0, pwm_duty4   } : 
                        (addr==`rETH_CTRL  ) ? {27'b0, eth_done    , 
                                                       eth_intn    , 
                                                       eth_rstn    , 
                                                       eth_ram_sel , 
                                                       eth_start   } : 
                        (addr==`rETH_ADDR  ) ? {8'b0,  eth_addr    } : 
                        (addr==`rETH_SIZE  ) ? {19'b0, eth_size    } : 
                        32'b0 ;

endmodule
