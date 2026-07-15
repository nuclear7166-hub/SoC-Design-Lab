`timescale 1ns / 1ps
module Clock_counter(
    resetn, clk, sw, led
    );
    input resetn;
    input clk;
    input [1:0] sw;
    output [3:0] led;
    
    wire w_locked;
    wire w_clk200, w_clk100, w_clk50;
    
    reg [25:0] cnt0;
    always @(posedge w_clk200 or negedge resetn) begin
    if(~resetn) cnt0 <= 26'd0;
        else cnt0 <= (cnt0 == 26'd50_000_000) ? 26'd0 : cnt0 + 1'b1;
    end

    reg [3:0] led0;
    always @(posedge w_clk200 or negedge resetn) begin
    if(~resetn) led0 <= 4'b0;
        else led0 <= (cnt0 == 26'd50_000_000) ? led0 + 1'b1 : led0;        
    end

    reg [25:0] cnt1;
    always @(posedge w_clk100 or negedge resetn) begin
    if(~resetn) cnt1 <= 26'd0;
        else cnt1 <= (cnt1 == 26'd50_000_000) ? 26'd0 : cnt1 + 1'b1;
    end

    reg [3:0] led1;
    always @(posedge w_clk100 or negedge resetn) begin
    if(~resetn) led1 <= 4'b0;
        else led1 <= (cnt1 == 26'd50_000_000) ? led1 + 1'b1 : led1;        
    end 
    
    reg [25:0] cnt2;
    always @(posedge w_clk50 or negedge resetn) begin
    if(~resetn) cnt2 <= 26'd0;
        else cnt2 <= (cnt2 == 26'd50_000_000) ? 26'd0 : cnt2 + 1'b1;
    end

    reg [3:0] led2;
    always @(posedge w_clk100 or negedge resetn) begin
    if(~resetn) led2 <= 4'b0;
        else led2 <= (cnt2 == 26'd50_000_000) ? led2 + 1'b1 : led1;        
    end                   
    
    wire [3:0] led = (sw == 2'b00) ? led0 : (sw == 2'b01) ? led1 : led2;
    
      clk_wiz_0 U0   (
    // Clock out ports
    .clk_out1(w_clk100),     // output clk_out1
    .clk_out2(w_clk50),     // output clk_out2
    .clk_out3(w_clk200),     // output clk_out3
    // Status and control signals
    .resetn(resetn), // input resetn
    .locked(w_locked),       // output locked
   // Clock in ports
    .clk_in1(clk)      // input clk_in1
);              
                    
endmodule
