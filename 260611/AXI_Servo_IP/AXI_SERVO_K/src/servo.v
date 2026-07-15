`timescale 1ns / 1ps
module servo(
 input clk, reset,
    input clk10000hz,
    input [7:0] data,
    output reg Servo
    );

    reg [1:0] mode;
    reg [7:0] duty;
    reg [9:0] cnt_duty;


always @(posedge clk or negedge reset) begin
        if(~reset) begin
            duty = 0;
        end else begin
       duty = data;
 end
end 

always @(posedge clk10000hz or negedge reset) begin
        if(~reset) begin
            cnt_duty = 0;
            Servo = 0;
        end else begin
        
    if(cnt_duty >= 200) cnt_duty = 0;
        else cnt_duty = cnt_duty + 1;
            
    if(cnt_duty < duty) Servo = 1;
        else Servo = 0;    
 end
end 

endmodule
