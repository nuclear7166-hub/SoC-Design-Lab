`timescale 1ns/1ps
module clockdivider_10Hz(
    clk,
    clk10Hz );
    
    input clk;
    output reg clk10Hz;
    
    reg [22:0] cnt = 0;
    
    always @(posedge clk) begin
        if(cnt == 4_999_999) begin
            cnt <= 0;
            clk10Hz <= ~clk10Hz;
        end else begin
            cnt <= cnt + 1;
        end
    end
endmodule