module pwm_servo(
    input clk,
    input [7:0] angle,
    output reg pwm_out
);
    reg [20:0] counter = 0;
    reg [20:0] duty_cycle = 0;

    always @(posedge clk) begin
        // 20ms 주기 (2,000,000 틱) 카운터
        if (counter >= 21'd1999999) counter <= 0;
        else counter <= counter + 1;

        // Duty 계산: 100,000 + (angle * 555)
        duty_cycle <= 21'd100000 + (angle * 21'd555);

        // PWM 출력 논리
        if (counter < duty_cycle) pwm_out <= 1;
        else pwm_out <= 0;
    end
endmodule