`timescale 1ns/1ps
module freq_gen2(
    input sysclk,
    input reset,
    input enable,
    input [15:0] i_freq,
    output o_freq   );
    
    reg [16:0] counter = 0;
    reg [16:0] counter1 = 0;
    reg r_freq = 0;
    
    assign o_freq = r_freq;
    
    always @(posedge sysclk, negedge reset) begin
        if(~reset) begin
            counter1 <= 0;
        end
        else begin
        if(enable)
            counter1 = 50_000_000/i_freq;
        else
            counter1 <= 0;
        end
    end
    always @(posedge sysclk, negedge reset) begin
        if(~reset) begin
            counter <= 0;
        end
        else begin
            if(enable) begin
                if(counter == counter1-1) begin
                    counter <= 0;
                    r_freq <= ~r_freq;
        end
        else begin
            counter <= counter + 1;
        end
    end
    else begin
        counter <= 0;
        r_freq <= 0;
        end
    end
end
endmodule                                                                                                            