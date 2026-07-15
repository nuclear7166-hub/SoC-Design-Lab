`timescale 1ns / 1ps

module clockdivider(
    input clk,
    input reset,    
    output reg clk1000Hz,
    output reg clk50hz  
    );
    
    reg [25:0] cnt1000 = 0;
    reg [25:0] cnt50 = 0;

    always @(posedge clk or negedge reset) begin
        if(~reset) begin
            cnt1000 <= 0;
            clk1000Hz <= 0;
        end else begin
            if(cnt1000 >= 49_999) begin
                cnt1000 <= 0;
                clk1000Hz <= ~clk1000Hz;
            end else begin
                cnt1000 <= cnt1000 + 1;
            end
        end
    end

    always @(posedge clk or negedge reset) begin
        if(~reset) begin
            cnt50 <= 0;
            clk50hz <= 0;
        end else begin
            if(cnt50 >= 999_999) begin
                cnt50 <= 0;
                clk50hz <= ~clk50hz;
            end else begin
                cnt50 <= cnt50 + 1;
            end
        end
    end

endmodule