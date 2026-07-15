// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Jun 15 09:11:48 2026
// Host        : Woo running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/nucle/Desktop/AIoT/SoC/Manage
//               IP/servo_axi_v1_0_0/servo_axi_v1_0_0_stub.v}
// Design      : servo_axi_v1_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "servo_axi_v1_0,Vivado 2022.2" *)
module servo_axi_v1_0_0(Servo, s00_servo_axi_aclk, 
  s00_servo_axi_aresetn, s00_servo_axi_awaddr, s00_servo_axi_awprot, 
  s00_servo_axi_awvalid, s00_servo_axi_awready, s00_servo_axi_wdata, s00_servo_axi_wstrb, 
  s00_servo_axi_wvalid, s00_servo_axi_wready, s00_servo_axi_bresp, s00_servo_axi_bvalid, 
  s00_servo_axi_bready, s00_servo_axi_araddr, s00_servo_axi_arprot, 
  s00_servo_axi_arvalid, s00_servo_axi_arready, s00_servo_axi_rdata, s00_servo_axi_rresp, 
  s00_servo_axi_rvalid, s00_servo_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="Servo,s00_servo_axi_aclk,s00_servo_axi_aresetn,s00_servo_axi_awaddr[3:0],s00_servo_axi_awprot[2:0],s00_servo_axi_awvalid,s00_servo_axi_awready,s00_servo_axi_wdata[31:0],s00_servo_axi_wstrb[3:0],s00_servo_axi_wvalid,s00_servo_axi_wready,s00_servo_axi_bresp[1:0],s00_servo_axi_bvalid,s00_servo_axi_bready,s00_servo_axi_araddr[3:0],s00_servo_axi_arprot[2:0],s00_servo_axi_arvalid,s00_servo_axi_arready,s00_servo_axi_rdata[31:0],s00_servo_axi_rresp[1:0],s00_servo_axi_rvalid,s00_servo_axi_rready" */;
  output Servo;
  input s00_servo_axi_aclk;
  input s00_servo_axi_aresetn;
  input [3:0]s00_servo_axi_awaddr;
  input [2:0]s00_servo_axi_awprot;
  input s00_servo_axi_awvalid;
  output s00_servo_axi_awready;
  input [31:0]s00_servo_axi_wdata;
  input [3:0]s00_servo_axi_wstrb;
  input s00_servo_axi_wvalid;
  output s00_servo_axi_wready;
  output [1:0]s00_servo_axi_bresp;
  output s00_servo_axi_bvalid;
  input s00_servo_axi_bready;
  input [3:0]s00_servo_axi_araddr;
  input [2:0]s00_servo_axi_arprot;
  input s00_servo_axi_arvalid;
  output s00_servo_axi_arready;
  output [31:0]s00_servo_axi_rdata;
  output [1:0]s00_servo_axi_rresp;
  output s00_servo_axi_rvalid;
  input s00_servo_axi_rready;
endmodule
