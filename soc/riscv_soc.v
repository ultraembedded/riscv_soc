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

module riscv_soc
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input  [ 31:0]  reset_vector_i
    ,input           inport_awvalid_i
    ,input  [ 31:0]  inport_awaddr_i
    ,input           inport_wvalid_i
    ,input  [ 31:0]  inport_wdata_i
    ,input  [  3:0]  inport_wstrb_i
    ,input           inport_bready_i
    ,input           inport_arvalid_i
    ,input  [ 31:0]  inport_araddr_i
    ,input           inport_rready_i
    ,input           rst_cpu_i
    ,input           spi_miso_i
    ,input           uart_txd_i
    ,input  [ 31:0]  gpio_input_i
    ,input           mem_awready_i
    ,input           mem_wready_i
    ,input           mem_bvalid_i
    ,input  [  1:0]  mem_bresp_i
    ,input  [  3:0]  mem_bid_i
    ,input           mem_arready_i
    ,input           mem_rvalid_i
    ,input  [ 31:0]  mem_rdata_i
    ,input  [  1:0]  mem_rresp_i
    ,input  [  3:0]  mem_rid_i
    ,input           mem_rlast_i

    // Outputs
    ,output          inport_awready_o
    ,output          inport_wready_o
    ,output          inport_bvalid_o
    ,output [  1:0]  inport_bresp_o
    ,output          inport_arready_o
    ,output          inport_rvalid_o
    ,output [ 31:0]  inport_rdata_o
    ,output [  1:0]  inport_rresp_o
    ,output          spi_clk_o
    ,output          spi_mosi_o
    ,output          spi_cs_o
    ,output          uart_rxd_o
    ,output [ 31:0]  gpio_output_o
    ,output [ 31:0]  gpio_output_enable_o
    ,output          mem_awvalid_o
    ,output [ 31:0]  mem_awaddr_o
    ,output [  3:0]  mem_awid_o
    ,output [  7:0]  mem_awlen_o
    ,output [  1:0]  mem_awburst_o
    ,output          mem_wvalid_o
    ,output [ 31:0]  mem_wdata_o
    ,output [  3:0]  mem_wstrb_o
    ,output          mem_wlast_o
    ,output          mem_bready_o
    ,output          mem_arvalid_o
    ,output [ 31:0]  mem_araddr_o
    ,output [  3:0]  mem_arid_o
    ,output [  7:0]  mem_arlen_o
    ,output [  1:0]  mem_arburst_o
    ,output          mem_rready_o
);

