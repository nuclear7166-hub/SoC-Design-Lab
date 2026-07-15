`timescale 1ns / 1ps
module buzzer(
    input clk,
    input reset,
    input sw0,
    output reg CTL
    );
    
    always @(posedge clk, posedge reset) begin
        if(reset) begin
            CTL = 1;
        end
        else begin
            if(sw0 == 1'b1) CTL = 0;
        else CTL = 1;
        end
    end                    
endmodule
