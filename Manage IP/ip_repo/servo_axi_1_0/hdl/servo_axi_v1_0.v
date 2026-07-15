
`timescale 1 ns / 1 ps

	module servo_axi_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_servo_AXI
		parameter integer C_S00_servo_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_servo_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
        output wire Servo,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_servo_AXI
		input wire  s00_servo_axi_aclk,
		input wire  s00_servo_axi_aresetn,
		input wire [C_S00_servo_AXI_ADDR_WIDTH-1 : 0] s00_servo_axi_awaddr,
		input wire [2 : 0] s00_servo_axi_awprot,
		input wire  s00_servo_axi_awvalid,
		output wire  s00_servo_axi_awready,
		input wire [C_S00_servo_AXI_DATA_WIDTH-1 : 0] s00_servo_axi_wdata,
		input wire [(C_S00_servo_AXI_DATA_WIDTH/8)-1 : 0] s00_servo_axi_wstrb,
		input wire  s00_servo_axi_wvalid,
		output wire  s00_servo_axi_wready,
		output wire [1 : 0] s00_servo_axi_bresp,
		output wire  s00_servo_axi_bvalid,
		input wire  s00_servo_axi_bready,
		input wire [C_S00_servo_AXI_ADDR_WIDTH-1 : 0] s00_servo_axi_araddr,
		input wire [2 : 0] s00_servo_axi_arprot,
		input wire  s00_servo_axi_arvalid,
		output wire  s00_servo_axi_arready,
		output wire [C_S00_servo_AXI_DATA_WIDTH-1 : 0] s00_servo_axi_rdata,
		output wire [1 : 0] s00_servo_axi_rresp,
		output wire  s00_servo_axi_rvalid,
		input wire  s00_servo_axi_rready
	);
// Instantiation of Axi Bus Interface S00_servo_AXI
	servo_axi_v1_0_S00_servo_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_servo_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_servo_AXI_ADDR_WIDTH)
	) servo_axi_v1_0_S00_servo_AXI_inst (
		.S_AXI_ACLK(s00_servo_axi_aclk),
		.S_AXI_ARESETN(s00_servo_axi_aresetn),
		.S_AXI_AWADDR(s00_servo_axi_awaddr),
		.S_AXI_AWPROT(s00_servo_axi_awprot),
		.S_AXI_AWVALID(s00_servo_axi_awvalid),
		.S_AXI_AWREADY(s00_servo_axi_awready),
		.S_AXI_WDATA(s00_servo_axi_wdata),
		.S_AXI_WSTRB(s00_servo_axi_wstrb),
		.S_AXI_WVALID(s00_servo_axi_wvalid),
		.S_AXI_WREADY(s00_servo_axi_wready),
		.S_AXI_BRESP(s00_servo_axi_bresp),
		.S_AXI_BVALID(s00_servo_axi_bvalid),
		.S_AXI_BREADY(s00_servo_axi_bready),
		.S_AXI_ARADDR(s00_servo_axi_araddr),
		.S_AXI_ARPROT(s00_servo_axi_arprot),
		.S_AXI_ARVALID(s00_servo_axi_arvalid),
		.S_AXI_ARREADY(s00_servo_axi_arready),
		.S_AXI_RDATA(s00_servo_axi_rdata),
		.S_AXI_RRESP(s00_servo_axi_rresp),
		.S_AXI_RVALID(s00_servo_axi_rvalid),
		.S_AXI_RREADY(s00_servo_axi_rready),
		.Servo(Servo)
	);

	// Add user logic here

	// User logic ends

	endmodule
