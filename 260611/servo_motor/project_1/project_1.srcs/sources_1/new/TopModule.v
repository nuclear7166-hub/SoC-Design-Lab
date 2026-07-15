`timescale 1ns/1ps
module TopModule(
    input clk,
    input reset,
    input sw0, sw1, sw2, sw3,
    output Servo,
    output [1:0] mode   );
    
    clockdivider clockdivider(
        .clk(clk),
        .reset(reset),
        .clk10000hz(w_clkout)   );
        
    servo servo(
        .clk(clk),
        .reset(reset),
        .clk10000hz(w_clkout),
        .sw0(sw0),
        .sw1(sw1),
        .sw2(sw2),
        .sw3(sw3),
        .Servo(Servo),
        .mode(mode)     );

endmodule        