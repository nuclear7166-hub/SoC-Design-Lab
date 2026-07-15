module uart_rx (
    input clk,
    input rx,
    output reg [7:0] rx_data,
    output reg rx_valid
);
    // 100MHz / 9600 bps
    localparam CLK_PER_BIT = 10416;

    reg [2:0] state = 0;
    reg [13:0] clk_count = 0;
    reg [2:0] bit_idx = 0;
    reg [7:0] temp_data = 0;

    always @(posedge clk) begin
        rx_valid <= 1'b0;
        case (state)
            0: begin // IDLE
                if (rx == 1'b0) begin state <= 1; clk_count <= 0; end
            end
            1: begin // START_BIT (가운데 샘플링)
                if (clk_count == CLK_PER_BIT / 2) begin
                    if (rx == 1'b0) begin state <= 2; clk_count <= 0; end 
                    else state <= 0;
                end else clk_count <= clk_count + 1'b1;
            end
            2: begin // DATA_BITS
                if (clk_count == CLK_PER_BIT - 1) begin
                    clk_count <= 0;
                    temp_data[bit_idx] <= rx;
                    if (bit_idx == 7) begin bit_idx <= 0; state <= 3; end 
                    else bit_idx <= bit_idx + 1'b1;
                end else clk_count <= clk_count + 1'b1;
            end
            3: begin // STOP_BIT
                if (clk_count == CLK_PER_BIT - 1) begin
                    rx_data <= temp_data;
                    rx_valid <= 1'b1;
                    state <= 0;
                    clk_count <= 0;
                end else clk_count <= clk_count + 1'b1;
            end
            default: state <= 0;
        endcase
    end
endmodule