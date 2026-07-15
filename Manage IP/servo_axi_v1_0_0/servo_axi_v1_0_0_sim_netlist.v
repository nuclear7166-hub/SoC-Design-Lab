// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Jun 15 09:11:48 2026
// Host        : Woo running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/nucle/Desktop/AIoT/SoC/Manage
//               IP/servo_axi_v1_0_0/servo_axi_v1_0_0_sim_netlist.v}
// Design      : servo_axi_v1_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "servo_axi_v1_0_0,servo_axi_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "servo_axi_v1_0,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module servo_axi_v1_0_0
   (Servo,
    s00_servo_axi_aclk,
    s00_servo_axi_aresetn,
    s00_servo_axi_awaddr,
    s00_servo_axi_awprot,
    s00_servo_axi_awvalid,
    s00_servo_axi_awready,
    s00_servo_axi_wdata,
    s00_servo_axi_wstrb,
    s00_servo_axi_wvalid,
    s00_servo_axi_wready,
    s00_servo_axi_bresp,
    s00_servo_axi_bvalid,
    s00_servo_axi_bready,
    s00_servo_axi_araddr,
    s00_servo_axi_arprot,
    s00_servo_axi_arvalid,
    s00_servo_axi_arready,
    s00_servo_axi_rdata,
    s00_servo_axi_rresp,
    s00_servo_axi_rvalid,
    s00_servo_axi_rready);
  output Servo;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_servo_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_servo_axi_aclk, ASSOCIATED_BUSIF s00_servo_axi, ASSOCIATED_RESET s00_servo_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input s00_servo_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_servo_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_servo_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_servo_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi AWADDR" *) input [3:0]s00_servo_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi AWPROT" *) input [2:0]s00_servo_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi AWVALID" *) input s00_servo_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi AWREADY" *) output s00_servo_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi WDATA" *) input [31:0]s00_servo_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi WSTRB" *) input [3:0]s00_servo_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi WVALID" *) input s00_servo_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi WREADY" *) output s00_servo_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi BRESP" *) output [1:0]s00_servo_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi BVALID" *) output s00_servo_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi BREADY" *) input s00_servo_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi ARADDR" *) input [3:0]s00_servo_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi ARPROT" *) input [2:0]s00_servo_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi ARVALID" *) input s00_servo_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi ARREADY" *) output s00_servo_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi RDATA" *) output [31:0]s00_servo_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi RRESP" *) output [1:0]s00_servo_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi RVALID" *) output s00_servo_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_servo_axi RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_servo_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_servo_axi_rready;

  wire \<const0> ;
  wire Servo;
  wire s00_servo_axi_aclk;
  wire [3:0]s00_servo_axi_araddr;
  wire s00_servo_axi_aresetn;
  wire s00_servo_axi_arready;
  wire s00_servo_axi_arvalid;
  wire [3:0]s00_servo_axi_awaddr;
  wire s00_servo_axi_awready;
  wire s00_servo_axi_awvalid;
  wire s00_servo_axi_bready;
  wire s00_servo_axi_bvalid;
  wire [31:0]s00_servo_axi_rdata;
  wire s00_servo_axi_rready;
  wire s00_servo_axi_rvalid;
  wire [31:0]s00_servo_axi_wdata;
  wire s00_servo_axi_wready;
  wire [3:0]s00_servo_axi_wstrb;
  wire s00_servo_axi_wvalid;

  assign s00_servo_axi_bresp[1] = \<const0> ;
  assign s00_servo_axi_bresp[0] = \<const0> ;
  assign s00_servo_axi_rresp[1] = \<const0> ;
  assign s00_servo_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  servo_axi_v1_0_0_servo_axi_v1_0 inst
       (.S_AXI_ARREADY(s00_servo_axi_arready),
        .S_AXI_AWREADY(s00_servo_axi_awready),
        .S_AXI_WREADY(s00_servo_axi_wready),
        .Servo(Servo),
        .s00_servo_axi_aclk(s00_servo_axi_aclk),
        .s00_servo_axi_araddr(s00_servo_axi_araddr[3:2]),
        .s00_servo_axi_aresetn(s00_servo_axi_aresetn),
        .s00_servo_axi_arvalid(s00_servo_axi_arvalid),
        .s00_servo_axi_awaddr(s00_servo_axi_awaddr[3:2]),
        .s00_servo_axi_awvalid(s00_servo_axi_awvalid),
        .s00_servo_axi_bready(s00_servo_axi_bready),
        .s00_servo_axi_bvalid(s00_servo_axi_bvalid),
        .s00_servo_axi_rdata(s00_servo_axi_rdata),
        .s00_servo_axi_rready(s00_servo_axi_rready),
        .s00_servo_axi_rvalid(s00_servo_axi_rvalid),
        .s00_servo_axi_wdata(s00_servo_axi_wdata),
        .s00_servo_axi_wstrb(s00_servo_axi_wstrb),
        .s00_servo_axi_wvalid(s00_servo_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "clockdivider_10000hz" *) 
module servo_axi_v1_0_0_clockdivider_10000hz
   (clk10000hz,
    s00_servo_axi_aresetn_0,
    s00_servo_axi_aclk,
    s00_servo_axi_aresetn);
  output clk10000hz;
  output s00_servo_axi_aresetn_0;
  input s00_servo_axi_aclk;
  input s00_servo_axi_aresetn;

  wire clk10000hz;
  wire clk10000hz_i_1_n_0;
  wire [25:0]cnt;
  wire \cnt[25]_i_3_n_0 ;
  wire \cnt[25]_i_4_n_0 ;
  wire \cnt[25]_i_5_n_0 ;
  wire \cnt[25]_i_6_n_0 ;
  wire \cnt[25]_i_7_n_0 ;
  wire \cnt[25]_i_8_n_0 ;
  wire \cnt[25]_i_9_n_0 ;
  wire [25:0]cnt_0;
  wire \cnt_reg[12]_i_2_n_0 ;
  wire \cnt_reg[12]_i_2_n_1 ;
  wire \cnt_reg[12]_i_2_n_2 ;
  wire \cnt_reg[12]_i_2_n_3 ;
  wire \cnt_reg[16]_i_2_n_0 ;
  wire \cnt_reg[16]_i_2_n_1 ;
  wire \cnt_reg[16]_i_2_n_2 ;
  wire \cnt_reg[16]_i_2_n_3 ;
  wire \cnt_reg[20]_i_2_n_0 ;
  wire \cnt_reg[20]_i_2_n_1 ;
  wire \cnt_reg[20]_i_2_n_2 ;
  wire \cnt_reg[20]_i_2_n_3 ;
  wire \cnt_reg[24]_i_2_n_0 ;
  wire \cnt_reg[24]_i_2_n_1 ;
  wire \cnt_reg[24]_i_2_n_2 ;
  wire \cnt_reg[24]_i_2_n_3 ;
  wire \cnt_reg[4]_i_2_n_0 ;
  wire \cnt_reg[4]_i_2_n_1 ;
  wire \cnt_reg[4]_i_2_n_2 ;
  wire \cnt_reg[4]_i_2_n_3 ;
  wire \cnt_reg[8]_i_2_n_0 ;
  wire \cnt_reg[8]_i_2_n_1 ;
  wire \cnt_reg[8]_i_2_n_2 ;
  wire \cnt_reg[8]_i_2_n_3 ;
  wire [25:1]data0;
  wire s00_servo_axi_aclk;
  wire s00_servo_axi_aresetn;
  wire s00_servo_axi_aresetn_0;
  wire [3:0]\NLW_cnt_reg[25]_i_2_CO_UNCONNECTED ;
  wire [3:1]\NLW_cnt_reg[25]_i_2_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    Servo_i_1
       (.I0(s00_servo_axi_aresetn),
        .O(s00_servo_axi_aresetn_0));
  LUT3 #(
    .INIT(8'h78)) 
    clk10000hz_i_1
       (.I0(s00_servo_axi_aresetn),
        .I1(\cnt[25]_i_3_n_0 ),
        .I2(clk10000hz),
        .O(clk10000hz_i_1_n_0));
  FDRE clk10000hz_reg
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .D(clk10000hz_i_1_n_0),
        .Q(clk10000hz),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt[0]),
        .O(cnt_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[10]_i_1 
       (.I0(data0[10]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[11]_i_1 
       (.I0(data0[11]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[11]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[12]_i_1 
       (.I0(data0[12]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[13]_i_1 
       (.I0(data0[13]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[13]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[14]_i_1 
       (.I0(data0[14]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[15]_i_1 
       (.I0(data0[15]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[15]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[16]_i_1 
       (.I0(data0[16]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[17]_i_1 
       (.I0(data0[17]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[17]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[18]_i_1 
       (.I0(data0[18]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[19]_i_1 
       (.I0(data0[19]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[1]_i_1 
       (.I0(data0[1]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[20]_i_1 
       (.I0(data0[20]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[21]_i_1 
       (.I0(data0[21]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[21]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[22]_i_1 
       (.I0(data0[22]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[23]_i_1 
       (.I0(data0[23]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[23]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[24]_i_1 
       (.I0(data0[24]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[24]));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[25]_i_1 
       (.I0(data0[25]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[25]));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \cnt[25]_i_3 
       (.I0(\cnt[25]_i_4_n_0 ),
        .I1(\cnt[25]_i_5_n_0 ),
        .I2(\cnt[25]_i_6_n_0 ),
        .I3(\cnt[25]_i_7_n_0 ),
        .I4(\cnt[25]_i_8_n_0 ),
        .I5(\cnt[25]_i_9_n_0 ),
        .O(\cnt[25]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \cnt[25]_i_4 
       (.I0(cnt[12]),
        .I1(cnt[25]),
        .I2(cnt[24]),
        .I3(cnt[6]),
        .O(\cnt[25]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \cnt[25]_i_5 
       (.I0(cnt[7]),
        .I1(cnt[10]),
        .I2(cnt[1]),
        .I3(cnt[20]),
        .O(\cnt[25]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0040)) 
    \cnt[25]_i_6 
       (.I0(cnt[19]),
        .I1(cnt[2]),
        .I2(cnt[8]),
        .I3(cnt[11]),
        .O(\cnt[25]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[25]_i_7 
       (.I0(cnt[14]),
        .I1(cnt[3]),
        .I2(cnt[13]),
        .I3(cnt[5]),
        .O(\cnt[25]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[25]_i_8 
       (.I0(cnt[4]),
        .I1(cnt[22]),
        .I2(cnt[17]),
        .I3(cnt[23]),
        .O(\cnt[25]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFFFFFF)) 
    \cnt[25]_i_9 
       (.I0(cnt[18]),
        .I1(cnt[21]),
        .I2(cnt[15]),
        .I3(cnt[16]),
        .I4(cnt[0]),
        .I5(cnt[9]),
        .O(\cnt[25]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[2]_i_1 
       (.I0(data0[2]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[3]_i_1 
       (.I0(data0[3]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[4]_i_1 
       (.I0(data0[4]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[5]_i_1 
       (.I0(data0[5]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[6]_i_1 
       (.I0(data0[6]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[7]_i_1 
       (.I0(data0[7]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[8]_i_1 
       (.I0(data0[8]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[9]_i_1 
       (.I0(data0[9]),
        .I1(\cnt[25]_i_3_n_0 ),
        .O(cnt_0[9]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[0]),
        .Q(cnt[0]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[10] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[10]),
        .Q(cnt[10]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[11] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[11]),
        .Q(cnt[11]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[12] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[12]),
        .Q(cnt[12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[12]_i_2 
       (.CI(\cnt_reg[8]_i_2_n_0 ),
        .CO({\cnt_reg[12]_i_2_n_0 ,\cnt_reg[12]_i_2_n_1 ,\cnt_reg[12]_i_2_n_2 ,\cnt_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(cnt[12:9]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[13] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[13]),
        .Q(cnt[13]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[14] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[14]),
        .Q(cnt[14]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[15] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[15]),
        .Q(cnt[15]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[16] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[16]),
        .Q(cnt[16]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[16]_i_2 
       (.CI(\cnt_reg[12]_i_2_n_0 ),
        .CO({\cnt_reg[16]_i_2_n_0 ,\cnt_reg[16]_i_2_n_1 ,\cnt_reg[16]_i_2_n_2 ,\cnt_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(cnt[16:13]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[17] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[17]),
        .Q(cnt[17]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[18] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[18]),
        .Q(cnt[18]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[19] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[19]),
        .Q(cnt[19]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[1]),
        .Q(cnt[1]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[20] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[20]),
        .Q(cnt[20]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[20]_i_2 
       (.CI(\cnt_reg[16]_i_2_n_0 ),
        .CO({\cnt_reg[20]_i_2_n_0 ,\cnt_reg[20]_i_2_n_1 ,\cnt_reg[20]_i_2_n_2 ,\cnt_reg[20]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(cnt[20:17]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[21] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[21]),
        .Q(cnt[21]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[22] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[22]),
        .Q(cnt[22]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[23] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[23]),
        .Q(cnt[23]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[24] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[24]),
        .Q(cnt[24]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[24]_i_2 
       (.CI(\cnt_reg[20]_i_2_n_0 ),
        .CO({\cnt_reg[24]_i_2_n_0 ,\cnt_reg[24]_i_2_n_1 ,\cnt_reg[24]_i_2_n_2 ,\cnt_reg[24]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(cnt[24:21]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[25] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[25]),
        .Q(cnt[25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[25]_i_2 
       (.CI(\cnt_reg[24]_i_2_n_0 ),
        .CO(\NLW_cnt_reg[25]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_reg[25]_i_2_O_UNCONNECTED [3:1],data0[25]}),
        .S({1'b0,1'b0,1'b0,cnt[25]}));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[2]),
        .Q(cnt[2]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[3]),
        .Q(cnt[3]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[4]),
        .Q(cnt[4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\cnt_reg[4]_i_2_n_0 ,\cnt_reg[4]_i_2_n_1 ,\cnt_reg[4]_i_2_n_2 ,\cnt_reg[4]_i_2_n_3 }),
        .CYINIT(cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(cnt[4:1]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[5]),
        .Q(cnt[5]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[6] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[6]),
        .Q(cnt[6]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[7] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[7]),
        .Q(cnt[7]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[8] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[8]),
        .Q(cnt[8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[8]_i_2 
       (.CI(\cnt_reg[4]_i_2_n_0 ),
        .CO({\cnt_reg[8]_i_2_n_0 ,\cnt_reg[8]_i_2_n_1 ,\cnt_reg[8]_i_2_n_2 ,\cnt_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(cnt[8:5]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[9] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(s00_servo_axi_aresetn_0),
        .D(cnt_0[9]),
        .Q(cnt[9]));
endmodule

(* ORIG_REF_NAME = "servo" *) 
module servo_axi_v1_0_0_servo
   (Servo,
    clk10000hz,
    Servo_reg_0,
    Q,
    s00_servo_axi_aclk);
  output Servo;
  input clk10000hz;
  input Servo_reg_0;
  input [7:0]Q;
  input s00_servo_axi_aclk;

  wire [7:0]Q;
  wire Servo;
  wire Servo0_carry_i_10_n_0;
  wire Servo0_carry_i_1_n_0;
  wire Servo0_carry_i_2_n_0;
  wire Servo0_carry_i_3_n_0;
  wire Servo0_carry_i_4_n_0;
  wire Servo0_carry_i_5_n_0;
  wire Servo0_carry_i_6_n_0;
  wire Servo0_carry_i_7_n_0;
  wire Servo0_carry_i_8_n_0;
  wire Servo0_carry_i_9_n_0;
  wire Servo0_carry_n_0;
  wire Servo0_carry_n_1;
  wire Servo0_carry_n_2;
  wire Servo0_carry_n_3;
  wire Servo_reg_0;
  wire clk10000hz;
  wire \cnt_duty[0]_i_1_n_0 ;
  wire \cnt_duty[2]_i_1_n_0 ;
  wire \cnt_duty[4]_i_1_n_0 ;
  wire \cnt_duty[4]_i_2_n_0 ;
  wire \cnt_duty[5]_i_2_n_0 ;
  wire \cnt_duty[6]_i_1_n_0 ;
  wire \cnt_duty[7]_i_2_n_0 ;
  wire [7:0]cnt_duty_reg;
  wire [7:0]duty;
  wire [7:1]p_0_in__0;
  wire s00_servo_axi_aclk;
  wire [3:0]NLW_Servo0_carry_O_UNCONNECTED;

  CARRY4 Servo0_carry
       (.CI(1'b0),
        .CO({Servo0_carry_n_0,Servo0_carry_n_1,Servo0_carry_n_2,Servo0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({Servo0_carry_i_1_n_0,Servo0_carry_i_2_n_0,Servo0_carry_i_3_n_0,Servo0_carry_i_4_n_0}),
        .O(NLW_Servo0_carry_O_UNCONNECTED[3:0]),
        .S({Servo0_carry_i_5_n_0,Servo0_carry_i_6_n_0,Servo0_carry_i_7_n_0,Servo0_carry_i_8_n_0}));
  LUT6 #(
    .INIT(64'hEECECEEF888A8A8A)) 
    Servo0_carry_i_1
       (.I0(duty[7]),
        .I1(\cnt_duty[4]_i_2_n_0 ),
        .I2(cnt_duty_reg[7]),
        .I3(cnt_duty_reg[6]),
        .I4(\cnt_duty[7]_i_2_n_0 ),
        .I5(duty[6]),
        .O(Servo0_carry_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h7)) 
    Servo0_carry_i_10
       (.I0(cnt_duty_reg[0]),
        .I1(cnt_duty_reg[1]),
        .O(Servo0_carry_i_10_n_0));
  LUT6 #(
    .INIT(64'hCEEFFECE8A8AA88A)) 
    Servo0_carry_i_2
       (.I0(duty[5]),
        .I1(\cnt_duty[4]_i_2_n_0 ),
        .I2(cnt_duty_reg[5]),
        .I3(cnt_duty_reg[4]),
        .I4(Servo0_carry_i_9_n_0),
        .I5(duty[4]),
        .O(Servo0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'hCEEFFECE8A8AA88A)) 
    Servo0_carry_i_3
       (.I0(duty[3]),
        .I1(\cnt_duty[4]_i_2_n_0 ),
        .I2(cnt_duty_reg[3]),
        .I3(cnt_duty_reg[2]),
        .I4(Servo0_carry_i_10_n_0),
        .I5(duty[2]),
        .O(Servo0_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFCAAA82)) 
    Servo0_carry_i_4
       (.I0(duty[1]),
        .I1(cnt_duty_reg[0]),
        .I2(cnt_duty_reg[1]),
        .I3(\cnt_duty[4]_i_2_n_0 ),
        .I4(duty[0]),
        .O(Servo0_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h000909003C303039)) 
    Servo0_carry_i_5
       (.I0(cnt_duty_reg[7]),
        .I1(duty[7]),
        .I2(\cnt_duty[4]_i_2_n_0 ),
        .I3(\cnt_duty[7]_i_2_n_0 ),
        .I4(cnt_duty_reg[6]),
        .I5(duty[6]),
        .O(Servo0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h0900000930363930)) 
    Servo0_carry_i_6
       (.I0(cnt_duty_reg[5]),
        .I1(duty[5]),
        .I2(\cnt_duty[4]_i_2_n_0 ),
        .I3(Servo0_carry_i_9_n_0),
        .I4(cnt_duty_reg[4]),
        .I5(duty[4]),
        .O(Servo0_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h0900000930363930)) 
    Servo0_carry_i_7
       (.I0(cnt_duty_reg[3]),
        .I1(duty[3]),
        .I2(\cnt_duty[4]_i_2_n_0 ),
        .I3(Servo0_carry_i_10_n_0),
        .I4(cnt_duty_reg[2]),
        .I5(duty[2]),
        .O(Servo0_carry_i_7_n_0));
  LUT5 #(
    .INIT(32'h00093630)) 
    Servo0_carry_i_8
       (.I0(cnt_duty_reg[1]),
        .I1(duty[1]),
        .I2(\cnt_duty[4]_i_2_n_0 ),
        .I3(cnt_duty_reg[0]),
        .I4(duty[0]),
        .O(Servo0_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    Servo0_carry_i_9
       (.I0(cnt_duty_reg[2]),
        .I1(cnt_duty_reg[0]),
        .I2(cnt_duty_reg[1]),
        .I3(cnt_duty_reg[3]),
        .O(Servo0_carry_i_9_n_0));
  FDCE Servo_reg
       (.C(clk10000hz),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(Servo0_carry_n_0),
        .Q(Servo));
  LUT6 #(
    .INIT(64'h000000007777777F)) 
    \cnt_duty[0]_i_1 
       (.I0(cnt_duty_reg[6]),
        .I1(cnt_duty_reg[7]),
        .I2(cnt_duty_reg[4]),
        .I3(cnt_duty_reg[5]),
        .I4(cnt_duty_reg[3]),
        .I5(cnt_duty_reg[0]),
        .O(\cnt_duty[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \cnt_duty[1]_i_1 
       (.I0(cnt_duty_reg[0]),
        .I1(cnt_duty_reg[1]),
        .I2(\cnt_duty[4]_i_2_n_0 ),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \cnt_duty[2]_i_1 
       (.I0(\cnt_duty[4]_i_2_n_0 ),
        .I1(cnt_duty_reg[0]),
        .I2(cnt_duty_reg[1]),
        .I3(cnt_duty_reg[2]),
        .O(\cnt_duty[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h14444444)) 
    \cnt_duty[3]_i_1 
       (.I0(\cnt_duty[4]_i_2_n_0 ),
        .I1(cnt_duty_reg[3]),
        .I2(cnt_duty_reg[2]),
        .I3(cnt_duty_reg[0]),
        .I4(cnt_duty_reg[1]),
        .O(p_0_in__0[3]));
  LUT6 #(
    .INIT(64'h1555555540000000)) 
    \cnt_duty[4]_i_1 
       (.I0(\cnt_duty[4]_i_2_n_0 ),
        .I1(cnt_duty_reg[2]),
        .I2(cnt_duty_reg[0]),
        .I3(cnt_duty_reg[1]),
        .I4(cnt_duty_reg[3]),
        .I5(cnt_duty_reg[4]),
        .O(\cnt_duty[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt_duty[4]_i_2 
       (.I0(cnt_duty_reg[3]),
        .I1(cnt_duty_reg[5]),
        .I2(cnt_duty_reg[4]),
        .I3(cnt_duty_reg[7]),
        .I4(cnt_duty_reg[6]),
        .O(\cnt_duty[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00CCCCCC01333333)) 
    \cnt_duty[5]_i_1 
       (.I0(cnt_duty_reg[3]),
        .I1(cnt_duty_reg[5]),
        .I2(cnt_duty_reg[4]),
        .I3(cnt_duty_reg[7]),
        .I4(cnt_duty_reg[6]),
        .I5(\cnt_duty[5]_i_2_n_0 ),
        .O(p_0_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \cnt_duty[5]_i_2 
       (.I0(cnt_duty_reg[3]),
        .I1(cnt_duty_reg[1]),
        .I2(cnt_duty_reg[0]),
        .I3(cnt_duty_reg[2]),
        .I4(cnt_duty_reg[4]),
        .O(\cnt_duty[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00005557FFFF0000)) 
    \cnt_duty[6]_i_1 
       (.I0(cnt_duty_reg[7]),
        .I1(cnt_duty_reg[4]),
        .I2(cnt_duty_reg[5]),
        .I3(cnt_duty_reg[3]),
        .I4(\cnt_duty[7]_i_2_n_0 ),
        .I5(cnt_duty_reg[6]),
        .O(\cnt_duty[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h01FFFF000100FF00)) 
    \cnt_duty[7]_i_1 
       (.I0(cnt_duty_reg[3]),
        .I1(cnt_duty_reg[5]),
        .I2(cnt_duty_reg[4]),
        .I3(cnt_duty_reg[7]),
        .I4(cnt_duty_reg[6]),
        .I5(\cnt_duty[7]_i_2_n_0 ),
        .O(p_0_in__0[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cnt_duty[7]_i_2 
       (.I0(cnt_duty_reg[5]),
        .I1(cnt_duty_reg[4]),
        .I2(cnt_duty_reg[2]),
        .I3(cnt_duty_reg[0]),
        .I4(cnt_duty_reg[1]),
        .I5(cnt_duty_reg[3]),
        .O(\cnt_duty[7]_i_2_n_0 ));
  FDCE \cnt_duty_reg[0] 
       (.C(clk10000hz),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(\cnt_duty[0]_i_1_n_0 ),
        .Q(cnt_duty_reg[0]));
  FDCE \cnt_duty_reg[1] 
       (.C(clk10000hz),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(p_0_in__0[1]),
        .Q(cnt_duty_reg[1]));
  FDCE \cnt_duty_reg[2] 
       (.C(clk10000hz),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(\cnt_duty[2]_i_1_n_0 ),
        .Q(cnt_duty_reg[2]));
  FDCE \cnt_duty_reg[3] 
       (.C(clk10000hz),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(p_0_in__0[3]),
        .Q(cnt_duty_reg[3]));
  FDCE \cnt_duty_reg[4] 
       (.C(clk10000hz),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(\cnt_duty[4]_i_1_n_0 ),
        .Q(cnt_duty_reg[4]));
  FDCE \cnt_duty_reg[5] 
       (.C(clk10000hz),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(p_0_in__0[5]),
        .Q(cnt_duty_reg[5]));
  FDCE \cnt_duty_reg[6] 
       (.C(clk10000hz),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(\cnt_duty[6]_i_1_n_0 ),
        .Q(cnt_duty_reg[6]));
  FDCE \cnt_duty_reg[7] 
       (.C(clk10000hz),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(p_0_in__0[7]),
        .Q(cnt_duty_reg[7]));
  FDCE \duty_reg[0] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(Q[0]),
        .Q(duty[0]));
  FDCE \duty_reg[1] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(Q[1]),
        .Q(duty[1]));
  FDCE \duty_reg[2] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(Q[2]),
        .Q(duty[2]));
  FDCE \duty_reg[3] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(Q[3]),
        .Q(duty[3]));
  FDCE \duty_reg[4] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(Q[4]),
        .Q(duty[4]));
  FDCE \duty_reg[5] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(Q[5]),
        .Q(duty[5]));
  FDCE \duty_reg[6] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(Q[6]),
        .Q(duty[6]));
  FDCE \duty_reg[7] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .CLR(Servo_reg_0),
        .D(Q[7]),
        .Q(duty[7]));
endmodule

(* ORIG_REF_NAME = "servo_axi_v1_0" *) 
module servo_axi_v1_0_0_servo_axi_v1_0
   (S_AXI_AWREADY,
    Servo,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    s00_servo_axi_rdata,
    s00_servo_axi_rvalid,
    s00_servo_axi_bvalid,
    s00_servo_axi_aclk,
    s00_servo_axi_awaddr,
    s00_servo_axi_wvalid,
    s00_servo_axi_awvalid,
    s00_servo_axi_wdata,
    s00_servo_axi_araddr,
    s00_servo_axi_arvalid,
    s00_servo_axi_wstrb,
    s00_servo_axi_aresetn,
    s00_servo_axi_bready,
    s00_servo_axi_rready);
  output S_AXI_AWREADY;
  output Servo;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_servo_axi_rdata;
  output s00_servo_axi_rvalid;
  output s00_servo_axi_bvalid;
  input s00_servo_axi_aclk;
  input [1:0]s00_servo_axi_awaddr;
  input s00_servo_axi_wvalid;
  input s00_servo_axi_awvalid;
  input [31:0]s00_servo_axi_wdata;
  input [1:0]s00_servo_axi_araddr;
  input s00_servo_axi_arvalid;
  input [3:0]s00_servo_axi_wstrb;
  input s00_servo_axi_aresetn;
  input s00_servo_axi_bready;
  input s00_servo_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire Servo;
  wire s00_servo_axi_aclk;
  wire [1:0]s00_servo_axi_araddr;
  wire s00_servo_axi_aresetn;
  wire s00_servo_axi_arvalid;
  wire [1:0]s00_servo_axi_awaddr;
  wire s00_servo_axi_awvalid;
  wire s00_servo_axi_bready;
  wire s00_servo_axi_bvalid;
  wire [31:0]s00_servo_axi_rdata;
  wire s00_servo_axi_rready;
  wire s00_servo_axi_rvalid;
  wire [31:0]s00_servo_axi_wdata;
  wire [3:0]s00_servo_axi_wstrb;
  wire s00_servo_axi_wvalid;

  servo_axi_v1_0_0_servo_axi_v1_0_S00_servo_AXI servo_axi_v1_0_S00_servo_AXI_inst
       (.S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WREADY(S_AXI_WREADY),
        .Servo(Servo),
        .s00_servo_axi_aclk(s00_servo_axi_aclk),
        .s00_servo_axi_araddr(s00_servo_axi_araddr),
        .s00_servo_axi_aresetn(s00_servo_axi_aresetn),
        .s00_servo_axi_arvalid(s00_servo_axi_arvalid),
        .s00_servo_axi_awaddr(s00_servo_axi_awaddr),
        .s00_servo_axi_awvalid(s00_servo_axi_awvalid),
        .s00_servo_axi_bready(s00_servo_axi_bready),
        .s00_servo_axi_bvalid(s00_servo_axi_bvalid),
        .s00_servo_axi_rdata(s00_servo_axi_rdata),
        .s00_servo_axi_rready(s00_servo_axi_rready),
        .s00_servo_axi_rvalid(s00_servo_axi_rvalid),
        .s00_servo_axi_wdata(s00_servo_axi_wdata),
        .s00_servo_axi_wstrb(s00_servo_axi_wstrb),
        .s00_servo_axi_wvalid(s00_servo_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "servo_axi_v1_0_S00_servo_AXI" *) 
module servo_axi_v1_0_0_servo_axi_v1_0_S00_servo_AXI
   (S_AXI_AWREADY,
    Servo,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    s00_servo_axi_rdata,
    s00_servo_axi_rvalid,
    s00_servo_axi_bvalid,
    s00_servo_axi_aclk,
    s00_servo_axi_awaddr,
    s00_servo_axi_wvalid,
    s00_servo_axi_awvalid,
    s00_servo_axi_wdata,
    s00_servo_axi_araddr,
    s00_servo_axi_arvalid,
    s00_servo_axi_wstrb,
    s00_servo_axi_aresetn,
    s00_servo_axi_bready,
    s00_servo_axi_rready);
  output S_AXI_AWREADY;
  output Servo;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_servo_axi_rdata;
  output s00_servo_axi_rvalid;
  output s00_servo_axi_bvalid;
  input s00_servo_axi_aclk;
  input [1:0]s00_servo_axi_awaddr;
  input s00_servo_axi_wvalid;
  input s00_servo_axi_awvalid;
  input [31:0]s00_servo_axi_wdata;
  input [1:0]s00_servo_axi_araddr;
  input s00_servo_axi_arvalid;
  input [3:0]s00_servo_axi_wstrb;
  input s00_servo_axi_aresetn;
  input s00_servo_axi_bready;
  input s00_servo_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire Servo;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire clk10000hz;
  wire clockdivider_n_1;
  wire [1:0]p_0_in;
  wire [31:7]p_1_in;
  wire [31:0]reg_data_out;
  wire s00_servo_axi_aclk;
  wire [1:0]s00_servo_axi_araddr;
  wire s00_servo_axi_aresetn;
  wire s00_servo_axi_arvalid;
  wire [1:0]s00_servo_axi_awaddr;
  wire s00_servo_axi_awvalid;
  wire s00_servo_axi_bready;
  wire s00_servo_axi_bvalid;
  wire [31:0]s00_servo_axi_rdata;
  wire s00_servo_axi_rready;
  wire s00_servo_axi_rvalid;
  wire [31:0]s00_servo_axi_wdata;
  wire [3:0]s00_servo_axi_wstrb;
  wire s00_servo_axi_wvalid;
  wire [31:0]slv_reg0;
  wire \slv_reg0[15]_i_1_n_0 ;
  wire \slv_reg0[23]_i_1_n_0 ;
  wire \slv_reg0[31]_i_1_n_0 ;
  wire \slv_reg0[7]_i_1_n_0 ;
  wire [31:0]slv_reg1;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire [31:0]slv_reg2;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire [31:0]slv_reg3;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;

  LUT6 #(
    .INIT(64'hF7FFC4CCC4CCC4CC)) 
    aw_en_i_1
       (.I0(s00_servo_axi_awvalid),
        .I1(aw_en_reg_n_0),
        .I2(S_AXI_AWREADY),
        .I3(s00_servo_axi_wvalid),
        .I4(s00_servo_axi_bready),
        .I5(s00_servo_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(clockdivider_n_1));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_servo_axi_araddr[0]),
        .I1(s00_servo_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_servo_axi_araddr[1]),
        .I1(s00_servo_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(clockdivider_n_1));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(clockdivider_n_1));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_servo_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(clockdivider_n_1));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_servo_axi_awaddr[0]),
        .I1(s00_servo_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_servo_axi_awvalid),
        .I5(p_0_in[0]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_servo_axi_awaddr[1]),
        .I1(s00_servo_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_servo_axi_awvalid),
        .I5(p_0_in[1]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(p_0_in[0]),
        .R(clockdivider_n_1));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(p_0_in[1]),
        .R(clockdivider_n_1));
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready_i_1
       (.I0(s00_servo_axi_wvalid),
        .I1(S_AXI_AWREADY),
        .I2(aw_en_reg_n_0),
        .I3(s00_servo_axi_awvalid),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(S_AXI_AWREADY),
        .R(clockdivider_n_1));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_servo_axi_awvalid),
        .I1(s00_servo_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(S_AXI_WREADY),
        .I4(s00_servo_axi_bready),
        .I5(s00_servo_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_servo_axi_bvalid),
        .R(clockdivider_n_1));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[0]_i_1 
       (.I0(slv_reg1[0]),
        .I1(slv_reg0[0]),
        .I2(slv_reg3[0]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[0]),
        .O(reg_data_out[0]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[10]_i_1 
       (.I0(slv_reg1[10]),
        .I1(slv_reg0[10]),
        .I2(slv_reg3[10]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[10]),
        .O(reg_data_out[10]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[11]_i_1 
       (.I0(slv_reg1[11]),
        .I1(slv_reg0[11]),
        .I2(slv_reg3[11]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[11]),
        .O(reg_data_out[11]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[12]_i_1 
       (.I0(slv_reg1[12]),
        .I1(slv_reg0[12]),
        .I2(slv_reg3[12]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[12]),
        .O(reg_data_out[12]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[13]_i_1 
       (.I0(slv_reg1[13]),
        .I1(slv_reg0[13]),
        .I2(slv_reg3[13]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[13]),
        .O(reg_data_out[13]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[14]_i_1 
       (.I0(slv_reg1[14]),
        .I1(slv_reg0[14]),
        .I2(slv_reg3[14]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[14]),
        .O(reg_data_out[14]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[15]_i_1 
       (.I0(slv_reg1[15]),
        .I1(slv_reg0[15]),
        .I2(slv_reg3[15]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[15]),
        .O(reg_data_out[15]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[16]_i_1 
       (.I0(slv_reg1[16]),
        .I1(slv_reg0[16]),
        .I2(slv_reg3[16]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[16]),
        .O(reg_data_out[16]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[17]_i_1 
       (.I0(slv_reg1[17]),
        .I1(slv_reg0[17]),
        .I2(slv_reg3[17]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[17]),
        .O(reg_data_out[17]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[18]_i_1 
       (.I0(slv_reg1[18]),
        .I1(slv_reg0[18]),
        .I2(slv_reg3[18]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[18]),
        .O(reg_data_out[18]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[19]_i_1 
       (.I0(slv_reg1[19]),
        .I1(slv_reg0[19]),
        .I2(slv_reg3[19]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[19]),
        .O(reg_data_out[19]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[1]_i_1 
       (.I0(slv_reg1[1]),
        .I1(slv_reg0[1]),
        .I2(slv_reg3[1]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[1]),
        .O(reg_data_out[1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[20]_i_1 
       (.I0(slv_reg1[20]),
        .I1(slv_reg0[20]),
        .I2(slv_reg3[20]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[20]),
        .O(reg_data_out[20]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[21]_i_1 
       (.I0(slv_reg1[21]),
        .I1(slv_reg0[21]),
        .I2(slv_reg3[21]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[21]),
        .O(reg_data_out[21]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[22]_i_1 
       (.I0(slv_reg1[22]),
        .I1(slv_reg0[22]),
        .I2(slv_reg3[22]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[22]),
        .O(reg_data_out[22]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[23]_i_1 
       (.I0(slv_reg1[23]),
        .I1(slv_reg0[23]),
        .I2(slv_reg3[23]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[23]),
        .O(reg_data_out[23]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[24]_i_1 
       (.I0(slv_reg1[24]),
        .I1(slv_reg0[24]),
        .I2(slv_reg3[24]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[24]),
        .O(reg_data_out[24]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[25]_i_1 
       (.I0(slv_reg1[25]),
        .I1(slv_reg0[25]),
        .I2(slv_reg3[25]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[25]),
        .O(reg_data_out[25]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[26]_i_1 
       (.I0(slv_reg1[26]),
        .I1(slv_reg0[26]),
        .I2(slv_reg3[26]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[26]),
        .O(reg_data_out[26]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[27]_i_1 
       (.I0(slv_reg1[27]),
        .I1(slv_reg0[27]),
        .I2(slv_reg3[27]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[27]),
        .O(reg_data_out[27]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[28]_i_1 
       (.I0(slv_reg1[28]),
        .I1(slv_reg0[28]),
        .I2(slv_reg3[28]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[28]),
        .O(reg_data_out[28]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[29]_i_1 
       (.I0(slv_reg1[29]),
        .I1(slv_reg0[29]),
        .I2(slv_reg3[29]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[29]),
        .O(reg_data_out[29]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[2]_i_1 
       (.I0(slv_reg1[2]),
        .I1(slv_reg0[2]),
        .I2(slv_reg3[2]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[2]),
        .O(reg_data_out[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[30]_i_1 
       (.I0(slv_reg1[30]),
        .I1(slv_reg0[30]),
        .I2(slv_reg3[30]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[30]),
        .O(reg_data_out[30]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[31]_i_1 
       (.I0(slv_reg1[31]),
        .I1(slv_reg0[31]),
        .I2(slv_reg3[31]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[31]),
        .O(reg_data_out[31]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[3]_i_1 
       (.I0(slv_reg1[3]),
        .I1(slv_reg0[3]),
        .I2(slv_reg3[3]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[3]),
        .O(reg_data_out[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[4]_i_1 
       (.I0(slv_reg1[4]),
        .I1(slv_reg0[4]),
        .I2(slv_reg3[4]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[4]),
        .O(reg_data_out[4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[5]_i_1 
       (.I0(slv_reg1[5]),
        .I1(slv_reg0[5]),
        .I2(slv_reg3[5]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[5]),
        .O(reg_data_out[5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[6]_i_1 
       (.I0(slv_reg1[6]),
        .I1(slv_reg0[6]),
        .I2(slv_reg3[6]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[6]),
        .O(reg_data_out[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[7]_i_1 
       (.I0(slv_reg1[7]),
        .I1(slv_reg0[7]),
        .I2(slv_reg3[7]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[7]),
        .O(reg_data_out[7]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[8]_i_1 
       (.I0(slv_reg1[8]),
        .I1(slv_reg0[8]),
        .I2(slv_reg3[8]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[8]),
        .O(reg_data_out[8]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[9]_i_1 
       (.I0(slv_reg1[9]),
        .I1(slv_reg0[9]),
        .I2(slv_reg3[9]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[9]),
        .O(reg_data_out[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_servo_axi_rdata[0]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_servo_axi_rdata[10]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_servo_axi_rdata[11]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_servo_axi_rdata[12]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_servo_axi_rdata[13]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_servo_axi_rdata[14]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_servo_axi_rdata[15]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_servo_axi_rdata[16]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_servo_axi_rdata[17]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_servo_axi_rdata[18]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_servo_axi_rdata[19]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_servo_axi_rdata[1]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_servo_axi_rdata[20]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_servo_axi_rdata[21]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_servo_axi_rdata[22]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_servo_axi_rdata[23]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_servo_axi_rdata[24]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_servo_axi_rdata[25]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_servo_axi_rdata[26]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_servo_axi_rdata[27]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_servo_axi_rdata[28]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_servo_axi_rdata[29]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_servo_axi_rdata[2]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_servo_axi_rdata[30]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_servo_axi_rdata[31]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_servo_axi_rdata[3]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_servo_axi_rdata[4]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_servo_axi_rdata[5]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_servo_axi_rdata[6]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_servo_axi_rdata[7]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_servo_axi_rdata[8]),
        .R(clockdivider_n_1));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_servo_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_servo_axi_rdata[9]),
        .R(clockdivider_n_1));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(S_AXI_ARREADY),
        .I1(s00_servo_axi_arvalid),
        .I2(s00_servo_axi_rvalid),
        .I3(s00_servo_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_servo_axi_rvalid),
        .R(clockdivider_n_1));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    axi_wready_i_1
       (.I0(s00_servo_axi_awvalid),
        .I1(s00_servo_axi_wvalid),
        .I2(S_AXI_WREADY),
        .I3(aw_en_reg_n_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_servo_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(S_AXI_WREADY),
        .R(clockdivider_n_1));
  servo_axi_v1_0_0_clockdivider_10000hz clockdivider
       (.clk10000hz(clk10000hz),
        .s00_servo_axi_aclk(s00_servo_axi_aclk),
        .s00_servo_axi_aresetn(s00_servo_axi_aresetn),
        .s00_servo_axi_aresetn_0(clockdivider_n_1));
  servo_axi_v1_0_0_servo servo
       (.Q(slv_reg0[7:0]),
        .Servo(Servo),
        .Servo_reg_0(clockdivider_n_1),
        .clk10000hz(clk10000hz),
        .s00_servo_axi_aclk(s00_servo_axi_aclk));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_servo_axi_wstrb[1]),
        .O(\slv_reg0[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_servo_axi_wstrb[2]),
        .O(\slv_reg0[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_servo_axi_wstrb[3]),
        .O(\slv_reg0[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg0[31]_i_2 
       (.I0(S_AXI_WREADY),
        .I1(S_AXI_AWREADY),
        .I2(s00_servo_axi_awvalid),
        .I3(s00_servo_axi_wvalid),
        .O(slv_reg_wren__0));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_servo_axi_wstrb[0]),
        .O(\slv_reg0[7]_i_1_n_0 ));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[0]),
        .Q(slv_reg0[0]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[10]),
        .Q(slv_reg0[10]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[11]),
        .Q(slv_reg0[11]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[12]),
        .Q(slv_reg0[12]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[13]),
        .Q(slv_reg0[13]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[14]),
        .Q(slv_reg0[14]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[15]),
        .Q(slv_reg0[15]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[16]),
        .Q(slv_reg0[16]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[17]),
        .Q(slv_reg0[17]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[18]),
        .Q(slv_reg0[18]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[19]),
        .Q(slv_reg0[19]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[1]),
        .Q(slv_reg0[1]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[20]),
        .Q(slv_reg0[20]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[21]),
        .Q(slv_reg0[21]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[22]),
        .Q(slv_reg0[22]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[23]),
        .Q(slv_reg0[23]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[24]),
        .Q(slv_reg0[24]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[25]),
        .Q(slv_reg0[25]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[26]),
        .Q(slv_reg0[26]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[27]),
        .Q(slv_reg0[27]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[28]),
        .Q(slv_reg0[28]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[29]),
        .Q(slv_reg0[29]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[2]),
        .Q(slv_reg0[2]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[30]),
        .Q(slv_reg0[30]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[31]),
        .Q(slv_reg0[31]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[3]),
        .Q(slv_reg0[3]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[4]),
        .Q(slv_reg0[4]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[5]),
        .Q(slv_reg0[5]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[6]),
        .Q(slv_reg0[6]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[7]),
        .Q(slv_reg0[7]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[8]),
        .Q(slv_reg0[8]),
        .R(clockdivider_n_1));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[9]),
        .Q(slv_reg0[9]),
        .R(clockdivider_n_1));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_servo_axi_wstrb[1]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_servo_axi_wstrb[2]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_servo_axi_wstrb[3]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_servo_axi_wstrb[0]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[0]),
        .Q(slv_reg1[0]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[10]),
        .Q(slv_reg1[10]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[11]),
        .Q(slv_reg1[11]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[12]),
        .Q(slv_reg1[12]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[13]),
        .Q(slv_reg1[13]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[14]),
        .Q(slv_reg1[14]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[15]),
        .Q(slv_reg1[15]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[16]),
        .Q(slv_reg1[16]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[17]),
        .Q(slv_reg1[17]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[18]),
        .Q(slv_reg1[18]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[19]),
        .Q(slv_reg1[19]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[1]),
        .Q(slv_reg1[1]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[20]),
        .Q(slv_reg1[20]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[21]),
        .Q(slv_reg1[21]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[22]),
        .Q(slv_reg1[22]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[23]),
        .Q(slv_reg1[23]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[24]),
        .Q(slv_reg1[24]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[25]),
        .Q(slv_reg1[25]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[26]),
        .Q(slv_reg1[26]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[27]),
        .Q(slv_reg1[27]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[28]),
        .Q(slv_reg1[28]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[29]),
        .Q(slv_reg1[29]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[2]),
        .Q(slv_reg1[2]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[30]),
        .Q(slv_reg1[30]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[31]),
        .Q(slv_reg1[31]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[3]),
        .Q(slv_reg1[3]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[4]),
        .Q(slv_reg1[4]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[5]),
        .Q(slv_reg1[5]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[6]),
        .Q(slv_reg1[6]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[7]),
        .Q(slv_reg1[7]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[8]),
        .Q(slv_reg1[8]),
        .R(clockdivider_n_1));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[9]),
        .Q(slv_reg1[9]),
        .R(clockdivider_n_1));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_servo_axi_wstrb[1]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_servo_axi_wstrb[2]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_servo_axi_wstrb[3]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_servo_axi_wstrb[0]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[0]),
        .Q(slv_reg2[0]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[10]),
        .Q(slv_reg2[10]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[11]),
        .Q(slv_reg2[11]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[12]),
        .Q(slv_reg2[12]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[13]),
        .Q(slv_reg2[13]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[14]),
        .Q(slv_reg2[14]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[15]),
        .Q(slv_reg2[15]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[16]),
        .Q(slv_reg2[16]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[17]),
        .Q(slv_reg2[17]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[18]),
        .Q(slv_reg2[18]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[19]),
        .Q(slv_reg2[19]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[1]),
        .Q(slv_reg2[1]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[20]),
        .Q(slv_reg2[20]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[21]),
        .Q(slv_reg2[21]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[22]),
        .Q(slv_reg2[22]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[23]),
        .Q(slv_reg2[23]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[24]),
        .Q(slv_reg2[24]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[25]),
        .Q(slv_reg2[25]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[26]),
        .Q(slv_reg2[26]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[27]),
        .Q(slv_reg2[27]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[28]),
        .Q(slv_reg2[28]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[29]),
        .Q(slv_reg2[29]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[2]),
        .Q(slv_reg2[2]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[30]),
        .Q(slv_reg2[30]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[31]),
        .Q(slv_reg2[31]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[3]),
        .Q(slv_reg2[3]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[4]),
        .Q(slv_reg2[4]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[5]),
        .Q(slv_reg2[5]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[6]),
        .Q(slv_reg2[6]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[7]),
        .Q(slv_reg2[7]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[8]),
        .Q(slv_reg2[8]),
        .R(clockdivider_n_1));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_servo_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_servo_axi_wdata[9]),
        .Q(slv_reg2[9]),
        .R(clockdivider_n_1));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_servo_axi_wstrb[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_servo_axi_wstrb[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_servo_axi_wstrb[3]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_servo_axi_wstrb[0]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[7]));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_servo_axi_wdata[0]),
        .Q(slv_reg3[0]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_servo_axi_wdata[10]),
        .Q(slv_reg3[10]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_servo_axi_wdata[11]),
        .Q(slv_reg3[11]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_servo_axi_wdata[12]),
        .Q(slv_reg3[12]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_servo_axi_wdata[13]),
        .Q(slv_reg3[13]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_servo_axi_wdata[14]),
        .Q(slv_reg3[14]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_servo_axi_wdata[15]),
        .Q(slv_reg3[15]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_servo_axi_wdata[16]),
        .Q(slv_reg3[16]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_servo_axi_wdata[17]),
        .Q(slv_reg3[17]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_servo_axi_wdata[18]),
        .Q(slv_reg3[18]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_servo_axi_wdata[19]),
        .Q(slv_reg3[19]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_servo_axi_wdata[1]),
        .Q(slv_reg3[1]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_servo_axi_wdata[20]),
        .Q(slv_reg3[20]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_servo_axi_wdata[21]),
        .Q(slv_reg3[21]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_servo_axi_wdata[22]),
        .Q(slv_reg3[22]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_servo_axi_wdata[23]),
        .Q(slv_reg3[23]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_servo_axi_wdata[24]),
        .Q(slv_reg3[24]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_servo_axi_wdata[25]),
        .Q(slv_reg3[25]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_servo_axi_wdata[26]),
        .Q(slv_reg3[26]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_servo_axi_wdata[27]),
        .Q(slv_reg3[27]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_servo_axi_wdata[28]),
        .Q(slv_reg3[28]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_servo_axi_wdata[29]),
        .Q(slv_reg3[29]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_servo_axi_wdata[2]),
        .Q(slv_reg3[2]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_servo_axi_wdata[30]),
        .Q(slv_reg3[30]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_servo_axi_wdata[31]),
        .Q(slv_reg3[31]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_servo_axi_wdata[3]),
        .Q(slv_reg3[3]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_servo_axi_wdata[4]),
        .Q(slv_reg3[4]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_servo_axi_wdata[5]),
        .Q(slv_reg3[5]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_servo_axi_wdata[6]),
        .Q(slv_reg3[6]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_servo_axi_wdata[7]),
        .Q(slv_reg3[7]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_servo_axi_wdata[8]),
        .Q(slv_reg3[8]),
        .R(clockdivider_n_1));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_servo_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_servo_axi_wdata[9]),
        .Q(slv_reg3[9]),
        .R(clockdivider_n_1));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_servo_axi_arvalid),
        .I1(s00_servo_axi_rvalid),
        .I2(S_AXI_ARREADY),
        .O(slv_reg_rden__0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
