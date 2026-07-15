`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Create Date: 2026/06/09 09:27:01

// Module Name: clockdivider_pwm

//////////////////////////////////////////////////////////////////////////////////


module clockdivider_pwm(

input  inclk,
input  reset,
output reg  clk_out
);


reg [25:0] cnt = 0;

always @(posedge inclk, negedge reset) begin
    if (~reset) begin
        cnt <= 0;
        clk_out= 0;
    end else begin
      if (cnt == (49)) begin
        cnt <= 0;

    case(clk_out)
    1'b0 : clk_out <= 1;
    1'b1 : clk_out <= 0;
    endcase
    
    end else begin
        cnt <= cnt + 1;
        end
    end
end

endmodule
