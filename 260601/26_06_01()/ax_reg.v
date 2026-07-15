`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/23 17:50:10
// Design Name: 
// Module Name: ax_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define		rPWM_FREQ1		13'h0020
`define		rPWM_FREQ2		13'h0024
`define		rPWM_FREQ3		13'h0028
`define		rPWM_FREQ4		13'h002c
                                         
`define		rPWM_DUTY1		13'h0030
`define		rPWM_DUTY2		13'h0034
`define		rPWM_DUTY3		13'h0038
`define		rPWM_DUTY4		13'h003c

module ax_reg(
	reset     ,
	clock     ,
	ena       ,
	wea       ,
	addr      ,
	din       ,
	dout      ,
	
	pwm_freq1 , 
	pwm_freq2 , 
	pwm_freq3 , 
	pwm_freq4 ,
	pwm_duty1 , 
	pwm_duty2 , 
	pwm_duty3 , 
	pwm_duty4 
);
input		reset     ;
input		clock     ;
input		ena       ;
input	[3:0]	wea       ;
input	[12:0]	addr      ;
input	[31:0]	din       ;
output	[31:0]	dout      ;
	
output	[15:0]	pwm_freq1 ; 
output	[15:0]	pwm_freq2 ; 
output	[15:0]	pwm_freq3 ; 
output	[15:0]	pwm_freq4 ;
output	[6:0]	pwm_duty1 ; 
output	[6:0]	pwm_duty2 ; 
output	[6:0]	pwm_duty3 ; 
output	[6:0]	pwm_duty4 ;

reg	[15:0]	pwm_freq1 ; 
reg	[15:0]	pwm_freq2 ; 
reg	[15:0]	pwm_freq3 ; 
reg	[15:0]	pwm_freq4 ;
reg	[6:0]	pwm_duty1 ; 
reg	[6:0]	pwm_duty2 ; 
reg	[6:0]	pwm_duty3 ; 
reg	[6:0]	pwm_duty4 ;
always @(posedge clock or negedge reset)
begin
	if (~reset) begin
		pwm_freq1 <= 16'd100;
		pwm_freq2 <= 16'd100;
		pwm_freq3 <= 16'd100;
		pwm_freq4 <= 16'd100;
		pwm_duty1 <= 7'd0;
		pwm_duty2 <= 7'd0;
		pwm_duty3 <= 7'd0;
		pwm_duty4 <= 7'd0;
		
	end                           
	else begin
		pwm_freq1 <= ((addr==`rPWM_FREQ1) & ena & (wea==4'b1111)) ? din[15:0] : pwm_freq1 ;
		pwm_freq2 <= ((addr==`rPWM_FREQ2) & ena & (wea==4'b1111)) ? din[15:0] : pwm_freq2 ;
		pwm_freq3 <= ((addr==`rPWM_FREQ3) & ena & (wea==4'b1111)) ? din[15:0] : pwm_freq3 ;
		pwm_freq4 <= ((addr==`rPWM_FREQ4) & ena & (wea==4'b1111)) ? din[15:0] : pwm_freq4 ;

		pwm_duty1 <= ((addr==`rPWM_DUTY1) & ena & (wea==4'b1111)) ? din[6:0]  : pwm_duty1 ;
		pwm_duty2 <= ((addr==`rPWM_DUTY2) & ena & (wea==4'b1111)) ? din[6:0]  : pwm_duty2 ;
		pwm_duty3 <= ((addr==`rPWM_DUTY3) & ena & (wea==4'b1111)) ? din[6:0]  : pwm_duty3 ;
		pwm_duty4 <= ((addr==`rPWM_DUTY4) & ena & (wea==4'b1111)) ? din[6:0]  : pwm_duty4 ;
	end
end

wire	[31:0]	dout  = (addr==`rPWM_FREQ1 ) ? {16'b0, pwm_freq1} : 
                        (addr==`rPWM_FREQ2 ) ? {16'b0, pwm_freq2} : 
                        (addr==`rPWM_FREQ3 ) ? {16'b0, pwm_freq3} : 
                        (addr==`rPWM_FREQ4 ) ? {16'b0, pwm_freq4} : 
                        (addr==`rPWM_DUTY1 ) ? {16'b0, pwm_duty1} : 
                        (addr==`rPWM_DUTY2 ) ? {16'b0, pwm_duty2} : 
                        (addr==`rPWM_DUTY3 ) ? {16'b0, pwm_duty3} : 
                        (addr==`rPWM_DUTY4 ) ? {16'b0, pwm_duty4} : 32'b0 ;

endmodule
