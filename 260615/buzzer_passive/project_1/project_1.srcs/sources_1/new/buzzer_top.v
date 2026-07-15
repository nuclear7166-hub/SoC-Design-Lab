`timescale 1ns / 1ps
module buzzer_top(
    input sysclk,
    input reset,
    input i_btn,
    output o_freq
    );
    
    wire [15:0] w_freq;
    wire w_enable, w_btn;
    
    btn_in btn_in(
        .clock(sysclk),
        .reset(reset),
        .btn_in(i_btn),
        .btn_out(w_btn) );
        
    fsm_buzzer fsm_buzzer(
        .sysclk(sysclk),
        .reset(reset),
        .i_btn(w_btn),
        .o_freq(w_freq),
        .o_enable(w_enable) );
        
    freq_gen2 freq_gen2(
        .sysclk(sysclk),
        .reset(reset),
        .i_freq(w_freq),
        .enable(w_enable),
        .o_freq(o_freq) );                
endmodule
