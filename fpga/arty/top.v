//-----------------------------------------------------------------
// TOP
//-----------------------------------------------------------------
module top
(
    input                   clk100mhz,
    output [3:0]            led,
    output                  uart_rxd_out,
    input                   uart_txd_in,

    output                  qspi_sck,
    output                  qspi_cs,
    inout [3:0]             qspi_dq,

    // DDR3 SDRAM
    output  wire            ddr3_reset_n,
    output  wire    [0:0]   ddr3_cke,
    output  wire    [0:0]   ddr3_ck_p, 
    output  wire    [0:0]   ddr3_ck_n,
    output  wire    [0:0]   ddr3_cs_n,
    output  wire            ddr3_ras_n, 
    output  wire            ddr3_cas_n, 
    output  wire            ddr3_we_n,
    output  wire    [2:0]   ddr3_ba,
    output  wire    [13:0]  ddr3_addr,
    output  wire    [0:0]   ddr3_odt,
    output  wire    [1:0]   ddr3_dm,
    inout   wire    [1:0]   ddr3_dqs_p,
    inout   wire    [1:0]   ddr3_dqs_n,
    inout   wire    [15:0]  ddr3_dq  
);

//-----------------------------------------------------------------
// Implementation
//-----------------------------------------------------------------
wire           clk0;
wire           clk1;
wire           clk_w;
wire           clk_sys_w;
wire           rst_sys_w;

wire           axi_rvalid_w;
wire           axi_wlast_w;
wire           axi_rlast_w;
wire  [  3:0]  axi_arid_w;
wire  [  1:0]  axi_rresp_w;
wire           axi_wvalid_w;
wire  [  7:0]  axi_awlen_w;
wire  [  1:0]  axi_awburst_w;
wire  [  1:0]  axi_bresp_w;
wire  [ 31:0]  axi_rdata_w;
wire           axi_arready_w;
wire           axi_awvalid_w;
wire  [ 31:0]  axi_araddr_w;
wire  [  1:0]  axi_arburst_w;
wire           axi_wready_w;
wire  [  7:0]  axi_arlen_w;
wire           axi_awready_w;
wire  [  3:0]  axi_bid_w;
wire  [  3:0]  axi_wstrb_w;
wire  [  3:0]  axi_awid_w;
wire           axi_rready_w;
wire  [  3:0]  axi_rid_w;
wire           axi_arvalid_w;
wire  [ 31:0]  axi_awaddr_w;
wire           axi_bvalid_w;
wire           axi_bready_w;
wire  [ 31:0]  axi_wdata_w;

artix7_pll
u_pll
(
    .clkref_i(clk100mhz),
    .clkout0_o(clk0), // 100
    .clkout1_o(clk1), // 200
    .clkout2_o(clk_w) // 25
);

arty_ddr u_ddr
(
    // Inputs
     .clk100_i(clk0)
    ,.clk200_i(clk1)
    ,.inport_awvalid_i(axi_awvalid_w)
    ,.inport_awaddr_i(axi_awaddr_w)
    ,.inport_awid_i(axi_awid_w)
    ,.inport_awlen_i(axi_awlen_w)
    ,.inport_awburst_i(axi_awburst_w)
    ,.inport_wvalid_i(axi_wvalid_w)
    ,.inport_wdata_i(axi_wdata_w)
    ,.inport_wstrb_i(axi_wstrb_w)
    ,.inport_wlast_i(axi_wlast_w)
    ,.inport_bready_i(axi_bready_w)
    ,.inport_arvalid_i(axi_arvalid_w)
    ,.inport_araddr_i(axi_araddr_w)
    ,.inport_arid_i(axi_arid_w)
    ,.inport_arlen_i(axi_arlen_w)
    ,.inport_arburst_i(axi_arburst_w)
    ,.inport_rready_i(axi_rready_w)

    // Outputs
    ,.clk_out_o(clk_sys_w)
    ,.rst_out_o(rst_sys_w)
    ,.inport_awready_o(axi_awready_w)
    ,.inport_wready_o(axi_wready_w)
    ,.inport_bvalid_o(axi_bvalid_w)
    ,.inport_bresp_o(axi_bresp_w)
    ,.inport_bid_o(axi_bid_w)
    ,.inport_arready_o(axi_arready_w)
    ,.inport_rvalid_o(axi_rvalid_w)
    ,.inport_rdata_o(axi_rdata_w)
    ,.inport_rresp_o(axi_rresp_w)
    ,.inport_rid_o(axi_rid_w)
    ,.inport_rlast_o(axi_rlast_w)
    ,.ddr_ck_p_o(ddr3_ck_p)
    ,.ddr_ck_n_o(ddr3_ck_n)
    ,.ddr_cke_o(ddr3_cke)
    ,.ddr_reset_n_o(ddr3_reset_n)
    ,.ddr_ras_n_o(ddr3_ras_n)
    ,.ddr_cas_n_o(ddr3_cas_n)
    ,.ddr_we_n_o(ddr3_we_n)
    ,.ddr_cs_n_o(ddr3_cs_n)
    ,.ddr_ba_o(ddr3_ba)
    ,.ddr_addr_o(ddr3_addr)
    ,.ddr_odt_o(ddr3_odt)
    ,.ddr_dm_o(ddr3_dm)
    ,.ddr_dqs_p_io(ddr3_dqs_p)
    ,.ddr_dqs_n_io(ddr3_dqs_n)
    ,.ddr_data_io(ddr3_dq)
);


