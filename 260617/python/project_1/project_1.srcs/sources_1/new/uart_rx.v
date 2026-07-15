module uart_rx(
    input clk,
    input rx,
    output reg [7:0] rx_data,
    output reg rx_valid
);
    parameter CLKS_PER_BIT = 10416; // 100MHz / 9600 Baud
    
    localparam IDLE  = 3'd0;
    localparam START = 3'd1;
    localparam DATA  = 3'd2;
    localparam STOP  = 3'd3;
    
    reg [2:0] state = IDLE;
    reg [13:0] clk_count = 0;
    reg [2:0] bit_index = 0;
    
    always @(posedge clk) begin
        case (state)
            IDLE: begin
                rx_valid <= 0;
                clk_count <= 0;
                bit_index <= 0;
                if (rx == 0) state <= START; // Start bit 감지
            end
            START: begin
                if (clk_count == (CLKS_PER_BIT/2)) begin // 비트의 중앙에서 샘플링
                    if (rx == 0) begin
                        clk_count <= 0;
                        state <= DATA;
                    end else state <= IDLE; // 노이즈 처리
                end else clk_count <= clk_count + 1;
            end
            DATA: begin
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    clk_count <= 0;
                    rx_data[bit_index] <= rx;
                    if (bit_index < 7) bit_index <= bit_index + 1;
                    else state <= STOP;
                end
            end
            STOP: begin
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    rx_valid <= 1; // 1 클럭 동안 유효 신호 발생
                    state <= IDLE;
                end
            end
            default: state <= IDLE;
        endcase
    end
endmodule