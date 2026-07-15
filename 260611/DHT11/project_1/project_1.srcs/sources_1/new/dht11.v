module DHT11(
    input clk, reset, clk1Mhz,
    inout dht11_data,
    output [3:0] humidity10, humidity0,
    output [3:0] temperature10, temperature0,
    output reg [7:0] led_bar    );
    
    reg [7:0] humidity, temperature;
    
    assign humidity10 = humidity/10;
    assign humidity0 = humidity%10;
    assign temperature10 = temperature/10;
    assign temperature0 = temperature%10;
    
    parameter S_IDLE = 3'b000;
    parameter S_LOW_18MS = 3'b001;
    parameter S_HIGH_20US = 3'b010;
    
    parameter S_LOW_80US = 3'b011;
    parameter S_HIGH_80US = 3'b100;
    
    parameter S_READ_DATA = 3'b101;
    parameter S_WAIT_PEDGE = 3'b110;
    parameter S_WAIT_NEDGE = 3'b111;
    
    wire dht_nedge, dht_pedge;
    reg count_usec_e;
    reg [21:0] count_usec;
    reg [2:0] state, next_state, read_state;
    reg dht11_data_oe, dht_buffer;
    reg [5:0] data_count;
    reg [39:0] temp_data;
    
    assign dht11_data = dht_buffer;
    always @(negedge clk1Mhz or negedge reset) begin
        if(~reset) count_usec = 0;
        else begin
            if(count_usec_e)
                count_usec = count_usec + 1;
            else if(!count_usec_e)count_usec = 0;
        end
    end
    
    always @(negedge clk1Mhz or negedge reset) begin
        if(~reset)state = S_IDLE;
        else state = next_state;
    end
    
    edge_detector ed_dec(
        .clk(clk1Mhz),
        .cp_in(dht11_data),
        .reset(reset),
        .n_edge(dht_nedge),
        .p_edge(dht_pedge)  );
        
    always @(posedge clk1Mhz or negedge reset) begin
        if(~reset) begin
            count_usec_e <= 0;
            next_state <= S_IDLE;
            dht11_data_oe <= 0;
            dht_buffer <= 1'bz;
            read_state <= S_WAIT_PEDGE;
            data_count <= 0;
            led_bar = 8'b1111_1111;
            end
        else begin
            case(state)
                S_IDLE : begin
                    led_bar[0] <= 0;
                        if(count_usec < 22'd3_000_000) begin
                            count_usec_e <= 1;
                            dht_buffer = 1'bz;
                        end
        else begin
            led_bar <= 8'b1111_1111;
            next_state <= S_LOW_18MS;
            count_usec_e <= 0;
        end
    end
    
                S_LOW_18MS : begin
                    led_bar[1] <= 0;
                    if(count_usec < 22'd20_000) begin
                        count_usec_e <= 1;
                        dht_buffer <= 0;
                    end
        else begin
            count_usec_e <= 0;
            next_state <= S_HIGH_20US;
            dht_buffer = 1'bz;
        end
end       
                S_HIGH_20US : begin
                    led_bar[2] <= 0;
                    if(count_usec < 22'd70) begin
                        dht_buffer = 1'bz;
                        count_usec_e <= 1;
                    if(dht_nedge) begin
                        next_state <= S_LOW_80US;
                        count_usec_e <= 0;
        end
        
        else begin next_state <= S_HIGH_20US;
            count_usec_e <= 1;
            end
        end
        
        else begin
            next_state <= S_IDLE;
            count_usec_e <= 0;
        end
    end
    
                S_LOW_80US : begin
                    led_bar[3] <= 0;
                    if(count_usec < 22'd90) begin
                        if(dht_pedge) begin
                            next_state <= S_HIGH_80US;
                            count_usec_e <= 0;
                        end
        else begin
            next_state <= S_LOW_80US;
                count_usec_e <= 1;
                end
            end else begin
                next_state <= S_IDLE;
                count_usec_e <= 0;
            end
        end
                S_HIGH_80US : begin
                    led_bar[4] <= 0;
                    if(count_usec < 22'd90) begin
                        if(dht_nedge) begin
                        next_state <= S_READ_DATA;
                        count_usec_e <= 0;
                    end
                    
                    else begin
                        next_state <= S_HIGH_80US;
                        count_usec_e <= 1;
                    end
                end
                
                else begin
                    next_state <= S_IDLE;
                    count_usec_e <= 0;
                    end
                end
                
                S_READ_DATA : begin
                    led_bar[5] <= 0;
                    case(read_state)
                        S_WAIT_PEDGE : begin
                            if(dht_pedge) begin
                                read_state <= S_WAIT_NEDGE;
                                count_usec_e <= 1;
                            end
                            else begin
                                count_usec_e = 0;
                            end
                        end
                        
                S_WAIT_NEDGE : begin
                    if(dht_nedge) begin
                        data_count <= data_count + 1;
                        read_state <= S_WAIT_PEDGE;
                        
                        if(count_usec < 50) begin
                            temp_data <= {temp_data[38:0], 1'b0};
                            end
                            else begin
                                temp_data <= {temp_data[38:0], 1'b1};
                                end
                            end
                            else begin
                                count_usec_e <= 1;
                                read_state <= S_WAIT_NEDGE;
                            end
                        end
                        
                        default : read_state = S_WAIT_PEDGE;
                        endcase
                        
                        if(data_count >= 40) begin
                            led_bar[6] <= 0;
                            data_count <= 0;
                            next_state <= S_IDLE;
                            
                        if(temp_data[39:32] + temp_data[31:24] + temp_data[23:16] + temp_data[15:8] == temp_data[7:0]) begin
                            humidity <= temp_data[39:32];
                            temperature <= temp_data[23:16];
                            end
                        end
                    end
                    
                    default : next_state = S_IDLE;
                    endcase
                end
            end
endmodule 