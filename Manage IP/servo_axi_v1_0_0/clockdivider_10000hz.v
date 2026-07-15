`timescale 1ns / 1ps
module clockdivider_10000hz(
    input clk,
    input reset,
    output reg clk10000hz
    );
    
    reg [25:0] cnt = 0;
    always @(posedge clk, negedge reset) begin
        if(~reset) begin
            cnt <= 0;
        end else begin
            if(cnt == (5_000 -1)) begin
                cnt <= 0;
                clk10000hz <= ~clk10000hz;
        end else begin
            cnt <= cnt + 1;
        end
    end
end                                         
endmodule