wire  [  3:0]  axi4_conv_bid_w;
wire  [  3:0]  axi4_conv_wstrb_w;
wire  [  3:0]  axi4_d_awid_w;
wire  [  1:0]  axi4_conv_awburst_w;
wire           axi4_i_rvalid_w;
wire  [ 31:0]  axi4_i_awaddr_w;
wire           axi4_conv_wlast_w;
wire           axi4_conv_bready_w;
wire  [ 31:0]  axi4_d_rdata_w;
wire  [ 31:0]  axi4_d_awaddr_w;
wire  [  7:0]  axi4_conv_awlen_w;
wire           axi4_d_awvalid_w;
wire           axi4_i_arvalid_w;
wire  [  3:0]  axi4_i_wstrb_w;
wire  [ 31:0]  axi4_conv_araddr_w;
wire  [  7:0]  axi4_i_awlen_w;
wire  [  7:0]  axi4_d_arlen_w;
wire           axi4_conv_rready_w;
wire           axi4_d_rready_w;
wire           axi4_conv_wvalid_w;
wire  [  1:0]  axi4_d_awburst_w;
wire           axi4_i_wlast_w;
wire  [  1:0]  axi4_d_bresp_w;
wire           axi4_d_bvalid_w;
wire           axi4_i_bvalid_w;
wire           axi4_i_awvalid_w;
wire  [  1:0]  axi4_conv_arburst_w;
wire           irq_w;
wire           axi4_d_awready_w;
wire           axi4_i_rlast_w;
wire  [ 31:0]  axi4_i_wdata_w;
wire           axi4_conv_wready_w;
wire  [  3:0]  axi4_d_bid_w;
wire           axi4_conv_rvalid_w;
wire           axi4_conv_rlast_w;
wire           axi4_i_bready_w;
wire  [  1:0]  axi4_d_rresp_w;
wire           axi4_i_wready_w;
wire           axi4_conv_arready_w;
wire  [  3:0]  axi4_i_bid_w;
wire           axi4_i_wvalid_w;
wire           axi4_i_rready_w;
wire  [  3:0]  axi4_conv_awid_w;
wire           axi4_i_arready_w;
wire  [  1:0]  axi4_conv_bresp_w;
wire           axi4_conv_bvalid_w;
wire  [  1:0]  axi4_i_bresp_w;
wire  [  3:0]  axi4_i_arid_w;
wire  [ 31:0]  axi4_conv_rdata_w;
wire  [  3:0]  axi4_conv_arid_w;
wire           axi4_d_bready_w;
wire  [ 31:0]  axi4_d_wdata_w;
wire  [  1:0]  axi4_i_rresp_w;
wire  [  3:0]  axi4_d_wstrb_w;
wire  [  3:0]  axi4_conv_rid_w;
wire  [  1:0]  axi4_d_arburst_w;
wire  [  7:0]  axi4_i_arlen_w;
wire  [  7:0]  axi4_conv_arlen_w;
wire  [  3:0]  axi4_i_awid_w;
wire           axi4_conv_arvalid_w;
wire  [ 31:0]  axi4_d_araddr_w;
wire  [  1:0]  axi4_i_arburst_w;
wire           axi4_d_rvalid_w;
wire  [ 31:0]  axi4_i_araddr_w;
wire  [ 31:0]  axi4_conv_awaddr_w;
wire  [  3:0]  axi4_d_rid_w;
wire  [ 31:0]  axi4_conv_wdata_w;
wire           axi4_i_awready_w;
wire  [  3:0]  axi4_d_arid_w;
wire           axi4_d_arvalid_w;
wire  [  7:0]  axi4_d_awlen_w;
wire           axi4_d_arready_w;
wire           axi4_d_wready_w;
wire           axi4_d_rlast_w;
wire  [  1:0]  axi4_conv_rresp_w;
wire  [  1:0]  axi4_i_awburst_w;
wire           axi4_d_wvalid_w;
wire           axi4_conv_awvalid_w;
wire  [  3:0]  axi4_i_rid_w;
wire  [ 31:0]  axi4_i_rdata_w;
wire           axi4_conv_awready_w;
wire           axi4_d_wlast_w;


axi4lite_axi4_conv u_conv
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.inport_awvalid_i(inport_awvalid_i)
    ,.inport_awaddr_i(inport_awaddr_i)
    ,.inport_wvalid_i(inport_wvalid_i)
    ,.inport_wdata_i(inport_wdata_i)
    ,.inport_wstrb_i(inport_wstrb_i)
    ,.inport_bready_i(inport_bready_i)
    ,.inport_arvalid_i(inport_arvalid_i)
    ,.inport_araddr_i(inport_araddr_i)
    ,.inport_rready_i(inport_rready_i)
    ,.outport_awready_i(axi4_conv_awready_w)
    ,.outport_wready_i(axi4_conv_wready_w)
    ,.outport_bvalid_i(axi4_conv_bvalid_w)
    ,.outport_bresp_i(axi4_conv_bresp_w)
    ,.outport_bid_i(axi4_conv_bid_w)
    ,.outport_arready_i(axi4_conv_arready_w)
    ,.outport_rvalid_i(axi4_conv_rvalid_w)
    ,.outport_rdata_i(axi4_conv_rdata_w)
    ,.outport_rresp_i(axi4_conv_rresp_w)
    ,.outport_rid_i(axi4_conv_rid_w)
    ,.outport_rlast_i(axi4_conv_rlast_w)

    // Outputs
    ,.inport_awready_o(inport_awready_o)
    ,.inport_wready_o(inport_wready_o)
    ,.inport_bvalid_o(inport_bvalid_o)
    ,.inport_bresp_o(inport_bresp_o)
    ,.inport_arready_o(inport_arready_o)
    ,.inport_rvalid_o(inport_rvalid_o)
    ,.inport_rdata_o(inport_rdata_o)
    ,.inport_rresp_o(inport_rresp_o)
    ,.outport_awvalid_o(axi4_conv_awvalid_w)
    ,.outport_awaddr_o(axi4_conv_awaddr_w)
    ,.outport_awid_o(axi4_conv_awid_w)
    ,.outport_awlen_o(axi4_conv_awlen_w)
    ,.outport_awburst_o(axi4_conv_awburst_w)
    ,.outport_wvalid_o(axi4_conv_wvalid_w)
    ,.outport_wdata_o(axi4_conv_wdata_w)
    ,.outport_wstrb_o(axi4_conv_wstrb_w)
    ,.outport_wlast_o(axi4_conv_wlast_w)
    ,.outport_bready_o(axi4_conv_bready_w)
    ,.outport_arvalid_o(axi4_conv_arvalid_w)
    ,.outport_araddr_o(axi4_conv_araddr_w)
    ,.outport_arid_o(axi4_conv_arid_w)
    ,.outport_arlen_o(axi4_conv_arlen_w)
    ,.outport_arburst_o(axi4_conv_arburst_w)
    ,.outport_rready_o(axi4_conv_rready_w)
);


