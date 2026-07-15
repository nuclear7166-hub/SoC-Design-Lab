`timescale 1ns / 1ps
module sdpram_tb( );
    reg reset, clka, clkb;
    
    initial begin
        reset = 0;
        clka = 0;
        clkb = 0;
        
#10000  reset = 1;  end

    always #5 clka = ~clka;         //100MHz
    always #10 clkb = ~clkb;        //50MHz
    
    //Port A
    reg [11:0]  cnta;
    always @(posedge clka or negedge reset) begin
        if(~reset)  cnta <= 12'b0;
            else    cnta <= cnta + 1'b1;    end 

    reg [9:0]  addra;
    always @(posedge clka or negedge reset) begin
        if(~reset)  addra <= 10'b0;
            else    addra <= (cnta[11:10] == 2'b00) ? cnta[9:0] : 10'b0; end
            
    reg ena;
    always @(posedge clka or negedge reset) begin
        if(~reset)  ena <= 1'b0;
            else    ena <= (cnta[11:10] == 2'b00) ? 1'b1 : 1'b0; end
            
    reg wea;
    always @(posedge clka or negedge reset) begin
        if(~reset)  wea <= 1'b0;
            else    wea <= (cnta[11:10] == 2'b00) ? 1'b1 : 1'b0; end  
            
    reg [15:0]  dina;
    always @(posedge clka or negedge reset) begin
        if(~reset)  dina <= 16'b0;
            else    dina <= (cnta[11:10] == 2'b00) ? {6'b0, cnta[9:0]} : 16'b0; end                    
    
    //Port B
    reg [10:0]  cntb;
    always @(posedge clkb or negedge reset) begin
        if(~reset)  cntb <= 11'b0;
            else    cntb <= cntb + 1'b1;    end     
            
    reg [9:0]  addrb;
    always @(posedge clkb or negedge reset) begin
        if(~reset)  addrb <= 10'b0;
            else    addrb <= cntb[10] ? cntb[9:0] : 10'b0; end 
            
    reg enb;
    always @(posedge clkb or negedge reset) begin
        if(~reset)  enb <= 1'b0;
            else    enb <= cntb[10] ? 1'b1 : 1'b0; end      
            
    wire [15:0] doutb1;         // write first
        sdpram1 sdpram1_u1(
            .clka(clka),
            .ena(ena),
            .wea(wea),
            .addra(addra),
            .dina(dina),
            .clkb(clkb),
            .enb(enb),
            .regceb(1'b1),
            .addrb(addrb),
            .doutb(doutb1) );    
            
    wire [15:0] doutb2;         // read first
        sdpram2 sdpram2_u1(
            .clka(clka),
            .ena(ena),
            .wea(wea),
            .addra(addra),
            .dina(dina),
            .clkb(clkb),
            .enb(enb),
            .regceb(1'b1),
            .addrb(addrb),
            .doutb(doutb2) );  
            
    wire [15:0] doutb3;         // no change
        sdpram3 sdpram3_u1(
            .clka(clka),
            .ena(ena),
            .wea(wea),
            .addra(addra),
            .dina(dina),
            .clkb(clkb),
            .enb(enb),
            .regceb(1'b1),
            .addrb(addrb),
            .doutb(doutb3) );                                                   
    
endmodule
