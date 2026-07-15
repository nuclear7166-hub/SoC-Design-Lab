`timescale 1ns / 1ps
module mcu_pwm ( 
    reset, mclk,  freq, duty, out );

    input reset, mclk;
    input [15:0] freq;
    input [6:0] duty;

    output out;

    reg [15:0] cnt_freq;
    reg [6:0] cnt_duty;
    
    always @(posedge mclk or negedge reset)     begin
        if(!reset)  begin
            cnt_freq <= 16'd0;
            cnt_duty <= 7'd0;        end

        else begin
            cnt_freq <= (cnt_freq>=freq) ? 16'd0 : cnt_freq + 1'b1;
            cnt_duty <= (cnt_freq==16'd0) ? ((cnt_duty>=7'd100) ? 7'd0 : (cnt_duty+1'b1)) : cnt_duty;   
    end // freq=0 라고설정한다면,cnt_duty = 100 까지카운트(101번)하고0으로초기화, 이때frequency = 100M/101 = 0.99MHz
end

    reg  out;
        always @(posedge mclk or negedge reset)     begin
            if(!reset) out<= 1'b0;
                else out <= (duty == 7'd0 ) ? 1'b0 : (duty == 7'd100) ? 1'b1 : (cnt_duty == 7'd0) ? 1'b1: (cnt_duty == duty) ? 1'b0: out;
    end
endmodule