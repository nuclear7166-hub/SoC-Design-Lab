`timescale 1ns / 1ps
module TopModule(
    input clk,
    input reset,
    input echo,
    output trig,
    output [7:0] fnd,
    output [3:0] fndsel,
    output [7:0] led_bar
    );
    
    ultrasonic ultrasonic(
        .clk(clk),
        .reset(reset),
        .clk1Mhz(clk1Mhz),
        .echo(echo),
        .trig(trig),
        .distance_cm10(inb),
        .distance_cm0(ina),
        .led_bar(led_bar)   );
        
    wire [3:0] ina, inb, inc, ind;
    
    clockdivider U1(
        .clk(clk),
        .reset(reset),
        .clk1Mhz(clk1Mhz),
        .clk1000hz(w_clkout)    );
        
    wire w_clkout;
    wire [1:0] w_counter;
    wire [3:0] w_datafnd;
    
    counter U0(
        .inclk(w_clkout),
        .reset(reset),
        .out_counter(w_counter) );
        
    datamux4x1 U2(
        .ina(ina),
        .inb(inb),
        .inc(inc),
        .ind(ind),
        .insel(w_counter),
        .outy(w_datafnd)    );

    mux4x1 U3(
        .s(w_counter),
        .y(fndsel)  );
        
    fnddecoder U4(
        .a(w_datafnd),
        .fnd(fnd)   );
                                
endmodule
