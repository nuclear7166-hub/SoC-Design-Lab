module top(
    input clk,          
    input rx,           
    output pwm_x,       
    output pwm_y,
    output [7:0] led    // Basys3 온보드 LED 8개 추가
);

    wire [7:0] rx_data;
    wire rx_valid;
    
    reg [7:0] angle_x = 8'd90;
    reg [7:0] angle_y = 8'd90;
    
    localparam WAIT_SYNC = 2'd0;
    localparam GET_X     = 2'd1;
    localparam GET_Y     = 2'd2;
    reg [1:0] state = WAIT_SYNC;

    // LED 디버깅 매핑
    // LED[1:0] : 현재 상태 머신의 상태 (00: WAIT, 01: GET_X, 10: GET_Y)
    // LED[7:2] : 수신된 X축 각도의 상위 6비트 (모터 각도 변화시 상위 비트 LED가 깜빡여야 함)
    assign led[1:0] = state;
    assign led[7:2] = angle_x[7:2];

    uart_rx receiver (
        .clk(clk), .rx(rx), .rx_data(rx_data), .rx_valid(rx_valid)
    );

    pwm_servo servo_x (.clk(clk), .angle(angle_x), .pwm_out(pwm_x));
    pwm_servo servo_y (.clk(clk), .angle(angle_y), .pwm_out(pwm_y));

    always @(posedge clk) begin
        if (rx_valid) begin
            case (state)
                WAIT_SYNC: begin
                    if (rx_data == 8'hFF) state <= GET_X;
                end
                GET_X: begin
                    angle_x <= (rx_data > 180) ? 8'd180 : rx_data;
                    state <= GET_Y;
                end
                GET_Y: begin
                    angle_y <= (rx_data > 180) ? 8'd180 : rx_data;
                    state <= WAIT_SYNC;
                end
                default: state <= WAIT_SYNC;
            endcase
        end
    end
endmodule