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

module soc
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           inport_awvalid_i
    ,input  [ 31:0]  inport_awaddr_i
    ,input  [  3:0]  inport_awid_i
    ,input  [  7:0]  inport_awlen_i
    ,input  [  1:0]  inport_awburst_i
    ,input           inport_wvalid_i
    ,input  [ 31:0]  inport_wdata_i
    ,input  [  3:0]  inport_wstrb_i
    ,input           inport_wlast_i
    ,input           inport_bready_i
    ,input           inport_arvalid_i
    ,input  [ 31:0]  inport_araddr_i
    ,input  [  3:0]  inport_arid_i
    ,input  [  7:0]  inport_arlen_i
    ,input  [  1:0]  inport_arburst_i
    ,input           inport_rready_i
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
    ,input           cpu_i_awvalid_i
    ,input  [ 31:0]  cpu_i_awaddr_i
    ,input  [  3:0]  cpu_i_awid_i
    ,input  [  7:0]  cpu_i_awlen_i
    ,input  [  1:0]  cpu_i_awburst_i
    ,input           cpu_i_wvalid_i
    ,input  [ 31:0]  cpu_i_wdata_i
    ,input  [  3:0]  cpu_i_wstrb_i
    ,input           cpu_i_wlast_i
    ,input           cpu_i_bready_i
    ,input           cpu_i_arvalid_i
    ,input  [ 31:0]  cpu_i_araddr_i
    ,input  [  3:0]  cpu_i_arid_i
    ,input  [  7:0]  cpu_i_arlen_i
    ,input  [  1:0]  cpu_i_arburst_i
    ,input           cpu_i_rready_i
    ,input           cpu_d_awvalid_i
    ,input  [ 31:0]  cpu_d_awaddr_i
    ,input  [  3:0]  cpu_d_awid_i
    ,input  [  7:0]  cpu_d_awlen_i
    ,input  [  1:0]  cpu_d_awburst_i
    ,input           cpu_d_wvalid_i
    ,input  [ 31:0]  cpu_d_wdata_i
    ,input  [  3:0]  cpu_d_wstrb_i
    ,input           cpu_d_wlast_i
    ,input           cpu_d_bready_i
    ,input           cpu_d_arvalid_i
    ,input  [ 31:0]  cpu_d_araddr_i
    ,input  [  3:0]  cpu_d_arid_i
    ,input  [  7:0]  cpu_d_arlen_i
    ,input  [  1:0]  cpu_d_arburst_i
    ,input           cpu_d_rready_i
    ,input           spi_miso_i
    ,input           uart_txd_i
    ,input  [ 31:0]  gpio_input_i

    // Outputs
    ,output          intr_o
    ,output          inport_awready_o
    ,output          inport_wready_o
    ,output          inport_bvalid_o
    ,output [  1:0]  inport_bresp_o
    ,output [  3:0]  inport_bid_o
    ,output          inport_arready_o
    ,output          inport_rvalid_o
    ,output [ 31:0]  inport_rdata_o
    ,output [  1:0]  inport_rresp_o
    ,output [  3:0]  inport_rid_o
    ,output          inport_rlast_o
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
    ,output          cpu_i_awready_o
    ,output          cpu_i_wready_o
    ,output          cpu_i_bvalid_o
    ,output [  1:0]  cpu_i_bresp_o
    ,output [  3:0]  cpu_i_bid_o
    ,output          cpu_i_arready_o
    ,output          cpu_i_rvalid_o
    ,output [ 31:0]  cpu_i_rdata_o
    ,output [  1:0]  cpu_i_rresp_o
    ,output [  3:0]  cpu_i_rid_o
    ,output          cpu_i_rlast_o
    ,output          cpu_d_awready_o
    ,output          cpu_d_wready_o
    ,output          cpu_d_bvalid_o
    ,output [  1:0]  cpu_d_bresp_o
    ,output [  3:0]  cpu_d_bid_o
    ,output          cpu_d_arready_o
    ,output          cpu_d_rvalid_o
    ,output [ 31:0]  cpu_d_rdata_o
    ,output [  1:0]  cpu_d_rresp_o
    ,output [  3:0]  cpu_d_rid_o
    ,output          cpu_d_rlast_o
    ,output          spi_clk_o
    ,output          spi_mosi_o
    ,output          spi_cs_o
    ,output          uart_rxd_o
    ,output [ 31:0]  gpio_output_o
    ,output [ 31:0]  gpio_output_enable_o
);

