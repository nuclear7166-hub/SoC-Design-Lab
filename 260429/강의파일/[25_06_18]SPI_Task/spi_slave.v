`timescale 1ns / 1ps

`define		rUSER_REG1		8'h10
`define		rUSER_REG2		8'h11
`define		rUSER_REG3		8'h12
`define		rUSER_REG4		8'h13

module spi_slave(
	reset  ,
	clock  ,
	ss     ,
	sck    ,
	mosi   ,
	miso   ,
	s_state,
	ss_pedge,
	ss_nedge,
	sck_pedge,
	sck_nedge,
	s_idle,
    s_slaveid,
    s_waddr,
    s_wdata,
    s_raddr,
    s_rdata,
    s_done,
    sid_sckn_cnt,
    slave_id,
    mosi_1d, mosi_2d,
    wa_sckn_cnt,
    waddr,
    wd_sckn_cnt,
    wdata,
    ra_sckn_cnt,
    raddr,
    done_cnt,
    rd_sckn_cnt,
    sck_nedge_1d,
    rdata,
    user_reg1, user_reg2, user_reg3, user_reg4
	
);
input		reset ;
input		clock ;
input		ss    ;
input		sck   ;
input		mosi  ;
output		miso  ;
output		[2:0]	s_state ;
output		ss_pedge ;
output		ss_nedge ;
output		sck_pedge ;
output		sck_nedge ;
output      s_idle;
output      s_slaveid;
output      s_waddr;
output      s_wdata;
output      s_raddr;
output      s_rdata;
output      s_done;
output   [3:0]   sid_sckn_cnt;
output   [7:0]	slave_id;
output      mosi_1d, mosi_2d;
output    [3:0]	wa_sckn_cnt;
output   [7:0]	waddr;
output   [3:0]	wd_sckn_cnt;
output    [7:0]	wdata;
output    [3:0]	ra_sckn_cnt;
output    [7:0]	raddr;
output    [3:0]	rd_sckn_cnt;
output    [1:0]	done_cnt;
output  sck_nedge_1d;
output  [7:0]   rdata;
output  	[7:0]	user_reg1, user_reg2, user_reg3, user_reg4 ;


// --------------------------------------------
parameter       SLAVE_IDW   = 8'h64 ;
parameter       SLAVE_IDR   = 8'h65 ;

// --------------------------------------------
// 1) define state
parameter	IDLE      = 3'd0 ;
parameter	SLAVEID   = 3'd1 ;
parameter	WADDR     = 3'd2 ;
parameter	WDATA	  = 3'd3 ;
parameter	RADDR     = 3'd4 ;
parameter	RDATA     = 3'd5 ;
parameter       DONE      = 3'd6 ;

// --------------------------------------------
// 2) state flag
reg	[2:0]	s_state;
wire		s_idle     = (s_state==IDLE    ) ? 1'b1 : 1'b0;
wire		s_slaveid  = (s_state==SLAVEID ) ? 1'b1 : 1'b0;
wire		s_waddr    = (s_state==WADDR   ) ? 1'b1 : 1'b0;
wire		s_wdata    = (s_state==WDATA   ) ? 1'b1 : 1'b0;
wire		s_raddr    = (s_state==RADDR   ) ? 1'b1 : 1'b0;
wire		s_rdata    = (s_state==RDATA   ) ? 1'b1 : 1'b0;
wire		s_done     = (s_state==DONE    ) ? 1'b1 : 1'b0;

// --------------------------------------------
// 3) code implementation
reg		ss_1d, ss_2d ;
wire		ss_pedge =  ss_1d & ~ss_2d;
wire		ss_nedge = ~ss_1d &  ss_2d;
always @(posedge clock or negedge reset)
begin
	if(!reset)	begin
		ss_1d <= 1'b1;
		ss_2d <= 1'b1;
	end
	else	begin
		ss_1d <= ss;
		ss_2d <= ss_1d ;
	end
end

reg		sck_1d, sck_2d ;
wire		sck_pedge =  sck_1d & ~sck_2d;
wire		sck_nedge = ~sck_1d &  sck_2d;
always @(posedge clock or negedge reset)
begin
	if(!reset)	begin
		sck_1d <= 1'b0;
		sck_2d <= 1'b0;
	end
	else	begin
		sck_1d <= sck;
		sck_2d <= sck_1d ;
	end
end

reg		mosi_1d, mosi_2d;
always @(posedge clock or negedge reset)
begin
	if(!reset)	begin
		mosi_1d <= 1'b0;
		mosi_2d <= 1'b0;
	end
	else	begin
		mosi_1d <= mosi;
		mosi_2d <= mosi_1d ;
	end
end

reg	[3:0]	sid_sckn_cnt;
always @(posedge clock or negedge reset)
begin
	if(!reset)	sid_sckn_cnt <= 4'b0;
	else		sid_sckn_cnt <= ~s_slaveid ? 4'b0 : sck_nedge ? (sid_sckn_cnt+1'b1) : sid_sckn_cnt ;
end

reg	[7:0]	slave_id;
always @(posedge clock or negedge reset)
begin
	if(!reset)	slave_id <= 8'b0;
	else	begin
		slave_id[7] <= s_idle ? 1'b0 : (s_slaveid & sck_pedge & (sid_sckn_cnt==4'd0)) ? mosi_2d : slave_id[7] ;
		slave_id[6] <= s_idle ? 1'b0 : (s_slaveid & sck_pedge & (sid_sckn_cnt==4'd1)) ? mosi_2d : slave_id[6] ;
		slave_id[5] <= s_idle ? 1'b0 : (s_slaveid & sck_pedge & (sid_sckn_cnt==4'd2)) ? mosi_2d : slave_id[5] ;
		slave_id[4] <= s_idle ? 1'b0 : (s_slaveid & sck_pedge & (sid_sckn_cnt==4'd3)) ? mosi_2d : slave_id[4] ;
		slave_id[3] <= s_idle ? 1'b0 : (s_slaveid & sck_pedge & (sid_sckn_cnt==4'd4)) ? mosi_2d : slave_id[3] ;
		slave_id[2] <= s_idle ? 1'b0 : (s_slaveid & sck_pedge & (sid_sckn_cnt==4'd5)) ? mosi_2d : slave_id[2] ;
		slave_id[1] <= s_idle ? 1'b0 : (s_slaveid & sck_pedge & (sid_sckn_cnt==4'd6)) ? mosi_2d : slave_id[1] ;
		slave_id[0] <= s_idle ? 1'b0 : (s_slaveid & sck_pedge & (sid_sckn_cnt==4'd7)) ? mosi_2d : slave_id[0] ;
	end
end


reg	[3:0]	wa_sckn_cnt;
always @(posedge clock or negedge reset)
begin
	if(!reset)	wa_sckn_cnt <= 4'b0;
	else		wa_sckn_cnt <= ~s_waddr ? 4'b0 : sck_nedge ? (wa_sckn_cnt+1'b1) : wa_sckn_cnt ;
end

reg	[7:0]	waddr;
always @(posedge clock or negedge reset)
begin
	if(!reset)	waddr <= 8'b0;
	else	begin
		waddr[7] <= s_idle ? 1'b0 : (s_waddr & sck_pedge & (wa_sckn_cnt==4'd0)) ? mosi_2d : waddr[7] ;
		waddr[6] <= s_idle ? 1'b0 : (s_waddr & sck_pedge & (wa_sckn_cnt==4'd1)) ? mosi_2d : waddr[6] ;
		waddr[5] <= s_idle ? 1'b0 : (s_waddr & sck_pedge & (wa_sckn_cnt==4'd2)) ? mosi_2d : waddr[5] ;
		waddr[4] <= s_idle ? 1'b0 : (s_waddr & sck_pedge & (wa_sckn_cnt==4'd3)) ? mosi_2d : waddr[4] ;
		waddr[3] <= s_idle ? 1'b0 : (s_waddr & sck_pedge & (wa_sckn_cnt==4'd4)) ? mosi_2d : waddr[3] ;
		waddr[2] <= s_idle ? 1'b0 : (s_waddr & sck_pedge & (wa_sckn_cnt==4'd5)) ? mosi_2d : waddr[2] ;
		waddr[1] <= s_idle ? 1'b0 : (s_waddr & sck_pedge & (wa_sckn_cnt==4'd6)) ? mosi_2d : waddr[1] ;
		waddr[0] <= s_idle ? 1'b0 : (s_waddr & sck_pedge & (wa_sckn_cnt==4'd7)) ? mosi_2d : waddr[0] ;
	end
end


reg	[3:0]	wd_sckn_cnt;
always @(posedge clock or negedge reset)
begin
	if(!reset)	wd_sckn_cnt <= 4'b0;
	else		wd_sckn_cnt <= ~s_wdata ? 4'b0 : sck_nedge ? (wd_sckn_cnt+1'b1) : wd_sckn_cnt ;
end

reg	[7:0]	wdata;
always @(posedge clock or negedge reset)
begin
	if(!reset)	wdata <= 8'b0;
	else	begin
		wdata[7] <= s_idle ? 1'b0 : (s_wdata & sck_pedge & (wd_sckn_cnt==4'd0 )) ? mosi_2d : wdata[7] ;
		wdata[6] <= s_idle ? 1'b0 : (s_wdata & sck_pedge & (wd_sckn_cnt==4'd1 )) ? mosi_2d : wdata[6] ;
		wdata[5] <= s_idle ? 1'b0 : (s_wdata & sck_pedge & (wd_sckn_cnt==4'd2 )) ? mosi_2d : wdata[5] ;
		wdata[4] <= s_idle ? 1'b0 : (s_wdata & sck_pedge & (wd_sckn_cnt==4'd3 )) ? mosi_2d : wdata[4] ;
		wdata[3] <= s_idle ? 1'b0 : (s_wdata & sck_pedge & (wd_sckn_cnt==4'd4 )) ? mosi_2d : wdata[3] ;
		wdata[2] <= s_idle ? 1'b0 : (s_wdata & sck_pedge & (wd_sckn_cnt==4'd5 )) ? mosi_2d : wdata[2] ;
		wdata[1] <= s_idle ? 1'b0 : (s_wdata & sck_pedge & (wd_sckn_cnt==4'd6 )) ? mosi_2d : wdata[1] ;
		wdata[0] <= s_idle ? 1'b0 : (s_wdata & sck_pedge & (wd_sckn_cnt==4'd7 )) ? mosi_2d : wdata[0] ;
	end
end


reg	[3:0]	ra_sckn_cnt;
always @(posedge clock or negedge reset)
begin
	if(!reset)	ra_sckn_cnt <= 4'b0;
	else		ra_sckn_cnt <= ~s_raddr ? 4'b0 : sck_nedge ? (ra_sckn_cnt+1'b1) : ra_sckn_cnt ;
end

reg	[7:0]	raddr;
always @(posedge clock or negedge reset)
begin
	if(!reset)	raddr <= 8'b0;
	else	begin
		raddr[7] <= s_idle ? 1'b0 : (s_raddr & sck_pedge & (ra_sckn_cnt==4'd0)) ? mosi_2d : raddr[7] ;
		raddr[6] <= s_idle ? 1'b0 : (s_raddr & sck_pedge & (ra_sckn_cnt==4'd1)) ? mosi_2d : raddr[6] ;
		raddr[5] <= s_idle ? 1'b0 : (s_raddr & sck_pedge & (ra_sckn_cnt==4'd2)) ? mosi_2d : raddr[5] ;
		raddr[4] <= s_idle ? 1'b0 : (s_raddr & sck_pedge & (ra_sckn_cnt==4'd3)) ? mosi_2d : raddr[4] ;
		raddr[3] <= s_idle ? 1'b0 : (s_raddr & sck_pedge & (ra_sckn_cnt==4'd4)) ? mosi_2d : raddr[3] ;
		raddr[2] <= s_idle ? 1'b0 : (s_raddr & sck_pedge & (ra_sckn_cnt==4'd5)) ? mosi_2d : raddr[2] ;
		raddr[1] <= s_idle ? 1'b0 : (s_raddr & sck_pedge & (ra_sckn_cnt==4'd6)) ? mosi_2d : raddr[1] ;
		raddr[0] <= s_idle ? 1'b0 : (s_raddr & sck_pedge & (ra_sckn_cnt==4'd7)) ? mosi_2d : raddr[0] ;
	end
end


reg	[3:0]	rd_sckn_cnt;
always @(posedge clock or negedge reset)
begin
	if(!reset)	rd_sckn_cnt <= 4'b0;
	else		rd_sckn_cnt <= ~s_rdata ? 4'b0 : sck_nedge ? (rd_sckn_cnt+1'b1) : rd_sckn_cnt;
end

reg		s_raddr_1d, s_raddr_2d;
wire		s_raddr_nedge = ~s_raddr_1d & s_raddr_2d;
always @(posedge clock or negedge reset)
begin
	if(!reset)	begin
		s_raddr_1d <= 1'b0;
		s_raddr_2d <= 1'b0;
	end
	else	begin
		s_raddr_1d <= s_raddr;
		s_raddr_2d <= s_raddr_1d;
	end
end


reg		sck_nedge_1d;
always @(posedge clock or negedge reset)
begin
	if(!reset)	sck_nedge_1d <= 1'b0;
	else		sck_nedge_1d <= sck_nedge;
end

reg		sck_pedge_1d;
always @(posedge clock or negedge reset)
begin
	if(!reset)	sck_pedge_1d <= 1'b0;
	else		sck_pedge_1d <= sck_pedge;
end


reg	[7:0]	rdata;
reg		miso;
always @(posedge clock or negedge reset)
begin
	if(!reset)	miso <= 1'b0;
	else		miso <=  s_idle ? 1'b0 :
				(sck_nedge_1d & (rd_sckn_cnt==5'd0 )) ? rdata[7] :
	                        (sck_nedge_1d & (rd_sckn_cnt==5'd1 )) ? rdata[6] :
	                        (sck_nedge_1d & (rd_sckn_cnt==5'd2 )) ? rdata[5] :
	                        (sck_nedge_1d & (rd_sckn_cnt==5'd3 )) ? rdata[4] :
	                        (sck_nedge_1d & (rd_sckn_cnt==5'd4 )) ? rdata[3] :
	                        (sck_nedge_1d & (rd_sckn_cnt==5'd5 )) ? rdata[2] :
	                        (sck_nedge_1d & (rd_sckn_cnt==5'd6 )) ? rdata[1]  :
	                        (sck_nedge_1d & (rd_sckn_cnt==5'd7 )) ? rdata[0]  : miso ;
end


reg	[1:0]	done_cnt;
always @(posedge clock or negedge reset)
begin
	if(!reset)	done_cnt <= 2'b0;
	else		done_cnt <= ~s_done ? 2'b0 : done_cnt+1'b1 ;
end

// --------------------------------------------
// 4) state transition
always @(posedge clock or negedge reset)
begin
	if(!reset)	begin
		s_state <= 3'h0;
	end
	else	begin
		s_state <= (s_idle    &  ss_nedge           ) ? SLAVEID :
		           (s_slaveid & (sid_sckn_cnt==4'd8)) ? ((slave_id==SLAVE_IDW) ? WADDR : (slave_id==SLAVE_IDR) ? RADDR : IDLE) :
		           (s_waddr   & (wa_sckn_cnt==4'd8) ) ? WDATA :
		           (s_wdata   &  ss_pedge           ) ? DONE  :
		           (s_raddr   & (ra_sckn_cnt==4'd8) ) ? RDATA :
		           (s_rdata   &  ss_pedge           ) ? DONE  :
		           (s_done    & (done_cnt==2'd3)    ) ? IDLE  : s_state ;
	end
end


reg  	[7:0]	user_reg1, user_reg2, user_reg3, user_reg4 ;
always @(posedge clock or negedge reset)
begin
	if(!reset)	begin
		user_reg1  <= 8'b0;
		user_reg2  <= 8'b0;
		user_reg3  <= 8'b0;
		user_reg4  <= 8'b0;
	end
	else	begin
		user_reg1   <= (s_done & (waddr==`rUSER_REG1 )) ? wdata : user_reg1 ;
		user_reg2   <= (s_done & (waddr==`rUSER_REG2 )) ? wdata : user_reg2 ;
		user_reg3   <= (s_done & (waddr==`rUSER_REG3 )) ? wdata : user_reg3 ;
		user_reg4   <= (s_done & (waddr==`rUSER_REG4 )) ? wdata : user_reg4 ;
	end
end


always @(posedge clock or negedge reset)
begin
	if(!reset) rdata <= 16'b0;
	else	   rdata <= s_idle ? 16'b0 :
	                   (s_raddr & sck_pedge_1d & (ra_sckn_cnt==4'd7) & (raddr == `rUSER_REG1)) ? user_reg1 :
	                   (s_raddr & sck_pedge_1d & (ra_sckn_cnt==4'd7) & (raddr == `rUSER_REG2)) ? user_reg2 :
	                   (s_raddr & sck_pedge_1d & (ra_sckn_cnt==4'd7) & (raddr == `rUSER_REG3)) ? user_reg3 :
	                   (s_raddr & sck_pedge_1d & (ra_sckn_cnt==4'd7) & (raddr == `rUSER_REG4)) ? user_reg4 : 
	                    rdata ;
end


endmodule
