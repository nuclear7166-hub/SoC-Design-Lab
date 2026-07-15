`timescale 1ns / 1ps
module spram_tb(    );
    reg reset, clock;
    
    initial begin
        reset = 0;
        clock = 0;
        
    #10000  reset = 1;  end

    always #5 clock = ~clock; // 100MHz
    
    reg [10:0] cnt;
    
    always @(posedge clock or negedge reset)    begin
        if(~reset)  cnt <= 11'b0;
            else    cnt <= cnt + 1'b1; 
    end
    
    reg [9:0] addr;
    
    always @(posedge clock or negedge reset) begin
        if(~reset)  addr <= 10'b0;
            else    addr <= ~cnt[10] ? 10'b0 : cnt[9:0];
    end            

    reg ena;
    
    always @(posedge clock or negedge reset) begin
        if(~reset)  ena <= 1'b0;
            else    ena <= ~cnt[10] ? 1'b0 : 1'b1;
    end                

    reg wea;
    
    always @(posedge clock or negedge reset) begin
        if(~reset)  wea <= 1'b0;
            else    wea <= (cnt == 11'b0) ? ~wea : wea;
    end                    

    reg line;
    
    always @(posedge clock or negedge reset) begin
        if(~reset)  line <= 4'b0;
            else    line <= (~wea & (cnt == 11'h7ff)) ? line + 1'b1 : line;
    end                    
    
    wire [15:0] din = {line, 2'b0, addr};
    wire [15:0] dout1;
        spram1 spram1_u1(
            .clka(clock),
            .ena(ena),
            .wea(wea),
            .addra(addr),
            .dina(din),
            .douta(dout1) );
            
    wire [15:0] dout2;
        spram2 spram2_u1(
            .clka(clock),
            .ena(ena),
            .wea(wea),
            .addra(addr),
            .dina(din),
            .douta(dout2) );
            
    wire [15:0] dout3;
        spram3 spram3_u1(
            .clka(clock),
            .ena(ena),
            .wea(wea),
            .addra(addr),
            .dina(din),
            .douta(dout3) ); 
            
    wire [15:0] dout4;
        spram4 spram4_u1(
            .clka(clock),
            .ena(ena),
            .regcea(1'b1),
            .wea(wea),
            .addra(addr),
            .dina(din),
            .douta(dout4) );

    wire [15:0] dout5;
        spram5 spram5_u1(
            .clka(clock),
            .ena(ena),
            .regcea(1'b1),
            .wea(wea),
            .addra(addr),
            .dina(din),
            .douta(dout5) );
            
    wire [15:0] dout6;
        spram6 spram6_u1(
            .clka(clock),
            .ena(ena),
            .regcea(1'b1),
            .wea(wea),
            .addra(addr),
            .dina(din),
            .douta(dout6) );                                                              
endmodule