wire  [  3:0]  axi_retime_arid_w;
wire           axi_arb_out_arvalid_w;
wire           axi_retime_arvalid_w;
wire           axi_tap_output2_wvalid_w;
wire           axi_arb_out_rready_w;
wire           axi_arb_out_wvalid_w;
wire           axi_tap_output0_awready_w;
wire  [  3:0]  axi_arb_out_arid_w;
wire  [ 31:0]  axi_tap_output3_wdata_w;
wire           axi_tap_output2_arvalid_w;
wire  [  3:0]  axi_retime_wstrb_w;
wire  [  3:0]  axi_arb_out_bid_w;
wire           axi_tap_output2_rvalid_w;
wire           axi_tap_output3_wready_w;
wire  [ 31:0]  axi_tap_output0_araddr_w;
wire           axi_tap_output4_awready_w;
wire           axi_tap_output4_wvalid_w;
wire           axi_tap_output3_wvalid_w;
wire  [  3:0]  axi_tap_output3_wstrb_w;
wire           axi_arb_out_awready_w;
wire           axi_arb_out_wready_w;
wire           axi_retime_wready_w;
wire           axi_arb_out_bready_w;
wire           axi_tap_output0_arready_w;
wire           axi_arb_out_wlast_w;
wire  [ 31:0]  axi_tap_output4_awaddr_w;
wire           axi_tap_output4_arvalid_w;
wire           axi_tap_output3_arready_w;
wire           axi_retime_wlast_w;
wire  [  7:0]  axi_arb_out_awlen_w;
wire           axi_tap_output3_bvalid_w;
wire           axi_tap_output1_awready_w;
wire           axi_retime_awvalid_w;
wire           axi_tap_output4_awvalid_w;
wire  [  1:0]  axi_tap_output2_rresp_w;
wire  [  1:0]  axi_arb_out_awburst_w;
wire           axi_tap_output1_arvalid_w;
wire  [  3:0]  axi_arb_out_rid_w;
wire  [  1:0]  axi_arb_out_bresp_w;
wire  [  1:0]  axi_tap_output3_bresp_w;
wire  [  1:0]  axi_tap_output2_bresp_w;
wire  [  1:0]  axi_retime_arburst_w;
wire  [ 31:0]  axi_tap_output3_awaddr_w;
wire  [ 31:0]  axi_retime_rdata_w;
wire           axi_tap_output2_arready_w;
wire  [ 31:0]  axi_tap_output4_rdata_w;
wire           axi_tap_output4_arready_w;
wire  [  1:0]  axi_tap_output0_bresp_w;
wire           axi_retime_bvalid_w;
wire  [  1:0]  axi_tap_output4_bresp_w;
wire           axi_tap_output1_bready_w;
wire           axi_tap_output0_bready_w;
wire           axi_retime_awready_w;
wire           axi_tap_output1_awvalid_w;
wire           axi_retime_rlast_w;
wire  [ 31:0]  axi_arb_out_araddr_w;
wire           axi_tap_output0_rready_w;
wire           axi_tap_output2_bready_w;
wire           axi_tap_output2_wready_w;
wire  [  3:0]  axi_retime_rid_w;
wire  [  1:0]  axi_arb_out_rresp_w;
wire           axi_retime_arready_w;
wire  [  7:0]  axi_retime_awlen_w;
wire           axi_tap_output0_arvalid_w;
wire  [  1:0]  axi_retime_rresp_w;
wire  [ 31:0]  axi_tap_output4_araddr_w;
wire  [  3:0]  axi_retime_bid_w;
wire           axi_tap_output0_rvalid_w;
wire           axi_tap_output0_wvalid_w;
wire           axi_tap_output3_rvalid_w;
wire           axi_tap_output0_wready_w;
wire  [ 31:0]  axi_tap_output0_awaddr_w;
wire           axi_tap_output1_wready_w;
wire  [ 31:0]  axi_arb_out_awaddr_w;
wire           axi_arb_out_rvalid_w;
wire           interrupt1_w;
wire           interrupt0_w;
wire           interrupt3_w;
wire           interrupt2_w;
wire  [ 31:0]  axi_retime_wdata_w;
wire           axi_tap_output3_awvalid_w;
wire           axi_tap_output4_rready_w;
wire           axi_tap_output1_rvalid_w;
wire  [ 31:0]  axi_tap_output3_rdata_w;
wire           axi_retime_bready_w;
wire  [  1:0]  axi_retime_awburst_w;
wire  [  3:0]  axi_arb_out_wstrb_w;
wire           axi_tap_output1_wvalid_w;
wire  [  3:0]  axi_tap_output1_wstrb_w;
wire           axi_tap_output2_rready_w;
wire  [  3:0]  axi_tap_output2_wstrb_w;
wire  [ 31:0]  axi_tap_output1_awaddr_w;
wire  [  3:0]  axi_tap_output4_wstrb_w;
wire           axi_tap_output0_bvalid_w;
wire  [ 31:0]  axi_arb_out_wdata_w;
wire           axi_arb_out_rlast_w;
wire  [ 31:0]  axi_tap_output0_rdata_w;
wire  [  1:0]  axi_arb_out_arburst_w;
wire           axi_tap_output0_awvalid_w;
wire           axi_tap_output4_rvalid_w;
wire           axi_tap_output1_bvalid_w;
wire           axi_retime_rready_w;
wire           axi_tap_output1_rready_w;
wire  [ 31:0]  axi_tap_output4_wdata_w;
wire  [ 31:0]  axi_tap_output2_wdata_w;
wire  [ 31:0]  axi_tap_output0_wdata_w;
wire  [ 31:0]  axi_tap_output2_araddr_w;
wire  [  1:0]  axi_tap_output0_rresp_w;
wire           axi_retime_rvalid_w;
wire  [ 31:0]  axi_tap_output2_awaddr_w;
wire  [ 31:0]  axi_tap_output2_rdata_w;
wire           axi_tap_output4_wready_w;
wire  [ 31:0]  axi_tap_output1_araddr_w;
wire  [ 31:0]  axi_retime_araddr_w;
wire           axi_tap_output3_arvalid_w;
wire  [  1:0]  axi_tap_output3_rresp_w;
wire           axi_arb_out_bvalid_w;
wire           axi_arb_out_arready_w;
wire  [ 31:0]  axi_arb_out_rdata_w;
wire           axi_arb_out_awvalid_w;
wire           axi_tap_output3_awready_w;
wire           axi_tap_output2_awready_w;
wire  [ 31:0]  axi_retime_awaddr_w;
wire  [  3:0]  axi_arb_out_awid_w;
wire           axi_tap_output3_bready_w;
wire  [  1:0]  axi_retime_bresp_w;
wire           axi_retime_wvalid_w;
wire  [  1:0]  axi_tap_output1_bresp_w;
wire  [ 31:0]  axi_tap_output1_rdata_w;
wire           axi_tap_output1_arready_w;
wire  [  7:0]  axi_retime_arlen_w;
wire           axi_tap_output3_rready_w;
wire  [ 31:0]  axi_tap_output3_araddr_w;
wire           axi_tap_output2_awvalid_w;
wire  [  7:0]  axi_arb_out_arlen_w;
wire  [  3:0]  axi_retime_awid_w;
wire  [  1:0]  axi_tap_output4_rresp_w;
wire  [  1:0]  axi_tap_output1_rresp_w;
wire  [  3:0]  axi_tap_output0_wstrb_w;
wire           axi_tap_output2_bvalid_w;
wire           axi_tap_output4_bready_w;
wire  [ 31:0]  axi_tap_output1_wdata_w;
wire           axi_tap_output4_bvalid_w;


