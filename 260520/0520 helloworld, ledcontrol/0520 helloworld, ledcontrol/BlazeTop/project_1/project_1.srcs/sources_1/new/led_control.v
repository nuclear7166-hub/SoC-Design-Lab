`timescale 1ns / 1ps

module led_control(
    reset,
    clock,
    led    );
    
    input reset;
    input clock;
    output [3:0] led;
    
    reg [25:0] cnt;
    
    always @(posedge clock or negedge reset)    begin
        if(~reset) cnt <= 26'd0;
        else       cnt <= (cnt == 26'd50_000_000) ? 26'd0 : cnt + 1'b1;
    end
    
    reg [3:0] led;
    
    always @(posedge clock or negedge reset)    begin
        if(~reset) led <= 4'd0;
        else       led <= (cnt == 26'd50_000_000) ? led + 1'b1 : led;
    end        
endmodule