riscv_top u_core
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_cpu_i)
    ,.axi_i_awready_i(axi4_i_awready_w)
    ,.axi_i_wready_i(axi4_i_wready_w)
    ,.axi_i_bvalid_i(axi4_i_bvalid_w)
    ,.axi_i_bresp_i(axi4_i_bresp_w)
    ,.axi_i_bid_i(axi4_i_bid_w)
    ,.axi_i_arready_i(axi4_i_arready_w)
    ,.axi_i_rvalid_i(axi4_i_rvalid_w)
    ,.axi_i_rdata_i(axi4_i_rdata_w)
    ,.axi_i_rresp_i(axi4_i_rresp_w)
    ,.axi_i_rid_i(axi4_i_rid_w)
    ,.axi_i_rlast_i(axi4_i_rlast_w)
    ,.axi_d_awready_i(axi4_d_awready_w)
    ,.axi_d_wready_i(axi4_d_wready_w)
    ,.axi_d_bvalid_i(axi4_d_bvalid_w)
    ,.axi_d_bresp_i(axi4_d_bresp_w)
    ,.axi_d_bid_i(axi4_d_bid_w)
    ,.axi_d_arready_i(axi4_d_arready_w)
    ,.axi_d_rvalid_i(axi4_d_rvalid_w)
    ,.axi_d_rdata_i(axi4_d_rdata_w)
    ,.axi_d_rresp_i(axi4_d_rresp_w)
    ,.axi_d_rid_i(axi4_d_rid_w)
    ,.axi_d_rlast_i(axi4_d_rlast_w)
    ,.intr_i(irq_w)
    ,.reset_vector_i(reset_vector_i)

    // Outputs
    ,.axi_i_awvalid_o(axi4_i_awvalid_w)
    ,.axi_i_awaddr_o(axi4_i_awaddr_w)
    ,.axi_i_awid_o(axi4_i_awid_w)
    ,.axi_i_awlen_o(axi4_i_awlen_w)
    ,.axi_i_awburst_o(axi4_i_awburst_w)
    ,.axi_i_wvalid_o(axi4_i_wvalid_w)
    ,.axi_i_wdata_o(axi4_i_wdata_w)
    ,.axi_i_wstrb_o(axi4_i_wstrb_w)
    ,.axi_i_wlast_o(axi4_i_wlast_w)
    ,.axi_i_bready_o(axi4_i_bready_w)
    ,.axi_i_arvalid_o(axi4_i_arvalid_w)
    ,.axi_i_araddr_o(axi4_i_araddr_w)
    ,.axi_i_arid_o(axi4_i_arid_w)
    ,.axi_i_arlen_o(axi4_i_arlen_w)
    ,.axi_i_arburst_o(axi4_i_arburst_w)
    ,.axi_i_rready_o(axi4_i_rready_w)
    ,.axi_d_awvalid_o(axi4_d_awvalid_w)
    ,.axi_d_awaddr_o(axi4_d_awaddr_w)
    ,.axi_d_awid_o(axi4_d_awid_w)
    ,.axi_d_awlen_o(axi4_d_awlen_w)
    ,.axi_d_awburst_o(axi4_d_awburst_w)
    ,.axi_d_wvalid_o(axi4_d_wvalid_w)
    ,.axi_d_wdata_o(axi4_d_wdata_w)
    ,.axi_d_wstrb_o(axi4_d_wstrb_w)
    ,.axi_d_wlast_o(axi4_d_wlast_w)
    ,.axi_d_bready_o(axi4_d_bready_w)
    ,.axi_d_arvalid_o(axi4_d_arvalid_w)
    ,.axi_d_araddr_o(axi4_d_araddr_w)
    ,.axi_d_arid_o(axi4_d_arid_w)
    ,.axi_d_arlen_o(axi4_d_arlen_w)
    ,.axi_d_arburst_o(axi4_d_arburst_w)
    ,.axi_d_rready_o(axi4_d_rready_w)
);


