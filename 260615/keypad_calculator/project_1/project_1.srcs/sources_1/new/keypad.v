`timescale 1ns / 1ps
module keypad(
    input clk,reset, clk1000hz, clk50hz,
    input [3:0] row,
    output reg [3:0] col,
    output reg [3:0] key_value,
    output key_pressed_flag
    );
    reg key_valid;
    
    parameter NO_KEY_PRESSED = 5'b00000;
    parameter SCAN_0 = 5'b00001;
    parameter SCAN_1 = 5'b00010;
    parameter SCAN_2 = 5'b00100;
    parameter SCAN_3 = 5'b01000;
    parameter KEY_PROCESS = 5'b10000;
    reg [4:0] state, next_state;
    reg key_pressed_flag;
    
    always @(posedge clk1000hz or negedge reset) begin
        if(~reset)state = NO_KEY_PRESSED;
        else state = next_state;
    end
    
    always @(posedge clk50hz or negedge reset) begin
        if(~reset) begin
            next_state = NO_KEY_PRESSED;
        end else begin
            case(state)
                NO_KEY_PRESSED : begin
                    if(row != 4'b1111) next_state = SCAN_0;
                    else next_state = NO_KEY_PRESSED;
        end
            SCAN_0 : begin
                if(row != 4'b1111) next_state = KEY_PROCESS;
                else next_state = SCAN_1;
        end
            SCAN_1 : begin
                if(row != 4'b1111) next_state = KEY_PROCESS;
                else next_state = SCAN_2;
        end
            SCAN_2 : begin
                if(row != 4'b1111) next_state = KEY_PROCESS;
                else next_state = SCAN_3;
        end                              
            SCAN_3 : begin
                if(row != 4'b1111) next_state = KEY_PROCESS;
                else next_state = NO_KEY_PRESSED;
        end
        KEY_PROCESS : begin
            if(row != 4'b1111) begin
                next_state = KEY_PROCESS;
            end else
                next_state = NO_KEY_PRESSED;
            end
        endcase
    end
end
    always @(posedge clk1000hz or negedge reset) begin
        if(~reset) begin
            col <= 4'h0;
            key_pressed_flag <= 0;
        end
            else case(next_state)
                NO_KEY_PRESSED : begin
                    col <= 4'h0;
                    key_pressed_flag <= 0;
        end
            SCAN_0 : col <= 4'b1110;
            SCAN_1 : col <= 4'b1101;
            SCAN_2 : col <= 4'b1011;
            SCAN_3 : col <= 4'b0111;     
            KEY_PROCESS : begin
                col_val <= col;
                row_val <= row;
                key_pressed_flag <= 1;
            end
        endcase
    end
    
    reg [3:0] col_val, row_val;
    always @(posedge clk or negedge reset) begin
        if(~reset) begin
            key_value = 0;
        end
            else begin
                case({row_val, col_val})
                    8'b1110_1110 : key_value = 4'h1;
                    8'b1110_1101 : key_value = 4'h2;
                    8'b1110_1011 : key_value = 4'h3;
                    8'b1110_0111 : key_value = 4'ha;
                    8'b1101_1110 : key_value = 4'h4;
                    8'b1101_1101 : key_value = 4'h5;
                    8'b1101_1011 : key_value = 4'h6;
                    8'b1101_0111 : key_value = 4'hb;
                    8'b1011_1110 : key_value = 4'h7;
                    8'b1011_1101 : key_value = 4'h8;
                    8'b1011_1011 : key_value = 4'h9;
                    8'b1011_0111 : key_value = 4'hc;
                    8'b0111_1110 : key_value = 4'he;
                    8'b0111_1101 : key_value = 4'h0;
                    8'b0111_1011 : key_value = 4'hf;
                    8'b0111_0111 : key_value = 4'hd;
                endcase
            end
        end                                                                                                                                                                                                                            
endmodule