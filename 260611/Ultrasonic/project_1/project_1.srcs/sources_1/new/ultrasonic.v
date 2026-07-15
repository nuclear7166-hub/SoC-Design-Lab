`timescale 1ns/1ps
module ultrasonic(
    input clk, reset, clk1Mhz,
    input echo,
    output reg [3:0] distance_cm100, distance_cm10, distance_cm0,
    output reg trig,
    output reg [7:0] led_bar    );
    
    reg [15:0] distance;
    parameter S_IDLE = 2'b00;
    parameter S_T_HIGH_10 = 2'b01;
    parameter S_E_READ = 2'b10;
    parameter S_READ_DATA = 2'b11;
    parameter S_WAIT_PEDGE = 2'b00;
    parameter S_WAIT_NEDGE = 2'b01;
    
    wire hc_nedge, hc_pedge;
    reg count_usec_e;
    reg [15:0] count_usec;
    reg [1:0] state, next_state, read_state;
    reg [15:0] count_start, count_end;
    
    always @(posedge clk or negedge reset) begin
        if(~reset) begin
            distance_cm100 = 0;
            distance_cm10 = 0;
            distance_cm0 = 0;
            
        end else begin
            distance_cm10 = distance/10;
            distance_cm0 = distance%10;
        end
    end
    
    always @(negedge clk1Mhz or negedge reset) begin
        if(~reset)count_usec = 0;
        
        else if(count_usec_e)count_usec = count_usec + 1;
            else if(!count_usec_e) count_usec = 0;
        end
        
    always @(negedge clk or negedge reset) begin
        if(~reset)state = S_IDLE;
        else state = next_state;
    end
    
    edge_detector_p ed_dec(
        .clk(clk),
        .cp_in(echo),
        .reset(reset),
        .n_edge(hc_nedge),
        .p_edge(hc_pedge)   );
        
    always @(posedge clk or negedge reset) begin
        if(~reset) begin
            count_usec_e <= 0;
            next_state <= S_IDLE;
            read_state <= S_WAIT_PEDGE;
            trig <= 0;
            count_start <= 0;
            count_end <= 0;
            distance <= 0;
            led_bar <= 8'b1111_1111;
        end
        
    else begin
        case(state)
            S_IDLE : begin
                led_bar[0] <= 0;
                if(count_usec < 16'd65_535) begin
                count_usec_e <= 1;
                trig = 0;
        end
    
    else begin
        led_bar <= 8'b1111_1111;
        next_state <= S_T_HIGH_10;
        count_usec_e <= 0;
        end
    end
    
    S_T_HIGH_10 : begin
        led_bar[1] <= 0;
            if(count_usec < 16'd16) begin
                count_usec_e <= 1;
                trig <= 1;
            end
        else begin
            count_usec_e <= 0;
            next_state <= S_E_READ;
            trig <= 0;
            read_state <= S_WAIT_PEDGE;
        end
    end
    
    S_E_READ : begin
        led_bar[2] <= 0;
            case(read_state)
                S_WAIT_PEDGE : begin
                    led_bar[3] <= 0;
                    
        if(hc_pedge) begin
            read_state <= S_WAIT_NEDGE;
            count_start <= count_usec;
        end
        
        else if(count_usec > 16'd23_201) begin
            read_state <= S_WAIT_PEDGE;
            next_state <= S_IDLE;
        end
            else count_usec_e <= 1;
        end
        
        S_WAIT_NEDGE : begin
            led_bar[4] <= 0;
                if(count_usec < 16'd23_201) begin
                if(hc_nedge) begin
                next_state <= S_READ_DATA;
                count_end <= count_usec;
            end
                else begin
                    count_usec_e <= 1;
                    read_state <= S_WAIT_NEDGE;
                end
            end
                else begin
                    read_state <= S_WAIT_PEDGE;
                    next_state <= S_IDLE;
                end
            end
            
            default : begin
                read_state = S_WAIT_PEDGE;
                next_state = S_IDLE;
            end
        endcase
    end
            S_READ_DATA : begin
                led_bar[5] <= 0;
                distance <= (count_end - count_start) / 58;
                    count_start <= 0;
                    count_end <= 0;
                    
                    next_state <= S_IDLE;
                    read_state <= S_WAIT_PEDGE;
                end
                    default : next_state = S_IDLE;
                endcase
            end
        end
endmodule                                                                                                                                                                                                                                                                                                                                                                                       