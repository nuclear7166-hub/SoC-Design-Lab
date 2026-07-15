`timescale 1ns / 1ps
module buzzer_controller(
    input clk,
    input reset,
    input sw0,
    output CTL
    );
    
    buzzer(
        .clk(clk),
        .reset(reset),
        .sw0(sw0),
        .CTL(CTL)   );
endmodule