irq_ctrl u_intc
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.cfg_awvalid_i(axi_tap_output0_awvalid_w)
    ,.cfg_awaddr_i(axi_tap_output0_awaddr_w)
    ,.cfg_wvalid_i(axi_tap_output0_wvalid_w)
    ,.cfg_wdata_i(axi_tap_output0_wdata_w)
    ,.cfg_wstrb_i(axi_tap_output0_wstrb_w)
    ,.cfg_bready_i(axi_tap_output0_bready_w)
    ,.cfg_arvalid_i(axi_tap_output0_arvalid_w)
    ,.cfg_araddr_i(axi_tap_output0_araddr_w)
    ,.cfg_rready_i(axi_tap_output0_rready_w)
    ,.interrupt0_i(interrupt0_w)
    ,.interrupt1_i(interrupt1_w)
    ,.interrupt2_i(interrupt2_w)
    ,.interrupt3_i(interrupt3_w)

    // Outputs
    ,.cfg_awready_o(axi_tap_output0_awready_w)
    ,.cfg_wready_o(axi_tap_output0_wready_w)
    ,.cfg_bvalid_o(axi_tap_output0_bvalid_w)
    ,.cfg_bresp_o(axi_tap_output0_bresp_w)
    ,.cfg_arready_o(axi_tap_output0_arready_w)
    ,.cfg_rvalid_o(axi_tap_output0_rvalid_w)
    ,.cfg_rdata_o(axi_tap_output0_rdata_w)
    ,.cfg_rresp_o(axi_tap_output0_rresp_w)
    ,.intr_o(intr_o)
);


uart_lite u_uart
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.cfg_awvalid_i(axi_tap_output2_awvalid_w)
    ,.cfg_awaddr_i(axi_tap_output2_awaddr_w)
    ,.cfg_wvalid_i(axi_tap_output2_wvalid_w)
    ,.cfg_wdata_i(axi_tap_output2_wdata_w)
    ,.cfg_wstrb_i(axi_tap_output2_wstrb_w)
    ,.cfg_bready_i(axi_tap_output2_bready_w)
    ,.cfg_arvalid_i(axi_tap_output2_arvalid_w)
    ,.cfg_araddr_i(axi_tap_output2_araddr_w)
    ,.cfg_rready_i(axi_tap_output2_rready_w)
    ,.rx_i(uart_txd_i)

    // Outputs
    ,.cfg_awready_o(axi_tap_output2_awready_w)
    ,.cfg_wready_o(axi_tap_output2_wready_w)
    ,.cfg_bvalid_o(axi_tap_output2_bvalid_w)
    ,.cfg_bresp_o(axi_tap_output2_bresp_w)
    ,.cfg_arready_o(axi_tap_output2_arready_w)
    ,.cfg_rvalid_o(axi_tap_output2_rvalid_w)
    ,.cfg_rdata_o(axi_tap_output2_rdata_w)
    ,.cfg_rresp_o(axi_tap_output2_rresp_w)
    ,.tx_o(uart_rxd_o)
    ,.intr_o(interrupt1_w)
);


timer u_timer
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.cfg_awvalid_i(axi_tap_output1_awvalid_w)
    ,.cfg_awaddr_i(axi_tap_output1_awaddr_w)
    ,.cfg_wvalid_i(axi_tap_output1_wvalid_w)
    ,.cfg_wdata_i(axi_tap_output1_wdata_w)
    ,.cfg_wstrb_i(axi_tap_output1_wstrb_w)
    ,.cfg_bready_i(axi_tap_output1_bready_w)
    ,.cfg_arvalid_i(axi_tap_output1_arvalid_w)
    ,.cfg_araddr_i(axi_tap_output1_araddr_w)
    ,.cfg_rready_i(axi_tap_output1_rready_w)

    // Outputs
    ,.cfg_awready_o(axi_tap_output1_awready_w)
    ,.cfg_wready_o(axi_tap_output1_wready_w)
    ,.cfg_bvalid_o(axi_tap_output1_bvalid_w)
    ,.cfg_bresp_o(axi_tap_output1_bresp_w)
    ,.cfg_arready_o(axi_tap_output1_arready_w)
    ,.cfg_rvalid_o(axi_tap_output1_rvalid_w)
    ,.cfg_rdata_o(axi_tap_output1_rdata_w)
    ,.cfg_rresp_o(axi_tap_output1_rresp_w)
    ,.intr_o(interrupt0_w)
);


