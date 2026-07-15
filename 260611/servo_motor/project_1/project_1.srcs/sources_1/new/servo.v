`timescale 1ns/1ps
module servo(
    input clk, reset,
    input clk10000hz,
    input sw0, sw1, sw2, sw3,
    output reg Servo,
    output reg [1:0] mode   );
    
    reg [9:0] duty;
    reg [9:0] cnt_duty;
    
    always @(posedge clk10000hz or negedge reset) begin
    if(~reset) begin
        cnt_duty = 0;
        Servo = 0;
    
    end else begin
        if(cnt_duty >= 200)
            cnt_duty = 0;
    
    else
        cnt_duty = cnt_duty + 1;
        
    if(cnt_duty < duty)
        Servo = 1;
    else Servo = 0;
    
    if(sw0 == 1'b1)
        mode = 2'b00;
    else if(sw1 == 1'b1)
        mode = 2'b01;
    else if(sw2 == 1'b1)
        mode = 2'b10;
    else if(sw3 == 1'b1)
        mode = 2'b11;
    else mode = 2'b00;
    
    case(mode)
        2'b00 : duty <= 0;
        2'b01 : duty <= 7;
        2'b10 : duty <= 16;
        2'b11 : duty <= 25;
        endcase
    end
end
endmodule