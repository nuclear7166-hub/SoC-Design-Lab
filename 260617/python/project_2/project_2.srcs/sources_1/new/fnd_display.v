module fnd_display(
    input clk,
    input [16:0] data, 
    output reg [3:0] an,
    output reg [6:0] seg
);
    reg [19:0] refresh_counter = 0;
    wire [1:0] active_digit;
    reg [3:0] current_hex;

    always @(posedge clk) refresh_counter <= refresh_counter + 1'b1;
    assign active_digit = refresh_counter[19:18];

    wire [3:0] thousands = (data / 1000) % 10;
    wire [3:0] hundreds  = (data / 100) % 10;
    wire [3:0] tens      = (data / 10) % 10;
    wire [3:0] ones      = data % 10;

    always @(*) begin
        case(active_digit)
            2'b00: begin an = 4'b1110; current_hex = ones;      end
            2'b01: begin an = 4'b1101; current_hex = tens;      end
            2'b10: begin an = 4'b1011; current_hex = hundreds;  end
            2'b11: begin an = 4'b0111; current_hex = thousands; end
        endcase
    end

    // 배열 수정 완료: seg[6:0] = {g, f, e, d, c, b, a}
    always @(*) begin
        case(current_hex)
            4'h0: seg = 7'b1000000;
            4'h1: seg = 7'b1111001;
            4'h2: seg = 7'b0100100;
            4'h3: seg = 7'b0110000;
            4'h4: seg = 7'b0011001;
            4'h5: seg = 7'b0010010;
            4'h6: seg = 7'b0000010;
            4'h7: seg = 7'b1111000;
            4'h8: seg = 7'b0000000;
            4'h9: seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end
endmodule