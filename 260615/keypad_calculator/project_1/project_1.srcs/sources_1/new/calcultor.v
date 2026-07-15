`timescale 1ns / 1ps
module calculator(
    input [3:0] key_value,
    input key_pressed_flag,
    input clk1000hz,
    input reset,
    output reg [3:0] digit0, digit1, digit2, digit3,
    output reg [3:0] countbit
    );
    reg [3:0] A, B, C;
    
    always @(posedge clk1000hz or negedge reset) begin
        if(~reset) begin
            A <= 4'd0;
            B <= 4'd0;
            C <= 4'd0;
            digit0 <= 4'd0;
            digit1 <= 4'd0;
            digit2 <= 4'd0;
            digit3 <= 4'd0;
            countbit <= 4'b0000;
    end else begin
        if((key_pressed_flag == 1'b1) && (digit0 != key_value)) begin
            if(countbit == 4'b0000) begin
                if(key_value < 4'd10) begin
                    A <= key_value;
                    digit0 <= key_value;
                    digit1 <= 0;
                    digit2 <= 0;
                    digit3 <= key_value;
                    countbit <= 4'b0001;
    end else begin
        A <= 4'd0;
        B <= 4'd0;
        C <= 4'd0; 
        digit0 <= key_value;
        digit1 <= 4'd0;
        digit2 <= 4'd0;
        digit3 <= 4'd0;
        countbit <= 4'b0000;
    end
end
    else if(countbit == 4'b0001) begin
        if((key_value > 4'd9) && (key_value < 4'he)) begin
            B <= key_value;
            digit0 <= key_value;
            digit2 <= key_value;
            countbit <= 4'b0010;
    end else begin
        A <= 4'd0;
        B <= 4'd0;
        C <= 4'd0;
        digit0 <= key_value;
        digit1 <= 4'd0;
        digit2 <= 4'd0;
        digit3 <= 4'd0;
        countbit <= 4'b0000;
    end
end
    else if(countbit == 4'b0010) begin
        if(key_value < 4'd10) begin
            C <= key_value;
            digit0 <= key_value;
            digit1 <= key_value;
            countbit <= 4'b0100;
    end else begin
        A <= 4'd0;
        B <= 4'd0;
        C <= 4'd0;
        digit0 <= key_value;
        digit1 <= 4'd0;
        digit2 <= 4'd0;
        digit3 <= 4'd0;
        countbit <= 4'b0000;
    end
end
    else if(countbit == 4'b0100) begin
        if(key_value == 4'hf) begin
            countbit <= 4'b1000;
            digit0 <= key_value;
            digit1 <= 4'd0;
                case(B)
                    4'ha : begin
                        digit3 = (A+C)/10;
                        digit2 = (A+C)%10;
                    end
                    4'hb : begin
                        if(A > C) begin
                            digit3 = (A - C)/10;
                            digit2 = (A - C)%10;
                    end
    else begin
        digit3 = 4'hb;
        digit2 = (C - A)%10;
    end
end    
                    4'hc : begin    
                        digit3 = (A * C)/10;
                        digit2 = (A * C)%10;
                    end
                    4'hd : begin
                        digit3 = (A / C)/10;
                        digit2 = (A / C)%10;
                    end
                endcase
    end else begin
        A <= 4'd0;
        B <= 4'd0;
        C <= 4'd0;
        digit0 <= key_value;
        digit1 <= 4'd0;
        digit2 <= 4'd0;
        digit3 <= 4'd0;
        countbit <= 4'b0000;
    end
end
    else if(countbit == 4'b1000) begin
        if(key_value < 4'd10) begin
            A <= key_value;
            digit0 <= key_value;
            digit1 <= 0;
            digit2 <= 0;
            digit3 <= key_value;
            countbit <= 4'b0001;
    end else begin
        A <= 4'd0;
        B <= 4'd0;
        C <= 4'd0;
        digit0 <= key_value;
        digit1 <= 4'd0;
        digit2 <= 4'd0;
        digit3 <= 4'd0;
        countbit <= 4'b0000;
    end
end
    if(key_value == 4'he) begin
        A <= 4'd0;
        B <= 4'd0;
        C <= 4'd0;
        digit0 <= 4'he;
        digit1 <= 4'd0;
        digit2 <= 4'd0;
        digit3 <= 4'd0;
        countbit <= 4'b0000;
        end
    end
end
end
endmodule                                            