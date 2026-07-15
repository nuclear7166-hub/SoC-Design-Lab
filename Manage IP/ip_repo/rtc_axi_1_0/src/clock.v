`timescale 1ns / 1ps
module clock(
    clk,
    reset,
    out_min,
    out_sec,
    out_hour,
    out_msec
    );
    
    reg [7:0] min, sec;
    reg [7:0] hour;
    reg [7:0] msec;
    
    input reset;
    input clk;
    output [7:0] out_min, out_sec;
    output [7:0] out_hour;
    output [7:0] out_msec;
    
    assign out_sec = sec;
    assign out_min = min;
    assign out_msec = msec;
    assign out_hour = hour;
    
    always@(posedge clk or negedge reset) begin
    if(~reset)
        msec <= 7'd0;
    else if(msec >= 7'd9)
        msec <= 7'd0;
    else
        msec <= msec + 1'b1;
    end

    always@(posedge clk or negedge reset) begin
    if(~reset)
        sec <= 7'd0;
    else if(msec >= 7'd9) begin
        if(sec >= 7'd59)
            sec <= 7'd0;
    else
        sec <= sec + 1'b1;
    end
end

    always@(posedge clk or negedge reset) begin
    if(~reset)
        min <= 7'd0;
    else 
        if(sec >= 7'd59) begin
            if(msec >= 7'd9)
                if(min >= 7'd59)
                    min <= 7'd0;
    else
        min <= min + 1'b1;
    end
end

    always@(posedge clk or negedge reset) begin
    if(~reset)
        hour <= 7'd0;
    else if(msec >= 7'd9)
        if(sec >= 7'd59) begin
            if(msec >= 7'd9)
                if(min >= 7'd59)
                    if(hour >= 7'd23)
                        hour <= 7'd0;
    else 
        hour <= hour + 1'b1;
    end
end
endmodule
