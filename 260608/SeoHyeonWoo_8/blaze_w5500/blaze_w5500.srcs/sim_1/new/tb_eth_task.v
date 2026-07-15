`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/04 17:32:05
// Design Name: 
// Module Name: tb_eth_task
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_eth_task();

reg 		mclk, reset  ;

initial 	begin
	mclk = 0;
	reset = 0;
	#10000
	reset = 1;
end

always	#10	mclk = ~mclk;		// 50Mhz


reg	[19:0]	cnt;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	cnt <= 20'b0;
	else		cnt <= cnt+1'b1;
end


reg		eth_ram_sel;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	eth_ram_sel <= 1'b0;
	else		eth_ram_sel <= (cnt==20'd600 ) ? 1'b1 : 
	                               (cnt==20'd640 ) ? 1'b0 : 
	                               (cnt==20'd3000) ? 1'b1 : 
	                               (cnt==20'd3040) ? 1'b0 : 
	                                eth_ram_sel;
end

reg		mb_en;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	mb_en <= 1'b0;
	else		mb_en <= (cnt==20'd600 ) ? 1'b1 : (cnt==20'd640 ) ? 1'b0 : 
	                         (cnt==20'd3000) ? 1'b1 : (cnt==20'd3040) ? 1'b0 : 
	                          mb_en;
end

reg	[3:0]	mb_we;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	mb_we <= 4'b0;
	else		mb_we <= (cnt==20'd600) ? 4'b1111 : (cnt==20'd640) ? 4'b0 : 
	                          mb_we;
end

reg	[12:0]	mb_addr;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	mb_addr <= 13'b0;
	else		mb_addr <= (cnt==20'd600 ) ? 13'h000 : 
	                           (cnt==20'd610 ) ? 13'h004 : 
	                           (cnt==20'd620 ) ? 13'h008 : 
	                           (cnt==20'd3000) ? 12'h000 : 
	                           (cnt==20'd3010) ? 12'h004 : 
	                           (cnt==20'd3020) ? 12'h008 : 
	                            mb_addr;
end

wire	[31:0]	spi_data1 = 32'h01234567;
wire	[31:0]	spi_data2 = 32'h89abcdef;
wire	[31:0]	spi_data3 = 32'h11335577;

reg	[31:0]	mb_din;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	mb_din <= 32'b0;
	else		mb_din <= (cnt==20'd600) ? spi_data1 : 
	                          (cnt==20'd610) ? spi_data2 : 
	                          (cnt==20'd620) ? spi_data3 : 
                                   mb_din;
end

reg		start;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	start <= 1'b0;
	else		start <= (cnt==20'd1000) ? 1'b1 : (cnt==20'd1006) ? 1'b0 : 
	                         (cnt==20'd2000) ? 1'b1 : (cnt==20'd2006) ? 1'b0 : 
	                          start ;
end			         

reg	[23:0]	eth_addr;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	eth_addr <= 24'b0;
	else		eth_addr <= (cnt==20'd1000) ? 24'haaaa55 : 
	                            (cnt==20'd2000) ? 24'haaaa50 : 
	                             eth_addr ;
end			         

wire		eth_sclk;
reg		eth_sclk_1d;
wire		eth_sclk_nedge = ~eth_sclk & eth_sclk_1d;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	eth_sclk_1d <= 1'b0;
	else		eth_sclk_1d <= eth_sclk;
end			         

reg	[7:0]	sclk_cnt;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	sclk_cnt <= 8'b0;
	else		sclk_cnt <= start ? 8'b0 : 
	                            eth_sclk_nedge ? sclk_cnt+1'b1 : sclk_cnt;
end			         

reg		eth_miso;
always @(posedge mclk or negedge reset)
begin
	if(!reset) eth_miso <= 1'b0;
	else	   eth_miso <= (cnt < 20'd2000) ? 1'b0 :
	                       (eth_sclk_nedge & (sclk_cnt==8'd23 )) ? spi_data1[31] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd24 )) ? spi_data1[30] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd25 )) ? spi_data1[29] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd26 )) ? spi_data1[28] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd27 )) ? spi_data1[27] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd28 )) ? spi_data1[26] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd29 )) ? spi_data1[25] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd30 )) ? spi_data1[24] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd31 )) ? spi_data1[23] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd32 )) ? spi_data1[22] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd33 )) ? spi_data1[21] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd34 )) ? spi_data1[20] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd35 )) ? spi_data1[19] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd36 )) ? spi_data1[18] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd37 )) ? spi_data1[17] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd38 )) ? spi_data1[16] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd39 )) ? spi_data1[15] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd40 )) ? spi_data1[14] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd41 )) ? spi_data1[13] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd42 )) ? spi_data1[12] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd43 )) ? spi_data1[11] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd44 )) ? spi_data1[10] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd45 )) ? spi_data1[9]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd46 )) ? spi_data1[8]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd47 )) ? spi_data1[7]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd48 )) ? spi_data1[6]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd49 )) ? spi_data1[5]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd50 )) ? spi_data1[4]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd51 )) ? spi_data1[3]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd52 )) ? spi_data1[2]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd53 )) ? spi_data1[1]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd54 )) ? spi_data1[0]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd55 )) ? spi_data2[31] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd56 )) ? spi_data2[30] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd57 )) ? spi_data2[29] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd58 )) ? spi_data2[28] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd59 )) ? spi_data2[27] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd60 )) ? spi_data2[26] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd61 )) ? spi_data2[25] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd62 )) ? spi_data2[24] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd63 )) ? spi_data2[23] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd64 )) ? spi_data2[22] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd65 )) ? spi_data2[21] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd66 )) ? spi_data2[20] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd67 )) ? spi_data2[19] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd68 )) ? spi_data2[18] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd69 )) ? spi_data2[17] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd70 )) ? spi_data2[16] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd71 )) ? spi_data2[15] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd72 )) ? spi_data2[14] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd73 )) ? spi_data2[13] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd74 )) ? spi_data2[12] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd75 )) ? spi_data2[11] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd76 )) ? spi_data2[10] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd77 )) ? spi_data2[9]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd78 )) ? spi_data2[8]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd79 )) ? spi_data2[7]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd80 )) ? spi_data2[6]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd81 )) ? spi_data2[5]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd82 )) ? spi_data2[4]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd83 )) ? spi_data2[3]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd84 )) ? spi_data2[2]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd85 )) ? spi_data2[1]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd86 )) ? spi_data2[0]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd87 )) ? spi_data3[31] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd88 )) ? spi_data3[30] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd89 )) ? spi_data3[29] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd90 )) ? spi_data3[28] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd91 )) ? spi_data3[27] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd92 )) ? spi_data3[26] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd93 )) ? spi_data3[25] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd94 )) ? spi_data3[24] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd95 )) ? spi_data3[23] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd96 )) ? spi_data3[22] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd97 )) ? spi_data3[21] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd98 )) ? spi_data3[20] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd99 )) ? spi_data3[19] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd100)) ? spi_data3[18] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd101)) ? spi_data3[17] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd102)) ? spi_data3[16] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd103)) ? spi_data3[15] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd104)) ? spi_data3[14] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd105)) ? spi_data3[13] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd106)) ? spi_data3[12] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd107)) ? spi_data3[11] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd108)) ? spi_data3[10] :
	                       (eth_sclk_nedge & (sclk_cnt==8'd109)) ? spi_data3[9]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd110)) ? spi_data3[8]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd111)) ? spi_data3[7]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd112)) ? spi_data3[6]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd113)) ? spi_data3[5]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd114)) ? spi_data3[4]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd115)) ? spi_data3[3]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd116)) ? spi_data3[2]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd117)) ? spi_data3[1]  :
	                       (eth_sclk_nedge & (sclk_cnt==8'd118)) ? spi_data3[0]  :
	                        eth_miso ;
end

wire		mb_rst = 1'b0;
wire	[31:0]	mb_dout ;
wire		eth_scsn, eth_mosi;
wire		eth_done;
eth_task 	eth_task (
	.reset		(reset		),
	.mclk		(mclk		),
	
	.eth_start	(start  	),
	.eth_ram_sel	(eth_ram_sel 	),
	.eth_addr	(eth_addr       ),
	.eth_size       (13'd9		),	// 13'd7 or 13'd9
	.eth_done	(eth_done	),
	
	.eth_scsn	(eth_scsn	),
	.eth_sclk	(eth_sclk	),
	.eth_mosi	(eth_mosi	),
	.eth_miso	(eth_miso	),

	.mb_rst         (mb_rst         ),
	.mb_en          (mb_en          ),
	.mb_we          (mb_we          ),
	.mb_addr        (mb_addr        ),
	.mb_din         (mb_din         ),
	.mb_dout        (mb_dout        )
);


endmodule