soc u_soc
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.inport_awvalid_i(axi4_conv_awvalid_w)
    ,.inport_awaddr_i(axi4_conv_awaddr_w)
    ,.inport_awid_i(axi4_conv_awid_w)
    ,.inport_awlen_i(axi4_conv_awlen_w)
    ,.inport_awburst_i(axi4_conv_awburst_w)
    ,.inport_wvalid_i(axi4_conv_wvalid_w)
    ,.inport_wdata_i(axi4_conv_wdata_w)
    ,.inport_wstrb_i(axi4_conv_wstrb_w)
    ,.inport_wlast_i(axi4_conv_wlast_w)
    ,.inport_bready_i(axi4_conv_bready_w)
    ,.inport_arvalid_i(axi4_conv_arvalid_w)
    ,.inport_araddr_i(axi4_conv_araddr_w)
    ,.inport_arid_i(axi4_conv_arid_w)
    ,.inport_arlen_i(axi4_conv_arlen_w)
    ,.inport_arburst_i(axi4_conv_arburst_w)
    ,.inport_rready_i(axi4_conv_rready_w)
    ,.mem_awready_i(mem_awready_i)
    ,.mem_wready_i(mem_wready_i)
    ,.mem_bvalid_i(mem_bvalid_i)
    ,.mem_bresp_i(mem_bresp_i)
    ,.mem_bid_i(mem_bid_i)
    ,.mem_arready_i(mem_arready_i)
    ,.mem_rvalid_i(mem_rvalid_i)
    ,.mem_rdata_i(mem_rdata_i)
    ,.mem_rresp_i(mem_rresp_i)
    ,.mem_rid_i(mem_rid_i)
    ,.mem_rlast_i(mem_rlast_i)
    ,.cpu_i_awvalid_i(axi4_i_awvalid_w)
    ,.cpu_i_awaddr_i(axi4_i_awaddr_w)
    ,.cpu_i_awid_i(axi4_i_awid_w)
    ,.cpu_i_awlen_i(axi4_i_awlen_w)
    ,.cpu_i_awburst_i(axi4_i_awburst_w)
    ,.cpu_i_wvalid_i(axi4_i_wvalid_w)
    ,.cpu_i_wdata_i(axi4_i_wdata_w)
    ,.cpu_i_wstrb_i(axi4_i_wstrb_w)
    ,.cpu_i_wlast_i(axi4_i_wlast_w)
    ,.cpu_i_bready_i(axi4_i_bready_w)
    ,.cpu_i_arvalid_i(axi4_i_arvalid_w)
    ,.cpu_i_araddr_i(axi4_i_araddr_w)
    ,.cpu_i_arid_i(axi4_i_arid_w)
    ,.cpu_i_arlen_i(axi4_i_arlen_w)
    ,.cpu_i_arburst_i(axi4_i_arburst_w)
    ,.cpu_i_rready_i(axi4_i_rready_w)
    ,.cpu_d_awvalid_i(axi4_d_awvalid_w)
    ,.cpu_d_awaddr_i(axi4_d_awaddr_w)
    ,.cpu_d_awid_i(axi4_d_awid_w)
    ,.cpu_d_awlen_i(axi4_d_awlen_w)
    ,.cpu_d_awburst_i(axi4_d_awburst_w)
    ,.cpu_d_wvalid_i(axi4_d_wvalid_w)
    ,.cpu_d_wdata_i(axi4_d_wdata_w)
    ,.cpu_d_wstrb_i(axi4_d_wstrb_w)
    ,.cpu_d_wlast_i(axi4_d_wlast_w)
    ,.cpu_d_bready_i(axi4_d_bready_w)
    ,.cpu_d_arvalid_i(axi4_d_arvalid_w)
    ,.cpu_d_araddr_i(axi4_d_araddr_w)
    ,.cpu_d_arid_i(axi4_d_arid_w)
    ,.cpu_d_arlen_i(axi4_d_arlen_w)
    ,.cpu_d_arburst_i(axi4_d_arburst_w)
    ,.cpu_d_rready_i(axi4_d_rready_w)
    ,.spi_miso_i(spi_miso_i)
    ,.uart_txd_i(uart_txd_i)
    ,.gpio_input_i(gpio_input_i)

    // Outputs
    ,.intr_o(irq_w)
    ,.inport_awready_o(axi4_conv_awready_w)
    ,.inport_wready_o(axi4_conv_wready_w)
    ,.inport_bvalid_o(axi4_conv_bvalid_w)
    ,.inport_bresp_o(axi4_conv_bresp_w)
    ,.inport_bid_o(axi4_conv_bid_w)
    ,.inport_arready_o(axi4_conv_arready_w)
    ,.inport_rvalid_o(axi4_conv_rvalid_w)
    ,.inport_rdata_o(axi4_conv_rdata_w)
    ,.inport_rresp_o(axi4_conv_rresp_w)
    ,.inport_rid_o(axi4_conv_rid_w)
    ,.inport_rlast_o(axi4_conv_rlast_w)
    ,.mem_awvalid_o(mem_awvalid_o)
    ,.mem_awaddr_o(mem_awaddr_o)
    ,.mem_awid_o(mem_awid_o)
    ,.mem_awlen_o(mem_awlen_o)
    ,.mem_awburst_o(mem_awburst_o)
    ,.mem_wvalid_o(mem_wvalid_o)
    ,.mem_wdata_o(mem_wdata_o)
    ,.mem_wstrb_o(mem_wstrb_o)
    ,.mem_wlast_o(mem_wlast_o)
    ,.mem_bready_o(mem_bready_o)
    ,.mem_arvalid_o(mem_arvalid_o)
    ,.mem_araddr_o(mem_araddr_o)
    ,.mem_arid_o(mem_arid_o)
    ,.mem_arlen_o(mem_arlen_o)
    ,.mem_arburst_o(mem_arburst_o)
    ,.mem_rready_o(mem_rready_o)
    ,.cpu_i_awready_o(axi4_i_awready_w)
    ,.cpu_i_wready_o(axi4_i_wready_w)
    ,.cpu_i_bvalid_o(axi4_i_bvalid_w)
    ,.cpu_i_bresp_o(axi4_i_bresp_w)
    ,.cpu_i_bid_o(axi4_i_bid_w)
    ,.cpu_i_arready_o(axi4_i_arready_w)
    ,.cpu_i_rvalid_o(axi4_i_rvalid_w)
    ,.cpu_i_rdata_o(axi4_i_rdata_w)
    ,.cpu_i_rresp_o(axi4_i_rresp_w)
    ,.cpu_i_rid_o(axi4_i_rid_w)
    ,.cpu_i_rlast_o(axi4_i_rlast_w)
    ,.cpu_d_awready_o(axi4_d_awready_w)
    ,.cpu_d_wready_o(axi4_d_wready_w)
    ,.cpu_d_bvalid_o(axi4_d_bvalid_w)
    ,.cpu_d_bresp_o(axi4_d_bresp_w)
    ,.cpu_d_bid_o(axi4_d_bid_w)
    ,.cpu_d_arready_o(axi4_d_arready_w)
    ,.cpu_d_rvalid_o(axi4_d_rvalid_w)
    ,.cpu_d_rdata_o(axi4_d_rdata_w)
    ,.cpu_d_rresp_o(axi4_d_rresp_w)
    ,.cpu_d_rid_o(axi4_d_rid_w)
    ,.cpu_d_rlast_o(axi4_d_rlast_w)
    ,.spi_clk_o(spi_clk_o)
    ,.spi_mosi_o(spi_mosi_o)
    ,.spi_cs_o(spi_cs_o)
    ,.uart_rxd_o(uart_rxd_o)
    ,.gpio_output_o(gpio_output_o)
    ,.gpio_output_enable_o(gpio_output_enable_o)
);



endmodule
