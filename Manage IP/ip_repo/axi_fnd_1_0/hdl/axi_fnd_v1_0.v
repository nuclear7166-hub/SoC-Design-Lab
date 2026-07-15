
`timescale 1 ns / 1 ps

	module axi_fnd_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_fnd_AXI
		parameter integer C_S00_fnd_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_fnd_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
        output [7:0] fnd,
        output [3:0] fndsel,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_fnd_AXI
		input wire  s00_fnd_axi_aclk,
		input wire  s00_fnd_axi_aresetn,
		input wire [C_S00_fnd_AXI_ADDR_WIDTH-1 : 0] s00_fnd_axi_awaddr,
		input wire [2 : 0] s00_fnd_axi_awprot,
		input wire  s00_fnd_axi_awvalid,
		output wire  s00_fnd_axi_awready,
		input wire [C_S00_fnd_AXI_DATA_WIDTH-1 : 0] s00_fnd_axi_wdata,
		input wire [(C_S00_fnd_AXI_DATA_WIDTH/8)-1 : 0] s00_fnd_axi_wstrb,
		input wire  s00_fnd_axi_wvalid,
		output wire  s00_fnd_axi_wready,
		output wire [1 : 0] s00_fnd_axi_bresp,
		output wire  s00_fnd_axi_bvalid,
		input wire  s00_fnd_axi_bready,
		input wire [C_S00_fnd_AXI_ADDR_WIDTH-1 : 0] s00_fnd_axi_araddr,
		input wire [2 : 0] s00_fnd_axi_arprot,
		input wire  s00_fnd_axi_arvalid,
		output wire  s00_fnd_axi_arready,
		output wire [C_S00_fnd_AXI_DATA_WIDTH-1 : 0] s00_fnd_axi_rdata,
		output wire [1 : 0] s00_fnd_axi_rresp,
		output wire  s00_fnd_axi_rvalid,
		input wire  s00_fnd_axi_rready
	);
// Instantiation of Axi Bus Interface S00_fnd_AXI
	axi_fnd_v1_0_S00_fnd_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_fnd_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_fnd_AXI_ADDR_WIDTH)
	) axi_fnd_v1_0_S00_fnd_AXI_inst (
	    .data0(w_data0),
	    .data1(w_data1),
	    .data2(w_data2),
	    .data3(w_data3),
		.S_AXI_ACLK(s00_fnd_axi_aclk),
		.S_AXI_ARESETN(s00_fnd_axi_aresetn),
		.S_AXI_AWADDR(s00_fnd_axi_awaddr),
		.S_AXI_AWPROT(s00_fnd_axi_awprot),
		.S_AXI_AWVALID(s00_fnd_axi_awvalid),
		.S_AXI_AWREADY(s00_fnd_axi_awready),
		.S_AXI_WDATA(s00_fnd_axi_wdata),
		.S_AXI_WSTRB(s00_fnd_axi_wstrb),
		.S_AXI_WVALID(s00_fnd_axi_wvalid),
		.S_AXI_WREADY(s00_fnd_axi_wready),
		.S_AXI_BRESP(s00_fnd_axi_bresp),
		.S_AXI_BVALID(s00_fnd_axi_bvalid),
		.S_AXI_BREADY(s00_fnd_axi_bready),
		.S_AXI_ARADDR(s00_fnd_axi_araddr),
		.S_AXI_ARPROT(s00_fnd_axi_arprot),
		.S_AXI_ARVALID(s00_fnd_axi_arvalid),
		.S_AXI_ARREADY(s00_fnd_axi_arready),
		.S_AXI_RDATA(s00_fnd_axi_rdata),
		.S_AXI_RRESP(s00_fnd_axi_rresp),
		.S_AXI_RVALID(s00_fnd_axi_rvalid),
		.S_AXI_RREADY(s00_fnd_axi_rready)
	);

	// Add user logic here
    counter U0(
        .inclk(w_clkout),
        .reset(s00_fnd_axi_aresetn),
        .out_counter(w_counter)     );
        
        wire [1:0] w_counter;
        
    clockdivider U1(
        .clk(s00_fnd_axi_aclk),
        .reset(s00_fnd_axi_aresetn),
        .clk1000Hz(w_clkout)        );
        
        wire w_clkout;

    datamux4x1 U2(
        .ina(w_data0),
        .inb(w_data1),
        .inc(w_data2),
        .ind(w_data3),
        .insel(w_counter),
        .outy(w_datafnd)    );
        
    wire [3:0] w_data0;
    wire [3:0] w_data1;
    wire [3:0] w_data2;
    wire [3:0] w_data3;
    wire [3:0] w_datafnd;
    
    mux4x1 U3(
        .s(w_counter),
        .y(fndsel)      );
        
    fnddecoder U4(
        .a(w_datafnd),
        .fnd(fnd)       );
	// User logic ends

	endmodule
