`timescale 1ns/1ps
module counter(
    input inclk,
    input reset,
    output [7:0] out_counter    );
    
    reg [7:0] count = 0;
    assign out_counter = count;
    
    always @(posedge inclk, negedge reset) begin
        if(~reset) begin
            count <= 0;
    end else begin
    
    if(count>=99) begin
        count <= 0;
    end else begin
        count = count + 1;
        end
    end
end
endmodule