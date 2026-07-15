`timescale 1ns / 1ps
module TopModule(
    input clk,
    input reset,
    inout dht11_data,
    output [7:0] fnd,
    output [3:0] fndsel,
    output [7:0] led_bar
    );
    
    DHT11 DHT11(
        .clk(clk),
        .reset(reset),
        .clk1Mhz(clk1Mhz),
        .dht11_data(dht11_data),
        .humidity10(ind),
        .humidity0(inc),
        .temperature10(inb),
        .temperature0(ina),
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
        .out_counter(w_counter)     );
        
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
