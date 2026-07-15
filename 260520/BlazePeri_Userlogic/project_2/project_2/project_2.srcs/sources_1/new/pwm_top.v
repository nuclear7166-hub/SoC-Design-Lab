`timescale 1ns / 1ps
module pwm_top (
    reset, mclk , // main reset , clock
    pwm_freq1, pwm_freq2, pwm_freq3, pwm_freq4,
    pwm_duty1, pwm_duty2, pwm_duty3, pwm_duty4,
    pwm_out1,  pwm_out2,  pwm_out3,  pwm_out4
    );
    input reset, mclk ;
    input [15:0]    pwm_freq1, pwm_freq2, pwm_freq3, pwm_freq4;
    input [6:0]     pwm_duty1, pwm_duty2, pwm_duty3, pwm_duty4;
    output          pwm_out1,  pwm_out2,  pwm_out3,  pwm_out4;
    
    wire pwm_out1;
    mcu_pwm mcu_pwm1(
        .reset(reset),
        .mclk(mclk),
        .freq(pwm_freq1),
        .duty(pwm_duty1),
        .out(pwm_out1) );
        
    wire pwm_out2;
    mcu_pwm mcu_pwm2(
        .reset(reset),
        .mclk(mclk),
        .freq(pwm_freq2),
        .duty(pwm_duty2),
        .out(pwm_out2) );

    wire pwm_out3;
    mcu_pwm mcu_pwm3(
        .reset(reset),
        .mclk(mclk),
        .freq(pwm_freq3),
        .duty(pwm_duty3),
        .out(pwm_out3) );
        
    wire pwm_out4;
    mcu_pwm mcu_pwm4(
        .reset(reset),
        .mclk(mclk),
        .freq(pwm_freq4),
        .duty(pwm_duty4),
        .out(pwm_out4) );      
        
endmodule  