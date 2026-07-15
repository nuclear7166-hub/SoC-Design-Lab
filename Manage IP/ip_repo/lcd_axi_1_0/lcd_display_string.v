`timescale 1ns / 1ps
module lcd_display_string(
    clk,
    reset,
    index,
    out,
    hour, min, sec
    );
    
    input clk, reset;
    input [4:0] index;
    output [7:0] out;
    input [7:0] hour, min, sec;
    
    wire [4:0] index;
    reg [7:0] out;
    reg [7:0] hour10_ASC, hour0_ASC, min10_ASC, min0_ASC, sec10_ASC, sec0_ASC;
    reg [7:0] hour10, hour0, min10, min0, sec10, sec0;
    
    always @(posedge clk or negedge reset) begin
        if(!reset) begin
            hour10 = 0;
            hour0 = 0;
            min10 = 0;
            min0 = 0;
            sec10 = 0;
            sec0 = 0;
        end
    else begin
        hour10 = hour/10;
        hour0 = hour%10;
        min10 = min/10;
        min0 = min%10;
        sec10 = sec/10;
        sec0 = sec%10;
    end
end            
    
    always @(posedge clk or negedge reset) begin
        if(~reset) begin
            hour10_ASC = 8'h30;
            hour0_ASC = 8'h30;     
            min10_ASC = 8'h30;
            min0_ASC = 8'h30;
            sec10_ASC = 8'h30;
            sec0_ASC = 8'h30;
        end else begin
            case(hour10)
                8'd0 : hour10_ASC <= 8'h30;
                8'd1 : hour10_ASC <= 8'h31;
                8'd2 : hour10_ASC <= 8'h32;
                8'd3 : hour10_ASC <= 8'h33;
                8'd4 : hour10_ASC <= 8'h34;
                8'd5 : hour10_ASC <= 8'h35;
                8'd6 : hour10_ASC <= 8'h36;
                8'd7 : hour10_ASC <= 8'h37;
                8'd8 : hour10_ASC <= 8'h38;
                8'd9 : hour10_ASC <= 8'h39;
        endcase
            case(hour0)
                8'd0 : hour0_ASC <= 8'h30;
                8'd1 : hour0_ASC <= 8'h31;
                8'd2 : hour0_ASC <= 8'h32;
                8'd3 : hour0_ASC <= 8'h33;
                8'd4 : hour0_ASC <= 8'h34;
                8'd5 : hour0_ASC <= 8'h35;
                8'd6 : hour0_ASC <= 8'h36;
                8'd7 : hour0_ASC <= 8'h37;
                8'd8 : hour0_ASC <= 8'h38;
                8'd9 : hour0_ASC <= 8'h39;
        endcase
            case(min10)
                8'd0 : min10_ASC <= 8'h30;
                8'd1 : min10_ASC <= 8'h31;
                8'd2 : min10_ASC <= 8'h32;
                8'd3 : min10_ASC <= 8'h33;
                8'd4 : min10_ASC <= 8'h34;
                8'd5 : min10_ASC <= 8'h35;
                8'd6 : min10_ASC <= 8'h36;
                8'd7 : min10_ASC <= 8'h37;
                8'd8 : min10_ASC <= 8'h38;
                8'd9 : min10_ASC <= 8'h39;
        endcase
            case(min0)
                8'd0 : min0_ASC <= 8'h30;
                8'd1 : min0_ASC <= 8'h31;
                8'd2 : min0_ASC <= 8'h32;
                8'd3 : min0_ASC <= 8'h33;
                8'd4 : min0_ASC <= 8'h34;
                8'd5 : min0_ASC <= 8'h35;
                8'd6 : min0_ASC <= 8'h36;
                8'd7 : min0_ASC <= 8'h37;
                8'd8 : min0_ASC <= 8'h38;
                8'd9 : min0_ASC <= 8'h39;
        endcase
            case(sec10)
                8'd0 : sec10_ASC <= 8'h30;
                8'd1 : sec10_ASC <= 8'h31;
                8'd2 : sec10_ASC <= 8'h32;
                8'd3 : sec10_ASC <= 8'h33;
                8'd4 : sec10_ASC <= 8'h34;
                8'd5 : sec10_ASC <= 8'h35;
                8'd6 : sec10_ASC <= 8'h36;
                8'd7 : sec10_ASC <= 8'h37;
                8'd8 : sec10_ASC <= 8'h38;
                8'd9 : sec10_ASC <= 8'h39;
        endcase
            case(sec0)
                8'd0 : sec0_ASC <= 8'h30;
                8'd1 : sec0_ASC <= 8'h31;
                8'd2 : sec0_ASC <= 8'h32;
                8'd3 : sec0_ASC <= 8'h33;
                8'd4 : sec0_ASC <= 8'h34;
                8'd5 : sec0_ASC <= 8'h35;
                8'd6 : sec0_ASC <= 8'h36;
                8'd7 : sec0_ASC <= 8'h37;
                8'd8 : sec0_ASC <= 8'h38;
                8'd9 : sec0_ASC <= 8'h39;
        endcase
    end              
end 

    always @(posedge clk or negedge reset) begin
        if(~reset)
            out <= 8'h00;
        else
            case(index)
            00 : out <= 8'h30;
            01 : out <= 8'h3A;
            02 : out <= 8'h57;
            03 : out <= 8'h73;
            04 : out <= 8'h68;
            05 : out <= 8'h20;
            06 : out <= 8'h31;
            07 : out <= 8'h3A;
            08 : out <= 8'h52;
            09 : out <= 8'h69;
            10 : out <= 8'h6E;
            11 : out <= 8'h20;
            12 : out <= 8'h32;
            13 : out <= 8'h3A;
            14 : out <= 8'h44;
            15 : out <= 8'h68;
            16 : out <= hour10_ASC;
            17 : out <= hour0_ASC;
            18 : out <= 8'h3A;
            19 : out <= min10_ASC;
            20 : out <= min0_ASC;
            21 : out <= 8'h3A;
            22 : out <= sec10_ASC;
            23 : out <= sec0_ASC;
            24 : out <= 8'h20;
            25 : out <= 8'h20;
            26 : out <= 8'h20;
            27 : out <= 8'h20;
            28 : out <= 8'h20;
            29 : out <= 8'h20;
            30 : out <= 8'h20;
            31 : out <= 8'h20;
            default : out <= 8'h00;
        endcase
    end                         
endmodule
