`timescale 1ns / 1ps

module spi_master(
	reset   ,
	clock   ,
	freq    ,
	start_w ,
	start_r ,
	addr    ,
	wdata   ,
	rdata   ,
	done    ,
	ss      ,
	sck     ,
	mosi    ,
s_idle    ,
s_ready  ,
s_send   ,
s_done   ,	
startw_pedge,
sck_cnt,
sck_index,
rw_flag,
startw_1d, 
startw_2d,
	miso    
);
input		reset   ;
input		clock   ;
input	[9:0]	freq    ;
input		start_w ;
input		start_r ;
input	[7:0]	addr    ;
input	[7:0]	wdata   ;
output	[7:0]	rdata   ;
output		done    ;
output		ss      ;
output		sck     ;
output		mosi    ;
input		miso    ;
output		s_idle    ;
output		s_ready    ;
output	s_send     ;
output		s_done     ;
output	[9:0]	sck_cnt;
output      startw_pedge;
output	[5:0]	sck_index;
output		rw_flag;
output      startw_1d;
output      startw_2d;

// --------------------------------------------
parameter	SLAVE_IDW = 8'h64; //8'b0110_0100
parameter	SLAVE_IDR = 8'h65; //8'b0110_0101

// --------------------------------------------
// 1) define state
reg	[1:0]	m_state ;
parameter	M_IDLE   = 2'd0 ;
parameter	M_READY  = 2'd1 ;
parameter	M_SEND   = 2'd2 ;
parameter	M_DONE   = 2'd3 ;

// --------------------------------------------
// 2) state flag
wire		s_idle    = (m_state == M_IDLE    ) ? 1'b1 : 1'b0 ;
wire		s_ready   = (m_state == M_READY   ) ? 1'b1 : 1'b0 ;
wire		s_send    = (m_state == M_SEND    ) ? 1'b1 : 1'b0 ;
wire		s_done    = (m_state == M_DONE    ) ? 1'b1 : 1'b0 ;

// --------------------------------------------
// 3) code implementation
reg		startw_1d, startw_2d;
wire		startw_pedge = startw_1d & ~startw_2d;
always @(posedge clock or negedge reset)
begin
	if(~reset)	begin
		startw_1d <= 1'b0;
		startw_2d <= 1'b0;
	end
	else	begin
		startw_1d <= start_w;
		startw_2d <= startw_1d;
	end
end
		
reg		startr_1d, startr_2d;
wire		startr_pedge = startr_1d & ~startr_2d;
always @(posedge clock or negedge reset)
begin
	if(~reset)	begin
		startr_1d <= 1'b0;
		startr_2d <= 1'b0;
	end
	else	begin
		startr_1d <= start_r;
		startr_2d <= startr_1d;
	end
end

reg		rw_flag;	// 0 : write, 1 : read
always @(posedge clock or negedge reset)
begin
	if(~reset)	rw_flag <= 1'b0;
	else		rw_flag <= startw_pedge ? 1'b0 : startr_pedge ? 1'b1 : rw_flag ;
end

reg	[9:0]	ready_cnt;
always @(posedge clock or negedge reset)
begin
	if(~reset)	ready_cnt <= 10'b0;
	else		ready_cnt <= ~s_ready ? 10'b0 : ready_cnt+1'b1;
end

reg	[3:0]	done_cnt;
always @(posedge clock or negedge reset)
begin
	if(~reset)	done_cnt <= 4'b0;
	else		done_cnt <= ~s_done ? 4'b0 : done_cnt+1'b1;
end

reg	[9:0]	sck_cnt;
always @(posedge clock or negedge reset)
begin
	if(~reset)	sck_cnt <= 10'b0;
	else		sck_cnt <= ~s_send ? 10'b0 : (sck_cnt==freq) ? 10'b0 : sck_cnt+1'b1 ;
end

reg	[5:0]	sck_index;
always @(posedge clock or negedge reset)
begin
	if(~reset)	sck_index <= 6'b0;
	else		sck_index <= ~s_send ? 6'b0 : (sck_cnt==10'b0) ? sck_index+1'b1 : sck_index;
end

reg		ss;
always @(posedge clock or negedge reset)
begin
	if(~reset)	ss <= 1'b1;
	else		ss <=  s_idle  ? 1'b1 :
	                      (s_ready & (ready_cnt==10'd0) ) ? 1'b0 :
	                      (s_done  & (done_cnt==4'd15)  ) ? 1'b1 : ss;
end

reg		sck;
always @(posedge clock or negedge reset)
begin
	if(~reset) sck <= 1'b0;
	else	   sck <= ~s_send ? 1'b0 : ((sck_index<6'd48) && (sck_cnt==10'b0)) ? ~sck : sck ;
end

reg		mosi;
always @(posedge clock or negedge reset)
begin
	if(~reset) mosi <= 1'b0;
	else  	   mosi <= s_idle ? 1'b0 : //line 53~54 :	SLAVE_IDW = 8'h64; //8'b0110_0100 <==> SLAVE_IDR = 8'h65; //8'b0110_0101
	                  (s_ready & (ready_cnt==10'd10) ) ? (~rw_flag ? SLAVE_IDW[7] : SLAVE_IDR[7]) :
	                  (s_send  & (sck_index==6'd1 ) & (sck_cnt==10'b0)) ? (~rw_flag ? SLAVE_IDW[6] : SLAVE_IDR[6]) :
	                  (s_send  & (sck_index==6'd3 ) & (sck_cnt==10'b0)) ? (~rw_flag ? SLAVE_IDW[5] : SLAVE_IDR[5]) :
	                  (s_send  & (sck_index==6'd5 ) & (sck_cnt==10'b0)) ? (~rw_flag ? SLAVE_IDW[4] : SLAVE_IDR[4]) :
	                  (s_send  & (sck_index==6'd7 ) & (sck_cnt==10'b0)) ? (~rw_flag ? SLAVE_IDW[3] : SLAVE_IDR[3]) :
	                  (s_send  & (sck_index==6'd9 ) & (sck_cnt==10'b0)) ? (~rw_flag ? SLAVE_IDW[2] : SLAVE_IDR[2]) :
	                  (s_send  & (sck_index==6'd11) & (sck_cnt==10'b0)) ? (~rw_flag ? SLAVE_IDW[1] : SLAVE_IDR[1]) :
	                  (s_send  & (sck_index==6'd13) & (sck_cnt==10'b0)) ? (~rw_flag ? SLAVE_IDW[0] : SLAVE_IDR[0]) :
	                  (s_send  & (sck_index==6'd15) & (sck_cnt==10'b0)) ?  addr[7] : 	//addr(8'h55)==>8'b0101_0101
	                  (s_send  & (sck_index==6'd17) & (sck_cnt==10'b0)) ?  addr[6] :
	                  (s_send  & (sck_index==6'd19) & (sck_cnt==10'b0)) ?  addr[5] :
	                  (s_send  & (sck_index==6'd21) & (sck_cnt==10'b0)) ?  addr[4] :
	                  (s_send  & (sck_index==6'd23) & (sck_cnt==10'b0)) ?  addr[3] :
	                  (s_send  & (sck_index==6'd25) & (sck_cnt==10'b0)) ?  addr[2] :
	                  (s_send  & (sck_index==6'd27) & (sck_cnt==10'b0)) ?  addr[1] :
	                  (s_send  & (sck_index==6'd29) & (sck_cnt==10'b0)) ?  addr[0] :
	                  (s_send  & (sck_index==6'd31) & (sck_cnt==10'b0)) ? (~rw_flag ? wdata[7] : 1'b0) : 	//wdata(8'haa)==>8'b1010_1010
	                  (s_send  & (sck_index==6'd33) & (sck_cnt==10'b0)) ? (~rw_flag ? wdata[6] : 1'b0) :
	                  (s_send  & (sck_index==6'd35) & (sck_cnt==10'b0)) ? (~rw_flag ? wdata[5] : 1'b0) :
	                  (s_send  & (sck_index==6'd37) & (sck_cnt==10'b0)) ? (~rw_flag ? wdata[4] : 1'b0) :
	                  (s_send  & (sck_index==6'd39) & (sck_cnt==10'b0)) ? (~rw_flag ? wdata[3] : 1'b0) :
	                  (s_send  & (sck_index==6'd41) & (sck_cnt==10'b0)) ? (~rw_flag ? wdata[2] : 1'b0) :
	                  (s_send  & (sck_index==6'd43) & (sck_cnt==10'b0)) ? (~rw_flag ? wdata[1] : 1'b0) :
	                  (s_send  & (sck_index==6'd45) & (sck_cnt==10'b0)) ? (~rw_flag ? wdata[0] : 1'b0) :
	                  (s_send  & (sck_index==6'd47) & (sck_cnt==10'b0)) ? 1'b0 : mosi ;
end

reg	[7:0]	rdata;
always @(posedge clock or negedge reset)
begin
	if(~reset)	rdata <= 8'b0;
	else	begin
		rdata[7] <= (s_send  & (sck_index==6'd32 ) & (sck_cnt==10'b0)) ? miso : rdata[7] ;
		rdata[6] <= (s_send  & (sck_index==6'd34 ) & (sck_cnt==10'b0)) ? miso : rdata[6] ;
		rdata[5] <= (s_send  & (sck_index==6'd36 ) & (sck_cnt==10'b0)) ? miso : rdata[5] ;
		rdata[4] <= (s_send  & (sck_index==6'd38 ) & (sck_cnt==10'b0)) ? miso : rdata[4] ;
		rdata[3] <= (s_send  & (sck_index==6'd40 ) & (sck_cnt==10'b0)) ? miso : rdata[3] ;
		rdata[2] <= (s_send  & (sck_index==6'd42 ) & (sck_cnt==10'b0)) ? miso : rdata[2] ;
		rdata[1] <= (s_send  & (sck_index==6'd44 ) & (sck_cnt==10'b0)) ? miso : rdata[1] ;
		rdata[0] <= (s_send  & (sck_index==6'd46 ) & (sck_cnt==10'b0)) ? miso : rdata[0] ;
	end
end

reg		done;
always @(posedge clock or negedge reset)
begin
	if(~reset) done <= 1'b0;
	else	   done <= (startw_pedge | startr_pedge) ? 1'b0 : 
	                   (s_done & (done_cnt==4'd15) ) ? 1'b1 : done;
end

// --------------------------------------------
// 4) state transition
always @(posedge clock or negedge reset)
begin
	if(~reset) m_state <= 2'b0;
	else	   m_state <= (s_idle  & (startw_pedge | startr_pedge)        ) ? M_READY :
	                      (s_ready & (ready_cnt==freq)                    ) ? M_SEND  : 
	                      (s_send  & (sck_index==6'd48) & (sck_cnt==10'b0)) ? M_DONE  : 
	                      (s_done  & (done_cnt==4'd15)                    ) ? M_IDLE  : m_state ;
end

endmodule