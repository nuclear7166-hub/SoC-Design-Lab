module top(
    input clk,          
    input rx,           
    output pwm_x,       
    output pwm_y,       
    output buzzer_out,  
    output [3:0] an,    
    output [6:0] seg    
);

    wire [7:0] rx_data;
    wire rx_valid;
    
    reg [7:0] angle_x = 8'd90;
    reg [7:0] angle_y = 8'd90;
    reg shoot_en = 1'b0;

    localparam WAIT_SYNC  = 2'd0;
    localparam GET_X      = 2'd1;
    localparam GET_Y      = 2'd2;
    localparam GET_SHOOT  = 2'd3;
    reg [1:0] state = WAIT_SYNC;

    reg [15:0] shot_count = 16'd0;
    reg shoot_en_delay = 1'b0;
    wire shot_edge;

    uart_rx receiver (.clk(clk), .rx(rx), .rx_data(rx_data), .rx_valid(rx_valid));
    pwm_servo servo_x (.clk(clk), .angle(angle_x), .pwm_out(pwm_x));
    pwm_servo servo_y (.clk(clk), .angle(angle_y), .pwm_out(pwm_y));
    fnd_display display (.clk(clk), .data(shot_count), .an(an), .seg(seg));
    gunshot_sound sound_gen (.clk(clk), .trigger(shot_edge), .buzzer_out(buzzer_out));

    always @(posedge clk) begin
        if (rx_valid) begin
            case (state)
                WAIT_SYNC: if (rx_data == 8'hFF) state <= GET_X;
                GET_X:     begin angle_x <= (rx_data > 180) ? 8'd180 : rx_data; state <= GET_Y; end
                GET_Y:     begin angle_y <= (rx_data > 180) ? 8'd180 : rx_data; state <= GET_SHOOT; end
                GET_SHOOT: begin shoot_en <= (rx_data == 8'h01) ? 1'b1 : 1'b0; state <= WAIT_SYNC; end
                default:   state <= WAIT_SYNC;
            endcase
        end
    end

    always @(posedge clk) begin
        shoot_en_delay <= shoot_en;
    end
    assign shot_edge = (shoot_en == 1'b1) && (shoot_en_delay == 1'b0);

    always @(posedge clk) begin
        if (shot_edge) begin
            if (shot_count >= 16'd9999) shot_count <= 16'd0;
            else shot_count <= shot_count + 1'b1;
        end
    end
endmodule