axi4_lite_tap u_axi_tap
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.inport_awvalid_i(axi_arb_out_awvalid_w)
    ,.inport_awaddr_i(axi_arb_out_awaddr_w)
    ,.inport_awid_i(axi_arb_out_awid_w)
    ,.inport_awlen_i(axi_arb_out_awlen_w)
    ,.inport_awburst_i(axi_arb_out_awburst_w)
    ,.inport_wvalid_i(axi_arb_out_wvalid_w)
    ,.inport_wdata_i(axi_arb_out_wdata_w)
    ,.inport_wstrb_i(axi_arb_out_wstrb_w)
    ,.inport_wlast_i(axi_arb_out_wlast_w)
    ,.inport_bready_i(axi_arb_out_bready_w)
    ,.inport_arvalid_i(axi_arb_out_arvalid_w)
    ,.inport_araddr_i(axi_arb_out_araddr_w)
    ,.inport_arid_i(axi_arb_out_arid_w)
    ,.inport_arlen_i(axi_arb_out_arlen_w)
    ,.inport_arburst_i(axi_arb_out_arburst_w)
    ,.inport_rready_i(axi_arb_out_rready_w)
    ,.outport_awready_i(axi_retime_awready_w)
    ,.outport_wready_i(axi_retime_wready_w)
    ,.outport_bvalid_i(axi_retime_bvalid_w)
    ,.outport_bresp_i(axi_retime_bresp_w)
    ,.outport_bid_i(axi_retime_bid_w)
    ,.outport_arready_i(axi_retime_arready_w)
    ,.outport_rvalid_i(axi_retime_rvalid_w)
    ,.outport_rdata_i(axi_retime_rdata_w)
    ,.outport_rresp_i(axi_retime_rresp_w)
    ,.outport_rid_i(axi_retime_rid_w)
    ,.outport_rlast_i(axi_retime_rlast_w)
    ,.outport_peripheral0_awready_i(axi_tap_output0_awready_w)
    ,.outport_peripheral0_wready_i(axi_tap_output0_wready_w)
    ,.outport_peripheral0_bvalid_i(axi_tap_output0_bvalid_w)
    ,.outport_peripheral0_bresp_i(axi_tap_output0_bresp_w)
    ,.outport_peripheral0_arready_i(axi_tap_output0_arready_w)
    ,.outport_peripheral0_rvalid_i(axi_tap_output0_rvalid_w)
    ,.outport_peripheral0_rdata_i(axi_tap_output0_rdata_w)
    ,.outport_peripheral0_rresp_i(axi_tap_output0_rresp_w)
    ,.outport_peripheral1_awready_i(axi_tap_output1_awready_w)
    ,.outport_peripheral1_wready_i(axi_tap_output1_wready_w)
    ,.outport_peripheral1_bvalid_i(axi_tap_output1_bvalid_w)
    ,.outport_peripheral1_bresp_i(axi_tap_output1_bresp_w)
    ,.outport_peripheral1_arready_i(axi_tap_output1_arready_w)
    ,.outport_peripheral1_rvalid_i(axi_tap_output1_rvalid_w)
    ,.outport_peripheral1_rdata_i(axi_tap_output1_rdata_w)
    ,.outport_peripheral1_rresp_i(axi_tap_output1_rresp_w)
    ,.outport_peripheral2_awready_i(axi_tap_output2_awready_w)
    ,.outport_peripheral2_wready_i(axi_tap_output2_wready_w)
    ,.outport_peripheral2_bvalid_i(axi_tap_output2_bvalid_w)
    ,.outport_peripheral2_bresp_i(axi_tap_output2_bresp_w)
    ,.outport_peripheral2_arready_i(axi_tap_output2_arready_w)
    ,.outport_peripheral2_rvalid_i(axi_tap_output2_rvalid_w)
    ,.outport_peripheral2_rdata_i(axi_tap_output2_rdata_w)
    ,.outport_peripheral2_rresp_i(axi_tap_output2_rresp_w)
    ,.outport_peripheral3_awready_i(axi_tap_output3_awready_w)
    ,.outport_peripheral3_wready_i(axi_tap_output3_wready_w)
    ,.outport_peripheral3_bvalid_i(axi_tap_output3_bvalid_w)
    ,.outport_peripheral3_bresp_i(axi_tap_output3_bresp_w)
    ,.outport_peripheral3_arready_i(axi_tap_output3_arready_w)
    ,.outport_peripheral3_rvalid_i(axi_tap_output3_rvalid_w)
    ,.outport_peripheral3_rdata_i(axi_tap_output3_rdata_w)
    ,.outport_peripheral3_rresp_i(axi_tap_output3_rresp_w)
    ,.outport_peripheral4_awready_i(axi_tap_output4_awready_w)
    ,.outport_peripheral4_wready_i(axi_tap_output4_wready_w)
    ,.outport_peripheral4_bvalid_i(axi_tap_output4_bvalid_w)
    ,.outport_peripheral4_bresp_i(axi_tap_output4_bresp_w)
    ,.outport_peripheral4_arready_i(axi_tap_output4_arready_w)
    ,.outport_peripheral4_rvalid_i(axi_tap_output4_rvalid_w)
    ,.outport_peripheral4_rdata_i(axi_tap_output4_rdata_w)
    ,.outport_peripheral4_rresp_i(axi_tap_output4_rresp_w)

    // Outputs
    ,.inport_awready_o(axi_arb_out_awready_w)
    ,.inport_wready_o(axi_arb_out_wready_w)
    ,.inport_bvalid_o(axi_arb_out_bvalid_w)
    ,.inport_bresp_o(axi_arb_out_bresp_w)
    ,.inport_bid_o(axi_arb_out_bid_w)
    ,.inport_arready_o(axi_arb_out_arready_w)
    ,.inport_rvalid_o(axi_arb_out_rvalid_w)
    ,.inport_rdata_o(axi_arb_out_rdata_w)
    ,.inport_rresp_o(axi_arb_out_rresp_w)
    ,.inport_rid_o(axi_arb_out_rid_w)
    ,.inport_rlast_o(axi_arb_out_rlast_w)
    ,.outport_awvalid_o(axi_retime_awvalid_w)
    ,.outport_awaddr_o(axi_retime_awaddr_w)
    ,.outport_awid_o(axi_retime_awid_w)
    ,.outport_awlen_o(axi_retime_awlen_w)
    ,.outport_awburst_o(axi_retime_awburst_w)
    ,.outport_wvalid_o(axi_retime_wvalid_w)
    ,.outport_wdata_o(axi_retime_wdata_w)
    ,.outport_wstrb_o(axi_retime_wstrb_w)
    ,.outport_wlast_o(axi_retime_wlast_w)
    ,.outport_bready_o(axi_retime_bready_w)
    ,.outport_arvalid_o(axi_retime_arvalid_w)
    ,.outport_araddr_o(axi_retime_araddr_w)
    ,.outport_arid_o(axi_retime_arid_w)
    ,.outport_arlen_o(axi_retime_arlen_w)
    ,.outport_arburst_o(axi_retime_arburst_w)
    ,.outport_rready_o(axi_retime_rready_w)
    ,.outport_peripheral0_awvalid_o(axi_tap_output0_awvalid_w)
    ,.outport_peripheral0_awaddr_o(axi_tap_output0_awaddr_w)
    ,.outport_peripheral0_wvalid_o(axi_tap_output0_wvalid_w)
    ,.outport_peripheral0_wdata_o(axi_tap_output0_wdata_w)
    ,.outport_peripheral0_wstrb_o(axi_tap_output0_wstrb_w)
    ,.outport_peripheral0_bready_o(axi_tap_output0_bready_w)
    ,.outport_peripheral0_arvalid_o(axi_tap_output0_arvalid_w)
    ,.outport_peripheral0_araddr_o(axi_tap_output0_araddr_w)
    ,.outport_peripheral0_rready_o(axi_tap_output0_rready_w)
    ,.outport_peripheral1_awvalid_o(axi_tap_output1_awvalid_w)
    ,.outport_peripheral1_awaddr_o(axi_tap_output1_awaddr_w)
    ,.outport_peripheral1_wvalid_o(axi_tap_output1_wvalid_w)
    ,.outport_peripheral1_wdata_o(axi_tap_output1_wdata_w)
    ,.outport_peripheral1_wstrb_o(axi_tap_output1_wstrb_w)
    ,.outport_peripheral1_bready_o(axi_tap_output1_bready_w)
    ,.outport_peripheral1_arvalid_o(axi_tap_output1_arvalid_w)
    ,.outport_peripheral1_araddr_o(axi_tap_output1_araddr_w)
    ,.outport_peripheral1_rready_o(axi_tap_output1_rready_w)
    ,.outport_peripheral2_awvalid_o(axi_tap_output2_awvalid_w)
    ,.outport_peripheral2_awaddr_o(axi_tap_output2_awaddr_w)
    ,.outport_peripheral2_wvalid_o(axi_tap_output2_wvalid_w)
    ,.outport_peripheral2_wdata_o(axi_tap_output2_wdata_w)
    ,.outport_peripheral2_wstrb_o(axi_tap_output2_wstrb_w)
    ,.outport_peripheral2_bready_o(axi_tap_output2_bready_w)
    ,.outport_peripheral2_arvalid_o(axi_tap_output2_arvalid_w)
    ,.outport_peripheral2_araddr_o(axi_tap_output2_araddr_w)
    ,.outport_peripheral2_rready_o(axi_tap_output2_rready_w)
    ,.outport_peripheral3_awvalid_o(axi_tap_output3_awvalid_w)
    ,.outport_peripheral3_awaddr_o(axi_tap_output3_awaddr_w)
    ,.outport_peripheral3_wvalid_o(axi_tap_output3_wvalid_w)
    ,.outport_peripheral3_wdata_o(axi_tap_output3_wdata_w)
    ,.outport_peripheral3_wstrb_o(axi_tap_output3_wstrb_w)
    ,.outport_peripheral3_bready_o(axi_tap_output3_bready_w)
    ,.outport_peripheral3_arvalid_o(axi_tap_output3_arvalid_w)
    ,.outport_peripheral3_araddr_o(axi_tap_output3_araddr_w)
    ,.outport_peripheral3_rready_o(axi_tap_output3_rready_w)
    ,.outport_peripheral4_awvalid_o(axi_tap_output4_awvalid_w)
    ,.outport_peripheral4_awaddr_o(axi_tap_output4_awaddr_w)
    ,.outport_peripheral4_wvalid_o(axi_tap_output4_wvalid_w)
    ,.outport_peripheral4_wdata_o(axi_tap_output4_wdata_w)
    ,.outport_peripheral4_wstrb_o(axi_tap_output4_wstrb_w)
    ,.outport_peripheral4_bready_o(axi_tap_output4_bready_w)
    ,.outport_peripheral4_arvalid_o(axi_tap_output4_arvalid_w)
    ,.outport_peripheral4_araddr_o(axi_tap_output4_araddr_w)
    ,.outport_peripheral4_rready_o(axi_tap_output4_rready_w)
);


