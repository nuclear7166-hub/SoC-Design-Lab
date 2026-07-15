module pwm_servo(
    input clk,
    input [7:0] angle,
    output reg pwm_out
);
    reg [20:0] count = 0;
    wire [20:0] duty;

    // 0도 = 0.5ms (50,000 tick), 180도 = 2.5ms (250,000 tick)
    assign duty = 50000 + (angle * 1111);

    always @(posedge clk) begin
        if(count >= 1999999) count <= 0; // 50Hz 주기
        else count <= count + 1'b1;
        
        pwm_out <= (count < duty) ? 1'b1 : 1'b0;
    end
endmodule