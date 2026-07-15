`timescale 1ns/1ps
module fsm_buzzer(
    input sysclk,
    input reset,
    input i_btn,
    output [15:0] o_freq,
    output o_enable );
    
    parameter IDLE = 0, SOUND1 = 1, SOUND2 = 2, SOUND3 = 3, SOUND4 = 4;
    parameter SOUND5 = 5, SOUND6 = 6, SOUND7 = 7, SOUND8 = 8;
    
    reg [31:0] time_counter = 0;
    reg [5:0] state = IDLE, next_state = IDLE;
    reg [15:0] r_freq = 0;
    reg r_enable = 0;
    
    assign o_freq = r_freq;
    assign o_enable = r_enable;
    
    always @(posedge sysclk, negedge reset) begin
        if(~reset) begin
            state <= IDLE;
            time_counter <= 0;
        end
        else begin
            if(state == IDLE) begin
                state <= next_state;
        end
        else begin
            if(time_counter == 50_000_000 -1) begin
                time_counter <= 0;
                state <= next_state;
        end
        else begin
            time_counter <= time_counter + 1;
            state <= state;
            end
        end
    end
end
    
    always @(state, i_btn) begin
        case(state)
            IDLE : begin
                if(i_btn) next_state = SOUND1;
                else next_state = IDLE;
            end
            SOUND1 : begin
                next_state = SOUND2;  
            end
            SOUND2 : begin
                next_state = SOUND3;
            end
            SOUND3 : begin
                next_state = SOUND4;
            end
            SOUND4 : begin
                next_state = SOUND5;
            end
            SOUND5 : begin
                next_state = SOUND6;
            end
            SOUND6 : begin
                next_state = SOUND7;
            end
            SOUND7 : begin
                next_state = SOUND8;
            end
            SOUND8 : begin
                next_state = IDLE;
            end
        endcase
    end
    
    always @(posedge sysclk) begin
        case(state)
            IDLE : begin
                r_enable <= 1'b0;
            end
            SOUND1 : begin
                r_freq <= 1046;
                r_enable <= 1'b1; 
            end
            SOUND2 : begin
                r_freq <= 1175;
                r_enable <= 1'b1;
            end
            SOUND3 : begin
                r_freq <= 1318;
                r_enable <= 1'b1;
            end
            SOUND4 : begin
                r_freq <= 1397;
                r_enable <= 1'b1;
            end
            SOUND5 : begin
                r_freq <= 1568;
                r_enable <= 1'b1;
            end
            SOUND6 : begin
                r_freq <= 1760;
                r_enable <= 1'b1;
            end
            SOUND7 : begin
                r_freq <= 1975;
                r_enable <= 1'b1;    
            end
            SOUND8 : begin
                r_freq <= 2093;
                r_enable <= 1'b1;
            end
        endcase
    end
endmodule                                                                                                                                                                                                                                                                                                         