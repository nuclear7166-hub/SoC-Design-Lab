`timescale 1ns / 1ps

module spi_task(
	reset   ,
	clock   ,
	btn     ,
	led
/*	btn_id,
	start_w,     
	start_r,
	addr,
	wdata,
	rdata,
	ss,
	sck,
	mosi,
	miso,
	done_mst,
	s_idle ,
s_wready   ,
s_write    ,
s_rready   ,*/
//s_read     
);
input		reset   ;
input		clock   ;
input	[3:0]	btn     ;
output	[7:0]	led     ;
/*output	[1:0]	btn_id     ;
output  start_w;
output  start_r;
output    [7:0]   addr;
output    [7:0]   wdata;
output    [7:0]   rdata;
output		ss      ;
output		sck     ;
output		mosi    ;
output		miso    ;
output		done_mst;
output		s_idle ;
output		s_wready   ;
output		s_write    ;
output		s_rready   ;*/
//output		s_read ;

wire	[3:0]	btn2 ;
btn_in	btn_in_u1 (
	.reset    (reset   ),
	.clock    (clock   ),
	.btn_in   (btn[0]  ),
	.btn_out  (btn2[0] )
);
btn_in	btn_in_u2 (
	.reset    (reset   ),
	.clock    (clock   ),
	.btn_in   (btn[1]  ),
	.btn_out  (btn2[1] )
);
btn_in	btn_in_u3 (
	.reset    (reset   ),
	.clock    (clock   ),
	.btn_in   (btn[2]  ),
	.btn_out  (btn2[2] )
);
btn_in	btn_in_u4 (
	.reset    (reset   ),
	.clock    (clock   ),
	.btn_in   (btn[3]  ),
	.btn_out  (btn2[3] )
);

reg	[1:0]	btn_id;
always @(posedge clock or negedge reset)
begin
	if(~reset)	btn_id <= 2'b0;
	else		btn_id <= btn2[0] ? 2'b00 : 
	                          btn2[1] ? 2'b01 : 
	                          btn2[2] ? 2'b10 : 
	                          btn2[3] ? 2'b11 : btn_id;
end

reg	[7:0]	wdata0;
always @(posedge clock or negedge reset)
begin
	if(~reset)	wdata0 <= 8'h00;
	else		wdata0 <= btn2[0] ? wdata0+1'b1 : wdata0 ;
end

reg	[7:0]	wdata1;
always @(posedge clock or negedge reset)
begin
	if(~reset)	wdata1 <= 8'h00;
	else		wdata1 <= btn2[1] ? wdata1+1'b1 : wdata1 ;
end

reg	[7:0]	wdata2;
always @(posedge clock or negedge reset)
begin
	if(~reset)	wdata2 <= 8'h00;
	else		wdata2 <= btn2[2] ? wdata2+1'b1 : wdata2 ;
end

reg	[7:0]	wdata3;
always @(posedge clock or negedge reset)
begin
	if(~reset)	wdata3 <= 8'h00;
	else		wdata3 <= btn2[3] ? wdata3+1'b1 : wdata3 ;
end

// --------------------------------------------
parameter	SLAVE_IDW = 8'h64;
parameter	SLAVE_IDR = 8'h65;
parameter	REG_ADDR1 = 8'h10;
parameter	REG_ADDR2 = 8'h11;
parameter	REG_ADDR3 = 8'h12;
parameter	REG_ADDR4 = 8'h13;
parameter       SPI_FREQ  = 10'd16;

// --------------------------------------------
// 1) define state
reg	[2:0]	m_state ;
parameter	M_IDLE   = 3'd0 ;
parameter	M_WREADY = 3'd1 ;
parameter	M_WRITE  = 3'd2 ;
parameter	M_RREADY = 3'd3 ;
parameter	M_READ   = 3'd4 ;

// --------------------------------------------
// 2) state flag
wire		s_idle    = (m_state == M_IDLE   ) ? 1'b1 : 1'b0 ;
wire		s_wready  = (m_state == M_WREADY ) ? 1'b1 : 1'b0 ;
wire		s_write   = (m_state == M_WRITE  ) ? 1'b1 : 1'b0 ;
wire		s_rready  = (m_state == M_RREADY ) ? 1'b1 : 1'b0 ;
wire		s_read    = (m_state == M_READ   ) ? 1'b1 : 1'b0 ;

// --------------------------------------------
// 3) code implementation
reg	[1:0]	wready_cnt;
always @(posedge clock or negedge reset)
begin
	if(~reset)	wready_cnt <= 2'b0;
	else		wready_cnt <= ~s_wready ? 2'b0 : wready_cnt+1'b1;
end

wire	[7:0]	reg_addr  = (btn_id==2'd0) ? REG_ADDR1 :
                            (btn_id==2'd1) ? REG_ADDR2 :
                            (btn_id==2'd2) ? REG_ADDR3 : REG_ADDR4 ;
reg	[7:0]	addr;
always @(posedge clock or negedge reset)
begin
	if(~reset)	addr <= 8'b0;
	else		addr <= (s_wready & (wready_cnt==2'b11)) ? reg_addr : addr ;
end

wire	[7:0]	reg_wdata = (btn_id==2'd0) ? wdata0 :
                            (btn_id==2'd1) ? wdata1 :
                            (btn_id==2'd2) ? wdata2 : wdata3 ;
reg	[7:0]	wdata;
always @(posedge clock or negedge reset)
begin
	if(~reset)	wdata <= 8'b0;
	else		wdata <= (s_wready & (wready_cnt==2'b11)) ? reg_wdata : wdata ;
end
                            
reg		start_w;
always @(posedge clock or negedge reset)
begin
	if(~reset)	start_w <= 1'b0;
	else		start_w <= (s_wready & (wready_cnt==2'b11)) ? 1'b1 : 1'b0 ;
end

reg	[3:0]	write_cnt;
always @(posedge clock or negedge reset)
begin
	if(~reset)	write_cnt <= 4'b0;
	else		write_cnt <= ~s_write ? 4'b0 : 
	                            (write_cnt==4'd15) ? 4'd15 : write_cnt+1'b1;
end

reg	[1:0]	rready_cnt;
always @(posedge clock or negedge reset)
begin
	if(~reset)	rready_cnt <= 2'b0;
	else		rready_cnt <= ~s_rready ? 2'b0 : rready_cnt+1'b1;
end

reg		start_r;
always @(posedge clock or negedge reset)
begin
	if(~reset)	start_r <= 1'b0;
	else		start_r <= (s_rready & (rready_cnt==2'b11)) ? 1'b1 : 1'b0 ;
end

reg	[3:0]	read_cnt;
always @(posedge clock or negedge reset)
begin
	if(~reset)	read_cnt <= 4'b0;
	else		read_cnt <= ~s_read ? 4'b0 : 
	                           (read_cnt==4'd15) ? 4'd15 : read_cnt+1'b1;
end

wire	[7:0]	rdata   ;
wire		ss      ;
wire		sck     ;
wire		mosi    ;
wire		miso    ;
wire		done_mst;                            
spi_master 	spi_master_u1(
	.reset     (reset    ),
	.clock     (clock    ),
	.freq      (SPI_FREQ ),
	.start_w   (start_w  ),
	.start_r   (start_r  ),
	.addr      (addr     ),
	.wdata     (wdata    ),
	.rdata     (rdata    ),
	.done      (done_mst ),
	.ss        (ss       ),
	.sck       (sck      ),
	.mosi      (mosi     ),
	.miso      (miso     )
);

spi_slave	spi_slave_u1(
	.reset     (reset    ),
	.clock     (clock    ),
	.ss        (ss       ),
	.sck       (sck      ),
	.mosi      (mosi     ),
	.miso      (miso     )
);

reg	[7:0]	led;
always @(posedge clock or negedge reset)
begin
	if(~reset)	led <= 4'b0;
	else		led <= (s_read & (read_cnt==4'd15) & done_mst) ? rdata : led;
end

// --------------------------------------------
// 4) state transition
always @(posedge clock or negedge reset)
begin
	if(~reset)	m_state <= 3'b0;
	else		m_state <= (s_idle   & (btn2 != 4'b0 )               ) ? M_WREADY :
	                           (s_wready & (wready_cnt==2'b11)           ) ? M_WRITE  : 
	                           (s_write  & (write_cnt==4'd15) & done_mst ) ? M_RREADY : 
	                           (s_rready & (rready_cnt==2'b11)           ) ? M_READ   : 
	                           (s_read   & (read_cnt==4'd15) & done_mst  ) ? M_IDLE   : 
	                            m_state ;
end

endmodule
