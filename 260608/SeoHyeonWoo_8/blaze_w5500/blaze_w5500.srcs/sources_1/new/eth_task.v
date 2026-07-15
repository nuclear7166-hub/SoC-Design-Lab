
module eth_task (
	reset        ,
	mclk         ,	// 50 Mhz
	
	eth_start    ,
	eth_ram_sel  ,	// 0 : spi control,  1 : mcu control
	eth_addr     ,
	eth_size     ,	// data length - 1
	eth_done     ,
	
	eth_scsn     ,
	eth_sclk     ,
	eth_mosi     ,
	eth_miso     ,

	mb_rst       ,
	mb_en        ,
	mb_we        ,
	mb_addr      ,
	mb_din       ,
	mb_dout        
);
input 		reset       ;
input		mclk        ;

input		eth_start   ;
input		eth_ram_sel ;
input	[23:0]	eth_addr    ;
input	[12:0]	eth_size    ;
output		eth_done    ;

output		eth_scsn    ;
output		eth_sclk    ;
output		eth_mosi    ;
input		eth_miso    ;

input		mb_rst      ;
input		mb_en       ;
input	[3:0]	mb_we       ;
input	[12:0]	mb_addr     ;
input	[31:0]	mb_din      ;
output	[31:0]	mb_dout     ;


// --------------------------------------------
// 1) define state
parameter	M_IDLE	= 3'd0;
parameter	M_READY	= 3'd1;
parameter	M_ADDR	= 3'd2;
parameter	M_WRITE	= 3'd3;
parameter	M_READ	= 3'd4;
parameter	M_DONE	= 3'd5;


// --------------------------------------------
// 2) state flag
reg	[2:0]	m_state;
wire		s_idle	= (m_state==M_IDLE)  ? 1'b1 : 1'b0;
wire		s_ready	= (m_state==M_READY) ? 1'b1 : 1'b0;
wire		s_addr	= (m_state==M_ADDR)  ? 1'b1 : 1'b0;
wire		s_write	= (m_state==M_WRITE) ? 1'b1 : 1'b0;
wire		s_read	= (m_state==M_READ)  ? 1'b1 : 1'b0;
wire		s_done	= (m_state==M_DONE)  ? 1'b1 : 1'b0;


// --------------------------------------------
// 3) code implementation
reg	[1:0]	ready_cnt;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	ready_cnt <= 2'd0;
	else		ready_cnt <= ~s_ready ? 2'd0 : ready_cnt+1'b1 ;
end

reg	[5:0]	addr_cnt;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	addr_cnt <= 6'd0;
	else		addr_cnt <= ~s_addr ? 6'd0 : addr_cnt+1'b1 ;
end

reg	[5:0]	write_cnt;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	write_cnt <= 6'd0;
	else		write_cnt <= ~s_write ? 6'd0 : write_cnt+1'b1 ;
end

reg	[5:0]	read_cnt;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	read_cnt <= 6'd0;
	else		read_cnt <= ~s_read ? 6'd0 : read_cnt+1'b1 ;
end

reg	[1:0]	done_cnt;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	done_cnt <= 2'd0;
	else		done_cnt <= ~s_done ? 2'd0 : done_cnt+1'b1 ;
end


reg		eth_start_1d;
wire		eth_start_nedge = ~eth_start & eth_start_1d;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	eth_start_1d <= 1'b0;
	else		eth_start_1d <= eth_start;
end

reg		eth_dir;		// 0 : spi read, 1 : spi write
always @(posedge mclk or negedge reset)
begin
	if(!reset)	eth_dir <= 1'b1;
	else		eth_dir <= eth_addr[2];
end

