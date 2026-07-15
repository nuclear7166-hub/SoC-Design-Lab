`timescale 1ns / 1ps
module spi_task_tb( );
    
    reg reset, clock;
    initial begin
        reset = 0;
        clock = 0;
            
#10000 reset = 1;
    
end

    always #5 clock = ~clock; // 100 Mhz
        reg [19:0] cnt ;
            always @(posedge clock or negedge reset)    begin
                if(~reset) cnt <= 20'd0;
                else cnt <= cnt+1'b1;
    end
    
        reg [3:0] btn;
            always @(posedge clock or negedge reset)    begin
                if(~reset) btn <= 4'd0;
                else btn <= (cnt==20'd10000) ? 4'd1 : (cnt == 20'd10100) ? 4'd0 : // 4'd1 ? 0001
                                                      (cnt == 20'd20000) ? 4'd2 : (cnt == 20'd20100) ? 4'd0 : // 4'd2 => 0010
                                                      (cnt == 20'd30000) ? 4'd4 : (cnt == 20'd30100) ? 4'd0 : // 4'd4 => 0100
                                                      (cnt == 20'd40000) ? 4'd8 : (cnt == 20'd40100) ? 4'd0 : // 4'd8 => 1000
                                                      (cnt == 20'd50000) ? 4'd1 : (cnt == 20'd50100) ? 4'd0 : // 4'd1 => 0001
                                                      (cnt == 20'd60000) ? 4'd2 : (cnt == 20'd60100) ? 4'd0 : // 4'd2 => 0010
                                                      (cnt == 20'd70000) ? 4'd4 : (cnt == 20'd70100) ? 4'd0 : // 4'd4 => 0100
                                                      (cnt == 20'd80000) ? 4'd8 : (cnt == 20'd80100) ? 4'd0 : // 4'd8 => 1000
                                                      (cnt == 20'd90000) ? 4'd1 : (cnt == 20'd90100) ? 4'd0 : btn;
    end
    
    wire [7:0] led;
        spi_task spi_task_u1(
            .reset(reset),
            .clock(clock),
            .btn(btn),
            .led(led) );
 endmodule