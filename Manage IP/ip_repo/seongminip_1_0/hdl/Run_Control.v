`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Create Date: 2026/06/09 09:27:01

// Module Name: Run_Control

//////////////////////////////////////////////////////////////////////////////////


module Run_Control(
input [1:0] i_direction,
input i_en,
output [1:0] o_direction
);
    
reg [1:0] r_dir;
    
assign o_direction = r_dir;

always @(*) begin   
    if(i_en==1'b1) 
        case(i_direction)
            2'b00 : r_dir = 2'b00;
            2'b01 : r_dir = 2'b01;
            2'b10 : r_dir = 2'b10;
            2'b11 : r_dir = 2'b00;
            default : r_dir = 2'b00;
        endcase
        
        else
            r_dir = 2'b00;
        end

endmodule
