//-----------------------------------------------------------------
//                        RISC-V Test SoC
//                            V0.1
//                     Ultra-Embedded.com
//                     Copyright 2014-2019
//
//                   admin@ultra-embedded.com
//
//                       License: BSD
//-----------------------------------------------------------------
//
// Copyright (c) 2014-2019, Ultra-Embedded.com
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions 
// are met:
//   - Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
//   - Redistributions in binary form must reproduce the above copyright
//     notice, this list of conditions and the following disclaimer 
//     in the documentation and/or other materials provided with the 
//     distribution.
//   - Neither the name of the author nor the names of its contributors 
//     may be used to endorse or promote products derived from this 
//     software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE 
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF 
// SUCH DAMAGE.
//-----------------------------------------------------------------

//-----------------------------------------------------------------
//                          Generated File
//-----------------------------------------------------------------

module fpga_top
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           clk_sys_i
    ,input           rst_sys_i
    ,input           axi_awready_i
    ,input           axi_wready_i
    ,input           axi_bvalid_i
    ,input  [  1:0]  axi_bresp_i
    ,input  [  3:0]  axi_bid_i
    ,input           axi_arready_i
    ,input           axi_rvalid_i
    ,input  [ 31:0]  axi_rdata_i
    ,input  [  1:0]  axi_rresp_i
    ,input  [  3:0]  axi_rid_i
    ,input           axi_rlast_i
    ,input           dbg_txd_i
    ,input           spi_miso_i
    ,input           uart_txd_i
    ,input  [ 31:0]  gpio_input_i

    // Outputs
    ,output          axi_awvalid_o
    ,output [ 31:0]  axi_awaddr_o
    ,output [  3:0]  axi_awid_o
    ,output [  7:0]  axi_awlen_o
    ,output [  1:0]  axi_awburst_o
    ,output          axi_wvalid_o
    ,output [ 31:0]  axi_wdata_o
    ,output [  3:0]  axi_wstrb_o
    ,output          axi_wlast_o
    ,output          axi_bready_o
    ,output          axi_arvalid_o
    ,output [ 31:0]  axi_araddr_o
    ,output [  3:0]  axi_arid_o
    ,output [  7:0]  axi_arlen_o
    ,output [  1:0]  axi_arburst_o
    ,output          axi_rready_o
    ,output          dbg_rxd_o
    ,output          spi_clk_o
    ,output          spi_mosi_o
    ,output          spi_cs_o
    ,output          uart_rxd_o
    ,output [ 31:0]  gpio_output_o
    ,output [ 31:0]  gpio_output_enable_o
);

wire  [  3:0]  axi_dbg_wstrb_w;
wire  [ 31:0]  axi_cdc_wr_araddr_w;
wire           axi_dbg_rready_w;
wire  [  3:0]  axi_cdc_wr_rid_w;
wire  [ 31:0]  axi_dbg_wdata_w;
wire  [ 31:0]  axi_dbg_rdata_w;
wire           axi_cdc_wr_rlast_w;
wire  [  1:0]  axi_cdc_wr_awburst_w;
wire  [  3:0]  axi_cdc_wr_arid_w;
wire           axi_cdc_wr_awvalid_w;
wire  [ 31:0]  axi_dbg_awaddr_w;
wire  [  7:0]  axi_cdc_wr_arlen_w;
wire  [ 31:0]  axi_cdc_wr_awaddr_w;
wire           axi_dbg_awvalid_w;
wire           axi_dbg_arvalid_w;
wire  [  7:0]  axi_cdc_wr_awlen_w;
wire  [  1:0]  axi_dbg_bresp_w;
wire  [  3:0]  axi_cdc_wr_bid_w;
wire           axi_dbg_wvalid_w;
wire           axi_cdc_wr_bvalid_w;
wire  [ 31:0]  axi_dbg_araddr_w;
wire           axi_cdc_wr_arready_w;
wire  [ 31:0]  enable_w;
wire           axi_cdc_wr_rready_w;
wire  [  1:0]  axi_cdc_wr_bresp_w;
wire  [  1:0]  axi_dbg_rresp_w;
wire  [ 31:0]  reset_vector_w = 32'h80000000;
wire  [ 31:0]  axi_cdc_wr_rdata_w;
wire           axi_dbg_rvalid_w;
wire  [  1:0]  axi_cdc_wr_rresp_w;
wire           axi_dbg_awready_w;
wire  [  3:0]  axi_cdc_wr_wstrb_w;
wire  [  1:0]  axi_cdc_wr_arburst_w;
wire           axi_cdc_wr_arvalid_w;
wire           axi_dbg_arready_w;
wire           axi_dbg_bvalid_w;
wire           axi_cdc_wr_wready_w;
wire  [ 31:0]  axi_cdc_wr_wdata_w;
wire  [  3:0]  axi_cdc_wr_awid_w;
wire           axi_cdc_wr_wlast_w;
wire           axi_cdc_wr_rvalid_w;
wire           axi_cdc_wr_wvalid_w;
wire           axi_cdc_wr_awready_w;
wire           rst_cpu_w;
wire           axi_cdc_wr_bready_w;
wire           axi_dbg_wready_w;
wire           axi_dbg_bready_w;


