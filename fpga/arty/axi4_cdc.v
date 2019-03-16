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

module axi4_cdc
(
    // Inputs
     input           wr_clk_i
    ,input           wr_rst_i
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
    ,input           rd_clk_i
    ,input           rd_rst_i
    ,input           outport_awready_i
    ,input           outport_wready_i
    ,input           outport_bvalid_i
    ,input  [  1:0]  outport_bresp_i
    ,input  [  3:0]  outport_bid_i
    ,input           outport_arready_i
    ,input           outport_rvalid_i
    ,input  [ 31:0]  outport_rdata_i
    ,input  [  1:0]  outport_rresp_i
    ,input  [  3:0]  outport_rid_i
    ,input           outport_rlast_i

    // Outputs
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
    ,output          outport_awvalid_o
    ,output [ 31:0]  outport_awaddr_o
    ,output [  3:0]  outport_awid_o
    ,output [  7:0]  outport_awlen_o
    ,output [  1:0]  outport_awburst_o
    ,output          outport_wvalid_o
    ,output [ 31:0]  outport_wdata_o
    ,output [  3:0]  outport_wstrb_o
    ,output          outport_wlast_o
    ,output          outport_bready_o
    ,output          outport_arvalid_o
    ,output [ 31:0]  outport_araddr_o
    ,output [  3:0]  outport_arid_o
    ,output [  7:0]  outport_arlen_o
    ,output [  1:0]  outport_arburst_o
    ,output          outport_rready_o
);




`ifndef verilator
axi_cdc_buffer
u_core
(
    .s_axi_aclk(wr_clk_i), 
    .s_axi_aresetn(~wr_rst_i), 

    .s_axi_awid(inport_awid_i), 
    .s_axi_awaddr(inport_awaddr_i), 
    .s_axi_awlen(inport_awlen_i), 
    .s_axi_awsize(3'b010), 
    .s_axi_awburst(inport_awburst_i), 
    .s_axi_awlock(1'b0), 
    .s_axi_awcache(4'b0), 
    .s_axi_awprot(3'b0), 
    .s_axi_awregion(4'b0),
    .s_axi_awqos(4'b0),
    .s_axi_awvalid(inport_awvalid_i),
    .s_axi_wdata(inport_wdata_i), 
    .s_axi_wstrb(inport_wstrb_i), 
    .s_axi_wlast(inport_wlast_i),
    .s_axi_wvalid(inport_wvalid_i),
    .s_axi_bready(inport_bready_i),
    .s_axi_rready(inport_rready_i), 
    .s_axi_arid(inport_arid_i),
    .s_axi_araddr(inport_araddr_i),
    .s_axi_arlen(inport_arlen_i), 
    .s_axi_arsize(3'b010),
    .s_axi_arburst(inport_arburst_i), 
    .s_axi_arlock(1'b0),
    .s_axi_arcache(4'b0), 
    .s_axi_arprot(3'b0),
    .s_axi_arregion(4'b0), 
    .s_axi_arqos(4'b0), 
    .s_axi_arvalid(inport_arvalid_i), 

    .s_axi_arready(inport_arready_o), 
    .s_axi_awready(inport_awready_o), 
    .s_axi_wready(inport_wready_o),     
    .s_axi_rid(inport_rid_o),
    .s_axi_rdata(inport_rdata_o), 
    .s_axi_rresp(inport_rresp_o), 
    .s_axi_rlast(inport_rlast_o), 
    .s_axi_rvalid(inport_rvalid_o), 
    .s_axi_bid(inport_bid_o), 
    .s_axi_bresp(inport_bresp_o), 
    .s_axi_bvalid(inport_bvalid_o),     

    .m_axi_aclk(rd_clk_i),
    .m_axi_aresetn(~rd_rst_i),

    .m_axi_awid(outport_awid_o),
    .m_axi_awaddr(outport_awaddr_o),
    .m_axi_awlen(outport_awlen_o),
    .m_axi_awsize(outport_awsize_o), 
    .m_axi_awburst(outport_awburst_o),
    .m_axi_awlock(),
    .m_axi_awcache(),
    .m_axi_awprot(),
    .m_axi_awregion(),
    .m_axi_awqos(), 
    .m_axi_awvalid(outport_awvalid_o),
    .m_axi_awready(outport_awready_i),
    .m_axi_wdata(outport_wdata_o),
    .m_axi_wstrb(outport_wstrb_o),
    .m_axi_wlast(outport_wlast_o),
    .m_axi_wvalid(outport_wvalid_o), 
    .m_axi_wready(outport_wready_i),
    .m_axi_bid(outport_bid_i),
    .m_axi_bresp(outport_bresp_i),
    .m_axi_bvalid(outport_bvalid_i),
    .m_axi_bready(outport_bready_o),
    .m_axi_arid(outport_arid_o), 
    .m_axi_araddr(outport_araddr_o), 
    .m_axi_arlen(outport_arlen_o),
    .m_axi_arsize(outport_arsize_o),
    .m_axi_arburst(outport_arburst_o),
    .m_axi_arlock(),
    .m_axi_arcache(),
    .m_axi_arprot(), 
    .m_axi_arregion(),
    .m_axi_arqos(),
    .m_axi_arvalid(outport_arvalid_o),
    .m_axi_arready(outport_arready_i),
    .m_axi_rid(outport_rid_i),
    .m_axi_rdata(outport_rdata_i), 
    .m_axi_rresp(outport_rresp_i),
    .m_axi_rlast(outport_rlast_i),
    .m_axi_rvalid(outport_rvalid_i),
    .m_axi_rready(outport_rready_o)
);
`endif

endmodule
