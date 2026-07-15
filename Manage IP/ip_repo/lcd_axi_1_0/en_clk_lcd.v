`timescale 1ns / 1ps
module en_clk_lcd(
    clk,
    reset,
    en_clk
    );
    
    input clk;
    input reset;
    output en_clk;
    
    reg [24:0] cnt_en;
    reg en_clk;
    
    always @(posedge clk or negedge reset) begin
        if(!reset) begin
            cnt_en <= 0;
            en_clk <= 0;
        end
    
    else begin
        if(cnt_en == 199_999) begin
            cnt_en <= 0;
            en_clk <= 1'b1;
        end
    
    else begin
        cnt_en <= cnt_en + 1'b1;
        en_clk <= 0;
        end
    end
end                                           
endmodule