reg	[1:0]	addr_packet;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	addr_packet <= 2'd0;
	else		addr_packet <= ~s_addr ? 2'd0 :
				      (addr_cnt==6'd63) ? addr_packet+1'd1 : addr_packet;
end

reg	[12:0]	write_packet;
always @(posedge mclk or negedge reset)
begin
	if(!reset) write_packet <= 13'd0;
	else	   write_packet <= ~s_write? 13'd0 : 
	                           (write_cnt==6'd63) ? write_packet+1'd1 : write_packet;
end

reg	[12:0]	read_packet;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	read_packet <= 13'd0;
	else		read_packet <= ~s_read ? 13'd0 : 
	                               (read_cnt==6'd63) ? read_packet+1'd1 : read_packet;
end

reg		eth_scsn;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	eth_scsn <= 1'b1;
	else		eth_scsn <= s_idle;
end

reg		eth_sclk;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	eth_sclk <= 1'b0;
	else		eth_sclk <= s_addr  ? addr_cnt[2]  : 
	                            s_write ? write_cnt[2] : 
	                            s_read  ? read_cnt[2]  : 1'b0;
end


// ----------------------------------------------------------------------------------
// for debug..
reg		eth_sclk_1d;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	eth_sclk_1d <= 1'b0;
	else		eth_sclk_1d <= eth_sclk;
end

reg	[7:0]	sclk_cnt;
wire		sclk_pedge = eth_sclk & ~eth_sclk_1d;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	sclk_cnt <= 8'b0;
	else		sclk_cnt <= eth_start ? 8'b0 : sclk_pedge ? sclk_cnt+1'b1 : sclk_cnt;
end
// ----------------------------------------------------------------------------------


reg		eth_scsn_1d, eth_scsn_2d;
wire		eth_scsn_pedge = eth_scsn_1d & ~eth_scsn_2d;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	begin
		eth_scsn_1d <= 1'b1;
		eth_scsn_2d <= 1'b1;
	end
	else	begin
		eth_scsn_1d <= eth_scsn;
		eth_scsn_2d <= eth_scsn_1d;
	end
end

reg		eth_done;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	eth_done <= 1'b0;
	else		eth_done <= eth_start  ? 1'b0 :
				    eth_scsn_pedge ? 1'b1 : eth_done ;
end


// --------------------------------------------------------------------
// SPRAM Read(Data Buffer) -> SPI Write

wire	[31:0]	spram_dout;
reg	[12:0]	spix_raddr;
always @(posedge mclk or negedge reset)
begin
	if(!reset) spix_raddr <= 13'b0;
	else	   spix_raddr <= ~s_write ? 13'b0 :
	                         ((write_packet[1:0]==2'b11) &&(write_cnt==6'd60)) ? spix_raddr+3'd4 : spix_raddr ;
end

reg	[7:0]	spi_wdata;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	spi_wdata <= 8'b0;
	else		spi_wdata <=  s_addr ? spram_dout[31:24] :
	                             ((write_cnt==6'd63) && (write_packet[1:0]==2'b00)) ? spram_dout[23:16] :
	                             ((write_cnt==6'd63) && (write_packet[1:0]==2'b01)) ? spram_dout[15:8]  :
	                             ((write_cnt==6'd63) && (write_packet[1:0]==2'b10)) ? spram_dout[7:0]   :
	                             ((write_cnt==6'd63) && (write_packet[1:0]==2'b11)) ? spram_dout[31:24] :
	                              spi_wdata ;
end


// --------------------------------------------------------------------
// SPI Read -> SPRAM Write
// read_cnt
//   - 58 : spi read
//   - 60 : spi_read -> spix_wdata(spram_din)
//   - 61 : spram_wen
//   - 63 : spram_addr + 4
reg	[7:0]	spi_rdata;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	spi_rdata <= 8'b0;
	else	begin
		spi_rdata[7] <= (s_read & (read_cnt==6'd2 )) ? eth_miso : spi_rdata[7];
		spi_rdata[6] <= (s_read & (read_cnt==6'd10)) ? eth_miso : spi_rdata[6];
		spi_rdata[5] <= (s_read & (read_cnt==6'd18)) ? eth_miso : spi_rdata[5];
		spi_rdata[4] <= (s_read & (read_cnt==6'd26)) ? eth_miso : spi_rdata[4];
		spi_rdata[3] <= (s_read & (read_cnt==6'd34)) ? eth_miso : spi_rdata[3];
		spi_rdata[2] <= (s_read & (read_cnt==6'd42)) ? eth_miso : spi_rdata[2];
		spi_rdata[1] <= (s_read & (read_cnt==6'd50)) ? eth_miso : spi_rdata[1];
		spi_rdata[0] <= (s_read & (read_cnt==6'd58)) ? eth_miso : spi_rdata[0];
	end		
end

reg	[7:0]	spix_wdata0;
always @(posedge mclk or negedge reset)
begin
	if(!reset) spix_wdata0 <= 8'b0;
	else	   spix_wdata0 <= (s_read & (read_cnt==6'd60) && (read_packet[1:0]==2'b00)) ? spi_rdata : spix_wdata0 ;
end

reg	[7:0]	spix_wdata1;
always @(posedge mclk or negedge reset)
begin
	if(!reset) spix_wdata1 <= 8'b0;
	else	   spix_wdata1 <= (s_read & (read_cnt==6'd60) && (read_packet[1:0]==2'b01)) ? spi_rdata : spix_wdata1;
end

reg	[7:0]	spix_wdata2;
always @(posedge mclk or negedge reset)
begin
	if(!reset) spix_wdata2 <= 8'b0;
	else	   spix_wdata2 <= (s_read & (read_cnt==6'd60) && (read_packet[1:0]==2'b10)) ? spi_rdata : spix_wdata2;
end

reg	[7:0]	spix_wdata3;
always @(posedge mclk or negedge reset)
begin
	if(!reset) spix_wdata3 <= 8'b0;
	else	   spix_wdata3 <= (s_read & (read_cnt==6'd60) && (read_packet[1:0]==2'b11)) ? spi_rdata : spix_wdata3;
end

reg		spix_wen;
always @(posedge mclk or negedge reset)
begin
	if(!reset)	spix_wen <= 1'b0;
	else		spix_wen <= eth_dir ? 1'b0 :
	                            (s_read & (read_packet[1:0]==2'b11) && (read_cnt==6'd61)) ? 1'b1 :
				    (s_done & (done_cnt==2'd2)) ? 1'b1 : 1'b0;
end

reg	[12:0]	spix_waddr;
always @(posedge mclk or negedge reset)
begin
	if(!reset) spix_waddr <= 13'b0;
	else	   spix_waddr <= s_idle ? 13'b0 :
	                         (s_read & (read_cnt==6'd63) && (read_packet[1:0]==2'b11)) ? spix_waddr+3'd4 : spix_waddr ;
end

// --------------------------------------------------------------------
// SPI MOSI
reg		eth_mosi;
always @(posedge mclk or negedge reset)
begin
	if(!reset) eth_mosi <= 1'b0;
	else	   eth_mosi <= (s_addr  & (addr_packet==2'd0) & (addr_cnt==6'd0 )) ? eth_addr[23] :
			       (s_addr  & (addr_packet==2'd0) & (addr_cnt==6'd8 )) ? eth_addr[22] :
			       (s_addr  & (addr_packet==2'd0) & (addr_cnt==6'd16)) ? eth_addr[21] :
			       (s_addr  & (addr_packet==2'd0) & (addr_cnt==6'd24)) ? eth_addr[20] :
			       (s_addr  & (addr_packet==2'd0) & (addr_cnt==6'd32)) ? eth_addr[19] :
			       (s_addr  & (addr_packet==2'd0) & (addr_cnt==6'd40)) ? eth_addr[18] :
			       (s_addr  & (addr_packet==2'd0) & (addr_cnt==6'd48)) ? eth_addr[17] :
			       (s_addr  & (addr_packet==2'd0) & (addr_cnt==6'd56)) ? eth_addr[16] :
			       (s_addr  & (addr_packet==2'd1) & (addr_cnt==6'd0 )) ? eth_addr[15] :
			       (s_addr  & (addr_packet==2'd1) & (addr_cnt==6'd8 )) ? eth_addr[14] :
			       (s_addr  & (addr_packet==2'd1) & (addr_cnt==6'd16)) ? eth_addr[13] :
			       (s_addr  & (addr_packet==2'd1) & (addr_cnt==6'd24)) ? eth_addr[12] :
			       (s_addr  & (addr_packet==2'd1) & (addr_cnt==6'd32)) ? eth_addr[11] :
			       (s_addr  & (addr_packet==2'd1) & (addr_cnt==6'd40)) ? eth_addr[10] :
			       (s_addr  & (addr_packet==2'd1) & (addr_cnt==6'd48)) ? eth_addr[9]  :
			       (s_addr  & (addr_packet==2'd1) & (addr_cnt==6'd56)) ? eth_addr[8]  :
			       (s_addr  & (addr_packet==2'd2) & (addr_cnt==6'd0 )) ? eth_addr[7]  :
			       (s_addr  & (addr_packet==2'd2) & (addr_cnt==6'd8 )) ? eth_addr[6]  :
			       (s_addr  & (addr_packet==2'd2) & (addr_cnt==6'd16)) ? eth_addr[5]  :
			       (s_addr  & (addr_packet==2'd2) & (addr_cnt==6'd24)) ? eth_addr[4]  :
			       (s_addr  & (addr_packet==2'd2) & (addr_cnt==6'd32)) ? eth_addr[3]  :
			       (s_addr  & (addr_packet==2'd2) & (addr_cnt==6'd40)) ? eth_addr[2]  :
			       (s_addr  & (addr_packet==2'd2) & (addr_cnt==6'd48)) ? eth_addr[1]  :
			       (s_addr  & (addr_packet==2'd2) & (addr_cnt==6'd56)) ? eth_addr[0]  :
			       (s_write & (write_cnt==6'd0 )                     ) ? spi_wdata[7] :
			       (s_write & (write_cnt==6'd8 )                     ) ? spi_wdata[6] :
			       (s_write & (write_cnt==6'd16)                     ) ? spi_wdata[5] :
			       (s_write & (write_cnt==6'd24)                     ) ? spi_wdata[4] :
			       (s_write & (write_cnt==6'd32)                     ) ? spi_wdata[3] :
			       (s_write & (write_cnt==6'd40)                     ) ? spi_wdata[2] :
			       (s_write & (write_cnt==6'd48)                     ) ? spi_wdata[1] :
			       (s_write & (write_cnt==6'd56)                     ) ? spi_wdata[0] : 
			        eth_mosi ;
end


// --------------------------------------------
// 4) state transition
always @(posedge mclk or negedge reset)
begin
	if(!reset) m_state <= M_IDLE;
	else	   m_state <= (s_idle  &  eth_start_nedge)   ? M_READY :
	                      (s_ready & (ready_cnt==2'd3) ) ? M_ADDR :
	                      (s_addr  &  eth_dir & (addr_cnt==6'd63) & (addr_packet==2'd2)) ? M_WRITE :
	                      (s_addr  & ~eth_dir & (addr_cnt==6'd63) & (addr_packet==2'd2)) ? M_READ  :
	                      (s_write & (write_cnt==6'd63) & (write_packet==eth_size)) ? M_DONE  :
	                      (s_read  & (read_cnt==6'd63) & (read_packet==eth_size)  ) ? M_DONE  :
	                      (s_done  & (done_cnt==2'd3)) ? M_IDLE : 
	                       m_state ;
end	                             

wire		spram_rst  = ~eth_ram_sel ? 1'b0 : mb_rst ;
wire		spram_en   = ~eth_ram_sel ? 1'b1 : mb_en  ;
wire	[3:0]	spram_we   = ~eth_ram_sel ? {4{spix_wen}}   : mb_we ;
wire	[31:0]	spram_addr = ~eth_ram_sel ? (spix_wen ? {19'b0, spix_waddr} : {19'b0, spix_raddr}) : {19'b0, mb_addr};
wire	[31:0]	spram_din  = ~eth_ram_sel ? {spix_wdata0, spix_wdata1, spix_wdata2, spix_wdata3} : mb_din;
wire	[31:0]	mb_dout    = spram_dout;

// address : 0, 4, 8 ~
// option : Generate address interface with 32bits
wire		spram_busy;
spram_2048x32 	mem1 (
	.clka      (mclk         ),    	// input wire clka
	.rsta      (spram_rst    ),	// input wire rsta
	.ena       (spram_en     ),    	// input wire ena
	.wea       (spram_we     ),    	// input wire [3 : 0] wea
	.addra     (spram_addr   ),  	// input wire [31 : 0] addra
	.dina      (spram_din    ),    	// input wire [31 : 0] dina
	.douta     (spram_dout   ),    	// output wire [31 : 0] douta
	.rsta_busy (spram_busy   )      // output wire rsta_busy
);

endmodule