dbg_bridge u_dbg
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.uart_rxd_i(dbg_txd_i)
    ,.mem_awready_i(axi_dbg_awready_w)
    ,.mem_wready_i(axi_dbg_wready_w)
    ,.mem_bvalid_i(axi_dbg_bvalid_w)
    ,.mem_bresp_i(axi_dbg_bresp_w)
    ,.mem_arready_i(axi_dbg_arready_w)
    ,.mem_rvalid_i(axi_dbg_rvalid_w)
    ,.mem_rdata_i(axi_dbg_rdata_w)
    ,.mem_rresp_i(axi_dbg_rresp_w)
    ,.gpio_inputs_i(32'b0)

    // Outputs
    ,.uart_txd_o(dbg_rxd_o)
    ,.mem_awvalid_o(axi_dbg_awvalid_w)
    ,.mem_awaddr_o(axi_dbg_awaddr_w)
    ,.mem_wvalid_o(axi_dbg_wvalid_w)
    ,.mem_wdata_o(axi_dbg_wdata_w)
    ,.mem_wstrb_o(axi_dbg_wstrb_w)
    ,.mem_bready_o(axi_dbg_bready_w)
    ,.mem_arvalid_o(axi_dbg_arvalid_w)
    ,.mem_araddr_o(axi_dbg_araddr_w)
    ,.mem_rready_o(axi_dbg_rready_w)
    ,.gpio_outputs_o(enable_w)
);


axi4_cdc u_cdc
(
    // Inputs
     .wr_clk_i(clk_i)
    ,.wr_rst_i(rst_i)
    ,.inport_awvalid_i(axi_cdc_wr_awvalid_w)
    ,.inport_awaddr_i(axi_cdc_wr_awaddr_w)
    ,.inport_awid_i(axi_cdc_wr_awid_w)
    ,.inport_awlen_i(axi_cdc_wr_awlen_w)
    ,.inport_awburst_i(axi_cdc_wr_awburst_w)
    ,.inport_wvalid_i(axi_cdc_wr_wvalid_w)
    ,.inport_wdata_i(axi_cdc_wr_wdata_w)
    ,.inport_wstrb_i(axi_cdc_wr_wstrb_w)
    ,.inport_wlast_i(axi_cdc_wr_wlast_w)
    ,.inport_bready_i(axi_cdc_wr_bready_w)
    ,.inport_arvalid_i(axi_cdc_wr_arvalid_w)
    ,.inport_araddr_i(axi_cdc_wr_araddr_w)
    ,.inport_arid_i(axi_cdc_wr_arid_w)
    ,.inport_arlen_i(axi_cdc_wr_arlen_w)
    ,.inport_arburst_i(axi_cdc_wr_arburst_w)
    ,.inport_rready_i(axi_cdc_wr_rready_w)
    ,.rd_clk_i(clk_sys_i)
    ,.rd_rst_i(rst_sys_i)
    ,.outport_awready_i(axi_awready_i)
    ,.outport_wready_i(axi_wready_i)
    ,.outport_bvalid_i(axi_bvalid_i)
    ,.outport_bresp_i(axi_bresp_i)
    ,.outport_bid_i(axi_bid_i)
    ,.outport_arready_i(axi_arready_i)
    ,.outport_rvalid_i(axi_rvalid_i)
    ,.outport_rdata_i(axi_rdata_i)
    ,.outport_rresp_i(axi_rresp_i)
    ,.outport_rid_i(axi_rid_i)
    ,.outport_rlast_i(axi_rlast_i)

    // Outputs
    ,.inport_awready_o(axi_cdc_wr_awready_w)
    ,.inport_wready_o(axi_cdc_wr_wready_w)
    ,.inport_bvalid_o(axi_cdc_wr_bvalid_w)
    ,.inport_bresp_o(axi_cdc_wr_bresp_w)
    ,.inport_bid_o(axi_cdc_wr_bid_w)
    ,.inport_arready_o(axi_cdc_wr_arready_w)
    ,.inport_rvalid_o(axi_cdc_wr_rvalid_w)
    ,.inport_rdata_o(axi_cdc_wr_rdata_w)
    ,.inport_rresp_o(axi_cdc_wr_rresp_w)
    ,.inport_rid_o(axi_cdc_wr_rid_w)
    ,.inport_rlast_o(axi_cdc_wr_rlast_w)
    ,.outport_awvalid_o(axi_awvalid_o)
    ,.outport_awaddr_o(axi_awaddr_o)
    ,.outport_awid_o(axi_awid_o)
    ,.outport_awlen_o(axi_awlen_o)
    ,.outport_awburst_o(axi_awburst_o)
    ,.outport_wvalid_o(axi_wvalid_o)
    ,.outport_wdata_o(axi_wdata_o)
    ,.outport_wstrb_o(axi_wstrb_o)
    ,.outport_wlast_o(axi_wlast_o)
    ,.outport_bready_o(axi_bready_o)
    ,.outport_arvalid_o(axi_arvalid_o)
    ,.outport_araddr_o(axi_araddr_o)
    ,.outport_arid_o(axi_arid_o)
    ,.outport_arlen_o(axi_arlen_o)
    ,.outport_arburst_o(axi_arburst_o)
    ,.outport_rready_o(axi_rready_o)
);


