`timescale 1ns / 1ps

module btn_in(
	reset     ,
	clock     ,
	btn_in    ,
	btn_out,
	btn_1d,
	btn_2d,
	max_cnt20,
	btn1,
    btn2
);
input		reset   ;
input		clock   ;
input		btn_in  ;
output		btn_out ;
output		btn_1d ;
output		btn_2d ;
output		btn1 ;
output		btn2 ;
output  [19:0]  max_cnt20;


parameter	max_cnt = 20'd1000000;	// 10ms
//parameter	max_cnt = 20'd10;	// for sim, 1000 : 10us, 10 : 0.1us
wire [19:0] max_cnt20;
assign max_cnt20 = max_cnt;

reg	[19:0]	cnt;
always @(posedge clock or negedge reset)
begin
	if(~reset)	cnt <= 20'b0;
	else		cnt <= (cnt==max_cnt) ? 20'b0 : cnt+1'b1;
end

reg		btn_1d, btn_2d;
always @(posedge clock or negedge reset)
begin
	if(~reset)	begin
		btn_1d <= 1'b0;
		btn_2d <= 1'b0;
	end
	else	begin
		btn_1d <= btn_in;
		btn_2d <= btn_1d;
	end
end

reg		btn1, btn2;
always @(posedge clock or negedge reset)
begin
	if(~reset)	begin
		btn1 <= 1'b0;
		btn2 <= 1'b0;
	end
	else	begin
		btn1 <= (cnt==max_cnt) ? btn_2d : btn1;
		btn2 <= (cnt==max_cnt) ? btn1   : btn2;
	end
end

reg		btn_out;
always @(posedge clock or negedge reset)
begin
	if(~reset)	btn_out <= 1'b0;
	else		btn_out <= ((cnt==max_cnt) & btn1 &~btn2) ? 1'b1 : 1'b0;
end

endmodule