wire dbg_txd_w;
wire uart_txd_w;

fpga_top
u_top
(
    .clk_i(clk_w),
    .rst_i(rst_sys_w),

    .clk_sys_i(clk_sys_w),
    .rst_sys_i(rst_sys_w),

    // AXI
    .axi_awready_i(axi_awready_w),
    .axi_wready_i(axi_wready_w),
    .axi_bvalid_i(axi_bvalid_w),
    .axi_bresp_i(axi_bresp_w),
    .axi_bid_i(axi_bid_w),
    .axi_arready_i(axi_arready_w),
    .axi_rvalid_i(axi_rvalid_w),
    .axi_rdata_i(axi_rdata_w),
    .axi_rresp_i(axi_rresp_w),
    .axi_rid_i(axi_rid_w),
    .axi_rlast_i(axi_rlast_w),
    .axi_awvalid_o(axi_awvalid_w),
    .axi_awaddr_o(axi_awaddr_w),
    .axi_awid_o(axi_awid_w),
    .axi_awlen_o(axi_awlen_w),
    .axi_awburst_o(axi_awburst_w),
    .axi_wvalid_o(axi_wvalid_w),
    .axi_wdata_o(axi_wdata_w),
    .axi_wstrb_o(axi_wstrb_w),
    .axi_wlast_o(axi_wlast_w),
    .axi_bready_o(axi_bready_w),
    .axi_arvalid_o(axi_arvalid_w),
    .axi_araddr_o(axi_araddr_w),
    .axi_arid_o(axi_arid_w),
    .axi_arlen_o(axi_arlen_w),
    .axi_arburst_o(axi_arburst_w),
    .axi_rready_o(axi_rready_w),

    // SPI
    .spi_clk_o(),
    .spi_mosi_o(),
    .spi_cs_o(),
    .spi_miso_i(1'b0),

    // GPIO
    .gpio_output_o(),
    .gpio_output_enable_o(),
    .gpio_input_i(32'b0),

    // UART
    .dbg_rxd_o(dbg_txd_w),
    .dbg_txd_i(uart_txd_in),
    .uart_rxd_o(uart_txd_w),
    .uart_txd_i(uart_txd_in)
);

// Xilinx placement pragmas:
//synthesis attribute IOB of txd_q is "TRUE"
reg txd_q;

always @ (posedge clk_w or posedge rst_sys_w)
if (rst_sys_w)
    txd_q <= 1'b1;
else
    txd_q <= dbg_txd_w & uart_txd_w;

// 'OR' two UARTs together
assign uart_rxd_out  = txd_q;


assign led[0] = 1'b1;
assign led[1] = 1'b0;
assign led[2] = 1'b0;
assign led[3] = 1'b0;

assign qspi_dq[2] = 1'bz;
assign qspi_dq[3] = 1'bz;
assign qspi_dq[0] = 1'bz;
assign qspi_dq[1] = 1'bz;

assign qspi_sck = 1'b0;
assign qspi_cs = 1'b0;

endmodule
