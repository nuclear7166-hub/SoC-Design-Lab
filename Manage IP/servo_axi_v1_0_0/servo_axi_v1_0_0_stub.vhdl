-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Mon Jun 15 09:11:48 2026
-- Host        : Woo running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/nucle/Desktop/AIoT/SoC/Manage
--               IP/servo_axi_v1_0_0/servo_axi_v1_0_0_stub.vhdl}
-- Design      : servo_axi_v1_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity servo_axi_v1_0_0 is
  Port ( 
    Servo : out STD_LOGIC;
    s00_servo_axi_aclk : in STD_LOGIC;
    s00_servo_axi_aresetn : in STD_LOGIC;
    s00_servo_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_servo_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_servo_axi_awvalid : in STD_LOGIC;
    s00_servo_axi_awready : out STD_LOGIC;
    s00_servo_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_servo_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_servo_axi_wvalid : in STD_LOGIC;
    s00_servo_axi_wready : out STD_LOGIC;
    s00_servo_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_servo_axi_bvalid : out STD_LOGIC;
    s00_servo_axi_bready : in STD_LOGIC;
    s00_servo_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_servo_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_servo_axi_arvalid : in STD_LOGIC;
    s00_servo_axi_arready : out STD_LOGIC;
    s00_servo_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_servo_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_servo_axi_rvalid : out STD_LOGIC;
    s00_servo_axi_rready : in STD_LOGIC
  );

end servo_axi_v1_0_0;

architecture stub of servo_axi_v1_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Servo,s00_servo_axi_aclk,s00_servo_axi_aresetn,s00_servo_axi_awaddr[3:0],s00_servo_axi_awprot[2:0],s00_servo_axi_awvalid,s00_servo_axi_awready,s00_servo_axi_wdata[31:0],s00_servo_axi_wstrb[3:0],s00_servo_axi_wvalid,s00_servo_axi_wready,s00_servo_axi_bresp[1:0],s00_servo_axi_bvalid,s00_servo_axi_bready,s00_servo_axi_araddr[3:0],s00_servo_axi_arprot[2:0],s00_servo_axi_arvalid,s00_servo_axi_arready,s00_servo_axi_rdata[31:0],s00_servo_axi_rresp[1:0],s00_servo_axi_rvalid,s00_servo_axi_rready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "servo_axi_v1_0,Vivado 2022.2";
begin
end;