axi4_arb u_arb
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.inport0_awvalid_i(inport_awvalid_i)
    ,.inport0_awaddr_i(inport_awaddr_i)
    ,.inport0_awid_i(inport_awid_i)
    ,.inport0_awlen_i(inport_awlen_i)
    ,.inport0_awburst_i(inport_awburst_i)
    ,.inport0_wvalid_i(inport_wvalid_i)
    ,.inport0_wdata_i(inport_wdata_i)
    ,.inport0_wstrb_i(inport_wstrb_i)
    ,.inport0_wlast_i(inport_wlast_i)
    ,.inport0_bready_i(inport_bready_i)
    ,.inport0_arvalid_i(inport_arvalid_i)
    ,.inport0_araddr_i(inport_araddr_i)
    ,.inport0_arid_i(inport_arid_i)
    ,.inport0_arlen_i(inport_arlen_i)
    ,.inport0_arburst_i(inport_arburst_i)
    ,.inport0_rready_i(inport_rready_i)
    ,.inport1_awvalid_i(cpu_d_awvalid_i)
    ,.inport1_awaddr_i(cpu_d_awaddr_i)
    ,.inport1_awid_i(cpu_d_awid_i)
    ,.inport1_awlen_i(cpu_d_awlen_i)
    ,.inport1_awburst_i(cpu_d_awburst_i)
    ,.inport1_wvalid_i(cpu_d_wvalid_i)
    ,.inport1_wdata_i(cpu_d_wdata_i)
    ,.inport1_wstrb_i(cpu_d_wstrb_i)
    ,.inport1_wlast_i(cpu_d_wlast_i)
    ,.inport1_bready_i(cpu_d_bready_i)
    ,.inport1_arvalid_i(cpu_d_arvalid_i)
    ,.inport1_araddr_i(cpu_d_araddr_i)
    ,.inport1_arid_i(cpu_d_arid_i)
    ,.inport1_arlen_i(cpu_d_arlen_i)
    ,.inport1_arburst_i(cpu_d_arburst_i)
    ,.inport1_rready_i(cpu_d_rready_i)
    ,.inport2_awvalid_i(cpu_i_awvalid_i)
    ,.inport2_awaddr_i(cpu_i_awaddr_i)
    ,.inport2_awid_i(cpu_i_awid_i)
    ,.inport2_awlen_i(cpu_i_awlen_i)
    ,.inport2_awburst_i(cpu_i_awburst_i)
    ,.inport2_wvalid_i(cpu_i_wvalid_i)
    ,.inport2_wdata_i(cpu_i_wdata_i)
    ,.inport2_wstrb_i(cpu_i_wstrb_i)
    ,.inport2_wlast_i(cpu_i_wlast_i)
    ,.inport2_bready_i(cpu_i_bready_i)
    ,.inport2_arvalid_i(cpu_i_arvalid_i)
    ,.inport2_araddr_i(cpu_i_araddr_i)
    ,.inport2_arid_i(cpu_i_arid_i)
    ,.inport2_arlen_i(cpu_i_arlen_i)
    ,.inport2_arburst_i(cpu_i_arburst_i)
    ,.inport2_rready_i(cpu_i_rready_i)
    ,.inport3_awvalid_i(1'b0)
    ,.inport3_awaddr_i(32'b0)
    ,.inport3_awid_i(4'b0)
    ,.inport3_awlen_i(8'b0)
    ,.inport3_awburst_i(2'b0)
    ,.inport3_wvalid_i(1'b0)
    ,.inport3_wdata_i(32'b0)
    ,.inport3_wstrb_i(4'b0)
    ,.inport3_wlast_i(1'b0)
    ,.inport3_bready_i(1'b0)
    ,.inport3_arvalid_i(1'b0)
    ,.inport3_araddr_i(32'b0)
    ,.inport3_arid_i(4'b0)
    ,.inport3_arlen_i(8'b0)
    ,.inport3_arburst_i(2'b0)
    ,.inport3_rready_i(1'b0)
    ,.outport_awready_i(axi_arb_out_awready_w)
    ,.outport_wready_i(axi_arb_out_wready_w)
    ,.outport_bvalid_i(axi_arb_out_bvalid_w)
    ,.outport_bresp_i(axi_arb_out_bresp_w)
    ,.outport_bid_i(axi_arb_out_bid_w)
    ,.outport_arready_i(axi_arb_out_arready_w)
    ,.outport_rvalid_i(axi_arb_out_rvalid_w)
    ,.outport_rdata_i(axi_arb_out_rdata_w)
    ,.outport_rresp_i(axi_arb_out_rresp_w)
    ,.outport_rid_i(axi_arb_out_rid_w)
    ,.outport_rlast_i(axi_arb_out_rlast_w)

    // Outputs
    ,.inport0_awready_o(inport_awready_o)
    ,.inport0_wready_o(inport_wready_o)
    ,.inport0_bvalid_o(inport_bvalid_o)
    ,.inport0_bresp_o(inport_bresp_o)
    ,.inport0_bid_o(inport_bid_o)
    ,.inport0_arready_o(inport_arready_o)
    ,.inport0_rvalid_o(inport_rvalid_o)
    ,.inport0_rdata_o(inport_rdata_o)
    ,.inport0_rresp_o(inport_rresp_o)
    ,.inport0_rid_o(inport_rid_o)
    ,.inport0_rlast_o(inport_rlast_o)
    ,.inport1_awready_o(cpu_d_awready_o)
    ,.inport1_wready_o(cpu_d_wready_o)
    ,.inport1_bvalid_o(cpu_d_bvalid_o)
    ,.inport1_bresp_o(cpu_d_bresp_o)
    ,.inport1_bid_o(cpu_d_bid_o)
    ,.inport1_arready_o(cpu_d_arready_o)
    ,.inport1_rvalid_o(cpu_d_rvalid_o)
    ,.inport1_rdata_o(cpu_d_rdata_o)
    ,.inport1_rresp_o(cpu_d_rresp_o)
    ,.inport1_rid_o(cpu_d_rid_o)
    ,.inport1_rlast_o(cpu_d_rlast_o)
    ,.inport2_awready_o(cpu_i_awready_o)
    ,.inport2_wready_o(cpu_i_wready_o)
    ,.inport2_bvalid_o(cpu_i_bvalid_o)
    ,.inport2_bresp_o(cpu_i_bresp_o)
    ,.inport2_bid_o(cpu_i_bid_o)
    ,.inport2_arready_o(cpu_i_arready_o)
    ,.inport2_rvalid_o(cpu_i_rvalid_o)
    ,.inport2_rdata_o(cpu_i_rdata_o)
    ,.inport2_rresp_o(cpu_i_rresp_o)
    ,.inport2_rid_o(cpu_i_rid_o)
    ,.inport2_rlast_o(cpu_i_rlast_o)
    ,.inport3_awready_o()
    ,.inport3_wready_o()
    ,.inport3_bvalid_o()
    ,.inport3_bresp_o()
    ,.inport3_bid_o()
    ,.inport3_arready_o()
    ,.inport3_rvalid_o()
    ,.inport3_rdata_o()
    ,.inport3_rresp_o()
    ,.inport3_rid_o()
    ,.inport3_rlast_o()
    ,.outport_awvalid_o(axi_arb_out_awvalid_w)
    ,.outport_awaddr_o(axi_arb_out_awaddr_w)
    ,.outport_awid_o(axi_arb_out_awid_w)
    ,.outport_awlen_o(axi_arb_out_awlen_w)
    ,.outport_awburst_o(axi_arb_out_awburst_w)
    ,.outport_wvalid_o(axi_arb_out_wvalid_w)
    ,.outport_wdata_o(axi_arb_out_wdata_w)
    ,.outport_wstrb_o(axi_arb_out_wstrb_w)
    ,.outport_wlast_o(axi_arb_out_wlast_w)
    ,.outport_bready_o(axi_arb_out_bready_w)
    ,.outport_arvalid_o(axi_arb_out_arvalid_w)
    ,.outport_araddr_o(axi_arb_out_araddr_w)
    ,.outport_arid_o(axi_arb_out_arid_w)
    ,.outport_arlen_o(axi_arb_out_arlen_w)
    ,.outport_arburst_o(axi_arb_out_arburst_w)
    ,.outport_rready_o(axi_arb_out_rready_w)
);


spi_lite u_spi
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.cfg_awvalid_i(axi_tap_output3_awvalid_w)
    ,.cfg_awaddr_i(axi_tap_output3_awaddr_w)
    ,.cfg_wvalid_i(axi_tap_output3_wvalid_w)
    ,.cfg_wdata_i(axi_tap_output3_wdata_w)
    ,.cfg_wstrb_i(axi_tap_output3_wstrb_w)
    ,.cfg_bready_i(axi_tap_output3_bready_w)
    ,.cfg_arvalid_i(axi_tap_output3_arvalid_w)
    ,.cfg_araddr_i(axi_tap_output3_araddr_w)
    ,.cfg_rready_i(axi_tap_output3_rready_w)
    ,.spi_miso_i(spi_miso_i)

    // Outputs
    ,.cfg_awready_o(axi_tap_output3_awready_w)
    ,.cfg_wready_o(axi_tap_output3_wready_w)
    ,.cfg_bvalid_o(axi_tap_output3_bvalid_w)
    ,.cfg_bresp_o(axi_tap_output3_bresp_w)
    ,.cfg_arready_o(axi_tap_output3_arready_w)
    ,.cfg_rvalid_o(axi_tap_output3_rvalid_w)
    ,.cfg_rdata_o(axi_tap_output3_rdata_w)
    ,.cfg_rresp_o(axi_tap_output3_rresp_w)
    ,.spi_clk_o(spi_clk_o)
    ,.spi_mosi_o(spi_mosi_o)
    ,.spi_cs_o(spi_cs_o)
    ,.intr_o(interrupt2_w)
);


axi4_retime u_retime
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.inport_awvalid_i(axi_retime_awvalid_w)
    ,.inport_awaddr_i(axi_retime_awaddr_w)
    ,.inport_awid_i(axi_retime_awid_w)
    ,.inport_awlen_i(axi_retime_awlen_w)
    ,.inport_awburst_i(axi_retime_awburst_w)
    ,.inport_wvalid_i(axi_retime_wvalid_w)
    ,.inport_wdata_i(axi_retime_wdata_w)
    ,.inport_wstrb_i(axi_retime_wstrb_w)
    ,.inport_wlast_i(axi_retime_wlast_w)
    ,.inport_bready_i(axi_retime_bready_w)
    ,.inport_arvalid_i(axi_retime_arvalid_w)
    ,.inport_araddr_i(axi_retime_araddr_w)
    ,.inport_arid_i(axi_retime_arid_w)
    ,.inport_arlen_i(axi_retime_arlen_w)
    ,.inport_arburst_i(axi_retime_arburst_w)
    ,.inport_rready_i(axi_retime_rready_w)
    ,.outport_awready_i(mem_awready_i)
    ,.outport_wready_i(mem_wready_i)
    ,.outport_bvalid_i(mem_bvalid_i)
    ,.outport_bresp_i(mem_bresp_i)
    ,.outport_bid_i(mem_bid_i)
    ,.outport_arready_i(mem_arready_i)
    ,.outport_rvalid_i(mem_rvalid_i)
    ,.outport_rdata_i(mem_rdata_i)
    ,.outport_rresp_i(mem_rresp_i)
    ,.outport_rid_i(mem_rid_i)
    ,.outport_rlast_i(mem_rlast_i)

    // Outputs
    ,.inport_awready_o(axi_retime_awready_w)
    ,.inport_wready_o(axi_retime_wready_w)
    ,.inport_bvalid_o(axi_retime_bvalid_w)
    ,.inport_bresp_o(axi_retime_bresp_w)
    ,.inport_bid_o(axi_retime_bid_w)
    ,.inport_arready_o(axi_retime_arready_w)
    ,.inport_rvalid_o(axi_retime_rvalid_w)
    ,.inport_rdata_o(axi_retime_rdata_w)
    ,.inport_rresp_o(axi_retime_rresp_w)
    ,.inport_rid_o(axi_retime_rid_w)
    ,.inport_rlast_o(axi_retime_rlast_w)
    ,.outport_awvalid_o(mem_awvalid_o)
    ,.outport_awaddr_o(mem_awaddr_o)
    ,.outport_awid_o(mem_awid_o)
    ,.outport_awlen_o(mem_awlen_o)
    ,.outport_awburst_o(mem_awburst_o)
    ,.outport_wvalid_o(mem_wvalid_o)
    ,.outport_wdata_o(mem_wdata_o)
    ,.outport_wstrb_o(mem_wstrb_o)
    ,.outport_wlast_o(mem_wlast_o)
    ,.outport_bready_o(mem_bready_o)
    ,.outport_arvalid_o(mem_arvalid_o)
    ,.outport_araddr_o(mem_araddr_o)
    ,.outport_arid_o(mem_arid_o)
    ,.outport_arlen_o(mem_arlen_o)
    ,.outport_arburst_o(mem_arburst_o)
    ,.outport_rready_o(mem_rready_o)
);


gpio u_gpio
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.cfg_awvalid_i(axi_tap_output4_awvalid_w)
    ,.cfg_awaddr_i(axi_tap_output4_awaddr_w)
    ,.cfg_wvalid_i(axi_tap_output4_wvalid_w)
    ,.cfg_wdata_i(axi_tap_output4_wdata_w)
    ,.cfg_wstrb_i(axi_tap_output4_wstrb_w)
    ,.cfg_bready_i(axi_tap_output4_bready_w)
    ,.cfg_arvalid_i(axi_tap_output4_arvalid_w)
    ,.cfg_araddr_i(axi_tap_output4_araddr_w)
    ,.cfg_rready_i(axi_tap_output4_rready_w)
    ,.gpio_input_i(gpio_input_i)

    // Outputs
    ,.cfg_awready_o(axi_tap_output4_awready_w)
    ,.cfg_wready_o(axi_tap_output4_wready_w)
    ,.cfg_bvalid_o(axi_tap_output4_bvalid_w)
    ,.cfg_bresp_o(axi_tap_output4_bresp_w)
    ,.cfg_arready_o(axi_tap_output4_arready_w)
    ,.cfg_rvalid_o(axi_tap_output4_rvalid_w)
    ,.cfg_rdata_o(axi_tap_output4_rdata_w)
    ,.cfg_rresp_o(axi_tap_output4_rresp_w)
    ,.gpio_output_o(gpio_output_o)
    ,.gpio_output_enable_o(gpio_output_enable_o)
    ,.intr_o(interrupt3_w)
);



endmodule
