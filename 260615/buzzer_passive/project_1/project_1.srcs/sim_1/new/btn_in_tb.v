`timescale 1ns / 1ps
module btn_in_tb();

    reg reset, clock;
    
    initial begin
        reset = 0;
        clock = 0;
            
#10000 reset = 1;
    
end

    always #5 clock = ~clock; // 100 Mhz
        reg [15:0] cnt ;
            always @(posedge clock or negedge reset)    begin
                if(~reset) cnt <= 16'b0;
                else       cnt <= cnt+1'b1;
    end
    
        reg btn;
            always @(posedge clock or negedge reset)    begin
                if(~reset) btn <= 1'b0;
                else btn <= (cnt==16'd100) ? 1'b1 : (cnt == 16'd1200) ? 1'b0 : // 1100
                                                      (cnt == 16'd1300) ? 1'b1 : (cnt == 16'd1350) ? 1'b0 : 
                                                      (cnt == 16'd1400) ? 1'b1 : (cnt == 16'd1480) ? 1'b0 :
                                                      (cnt == 16'd4200) ? 1'b1 : (cnt == 16'd5400) ? 4'd0 : 
                                                      (cnt == 16'd5600) ? 1'b1 : (cnt == 16'd5700) ? 4'd0 :                                                     
                                                      (cnt == 16'd5800) ? 1'b1 : (cnt == 16'd5900) ? 4'd0 : btn;
    end
    
    wire btn_out;
    btn_in btn_in(
        .reset(reset),
        .clock(clock),
        .btn_in(btn),
        .btn_out(btn_out)   );
endmodule