riscv_soc u_soc
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.reset_vector_i(reset_vector_w)
    ,.inport_awvalid_i(axi_dbg_awvalid_w)
    ,.inport_awaddr_i(axi_dbg_awaddr_w)
    ,.inport_wvalid_i(axi_dbg_wvalid_w)
    ,.inport_wdata_i(axi_dbg_wdata_w)
    ,.inport_wstrb_i(axi_dbg_wstrb_w)
    ,.inport_bready_i(axi_dbg_bready_w)
    ,.inport_arvalid_i(axi_dbg_arvalid_w)
    ,.inport_araddr_i(axi_dbg_araddr_w)
    ,.inport_rready_i(axi_dbg_rready_w)
    ,.rst_cpu_i(rst_cpu_w)
    ,.spi_miso_i(spi_miso_i)
    ,.uart_txd_i(uart_txd_i)
    ,.gpio_input_i(gpio_input_i)
    ,.mem_awready_i(axi_cdc_wr_awready_w)
    ,.mem_wready_i(axi_cdc_wr_wready_w)
    ,.mem_bvalid_i(axi_cdc_wr_bvalid_w)
    ,.mem_bresp_i(axi_cdc_wr_bresp_w)
    ,.mem_bid_i(axi_cdc_wr_bid_w)
    ,.mem_arready_i(axi_cdc_wr_arready_w)
    ,.mem_rvalid_i(axi_cdc_wr_rvalid_w)
    ,.mem_rdata_i(axi_cdc_wr_rdata_w)
    ,.mem_rresp_i(axi_cdc_wr_rresp_w)
    ,.mem_rid_i(axi_cdc_wr_rid_w)
    ,.mem_rlast_i(axi_cdc_wr_rlast_w)

    // Outputs
    ,.inport_awready_o(axi_dbg_awready_w)
    ,.inport_wready_o(axi_dbg_wready_w)
    ,.inport_bvalid_o(axi_dbg_bvalid_w)
    ,.inport_bresp_o(axi_dbg_bresp_w)
    ,.inport_arready_o(axi_dbg_arready_w)
    ,.inport_rvalid_o(axi_dbg_rvalid_w)
    ,.inport_rdata_o(axi_dbg_rdata_w)
    ,.inport_rresp_o(axi_dbg_rresp_w)
    ,.spi_clk_o(spi_clk_o)
    ,.spi_mosi_o(spi_mosi_o)
    ,.spi_cs_o(spi_cs_o)
    ,.uart_rxd_o(uart_rxd_o)
    ,.gpio_output_o(gpio_output_o)
    ,.gpio_output_enable_o(gpio_output_enable_o)
    ,.mem_awvalid_o(axi_cdc_wr_awvalid_w)
    ,.mem_awaddr_o(axi_cdc_wr_awaddr_w)
    ,.mem_awid_o(axi_cdc_wr_awid_w)
    ,.mem_awlen_o(axi_cdc_wr_awlen_w)
    ,.mem_awburst_o(axi_cdc_wr_awburst_w)
    ,.mem_wvalid_o(axi_cdc_wr_wvalid_w)
    ,.mem_wdata_o(axi_cdc_wr_wdata_w)
    ,.mem_wstrb_o(axi_cdc_wr_wstrb_w)
    ,.mem_wlast_o(axi_cdc_wr_wlast_w)
    ,.mem_bready_o(axi_cdc_wr_bready_w)
    ,.mem_arvalid_o(axi_cdc_wr_arvalid_w)
    ,.mem_araddr_o(axi_cdc_wr_araddr_w)
    ,.mem_arid_o(axi_cdc_wr_arid_w)
    ,.mem_arlen_o(axi_cdc_wr_arlen_w)
    ,.mem_arburst_o(axi_cdc_wr_arburst_w)
    ,.mem_rready_o(axi_cdc_wr_rready_w)
);


//-------------------------------------------------------------
// Debug
//-------------------------------------------------------------
`define DBG_BIT_RELEASE_RESET 0
`define DBG_BIT_ENABLE_DEBUG  1
`define DBG_BIT_CAPTURE_HI    2
`define DBG_BIT_CAPTURE_LO    3
`define DBG_BIT_DEBUG_WRITE   4


assign rst_cpu_w       = ~enable_w[`DBG_BIT_RELEASE_RESET];


endmodule
