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

module axi4_lite_tap
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
    ,input           outport_peripheral0_awready_i
    ,input           outport_peripheral0_wready_i
    ,input           outport_peripheral0_bvalid_i
    ,input  [  1:0]  outport_peripheral0_bresp_i
    ,input           outport_peripheral0_arready_i
    ,input           outport_peripheral0_rvalid_i
    ,input  [ 31:0]  outport_peripheral0_rdata_i
    ,input  [  1:0]  outport_peripheral0_rresp_i
    ,input           outport_peripheral1_awready_i
    ,input           outport_peripheral1_wready_i
    ,input           outport_peripheral1_bvalid_i
    ,input  [  1:0]  outport_peripheral1_bresp_i
    ,input           outport_peripheral1_arready_i
    ,input           outport_peripheral1_rvalid_i
    ,input  [ 31:0]  outport_peripheral1_rdata_i
    ,input  [  1:0]  outport_peripheral1_rresp_i
    ,input           outport_peripheral2_awready_i
    ,input           outport_peripheral2_wready_i
    ,input           outport_peripheral2_bvalid_i
    ,input  [  1:0]  outport_peripheral2_bresp_i
    ,input           outport_peripheral2_arready_i
    ,input           outport_peripheral2_rvalid_i
    ,input  [ 31:0]  outport_peripheral2_rdata_i
    ,input  [  1:0]  outport_peripheral2_rresp_i
    ,input           outport_peripheral3_awready_i
    ,input           outport_peripheral3_wready_i
    ,input           outport_peripheral3_bvalid_i
    ,input  [  1:0]  outport_peripheral3_bresp_i
    ,input           outport_peripheral3_arready_i
    ,input           outport_peripheral3_rvalid_i
    ,input  [ 31:0]  outport_peripheral3_rdata_i
    ,input  [  1:0]  outport_peripheral3_rresp_i
    ,input           outport_peripheral4_awready_i
    ,input           outport_peripheral4_wready_i
    ,input           outport_peripheral4_bvalid_i
    ,input  [  1:0]  outport_peripheral4_bresp_i
    ,input           outport_peripheral4_arready_i
    ,input           outport_peripheral4_rvalid_i
    ,input  [ 31:0]  outport_peripheral4_rdata_i
    ,input  [  1:0]  outport_peripheral4_rresp_i

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
    ,output          outport_peripheral0_awvalid_o
    ,output [ 31:0]  outport_peripheral0_awaddr_o
    ,output          outport_peripheral0_wvalid_o
    ,output [ 31:0]  outport_peripheral0_wdata_o
    ,output [  3:0]  outport_peripheral0_wstrb_o
    ,output          outport_peripheral0_bready_o
    ,output          outport_peripheral0_arvalid_o
    ,output [ 31:0]  outport_peripheral0_araddr_o
    ,output          outport_peripheral0_rready_o
    ,output          outport_peripheral1_awvalid_o
    ,output [ 31:0]  outport_peripheral1_awaddr_o
    ,output          outport_peripheral1_wvalid_o
    ,output [ 31:0]  outport_peripheral1_wdata_o
    ,output [  3:0]  outport_peripheral1_wstrb_o
    ,output          outport_peripheral1_bready_o
    ,output          outport_peripheral1_arvalid_o
    ,output [ 31:0]  outport_peripheral1_araddr_o
    ,output          outport_peripheral1_rready_o
    ,output          outport_peripheral2_awvalid_o
    ,output [ 31:0]  outport_peripheral2_awaddr_o
    ,output          outport_peripheral2_wvalid_o
    ,output [ 31:0]  outport_peripheral2_wdata_o
    ,output [  3:0]  outport_peripheral2_wstrb_o
    ,output          outport_peripheral2_bready_o
    ,output          outport_peripheral2_arvalid_o
    ,output [ 31:0]  outport_peripheral2_araddr_o
    ,output          outport_peripheral2_rready_o
    ,output          outport_peripheral3_awvalid_o
    ,output [ 31:0]  outport_peripheral3_awaddr_o
    ,output          outport_peripheral3_wvalid_o
    ,output [ 31:0]  outport_peripheral3_wdata_o
    ,output [  3:0]  outport_peripheral3_wstrb_o
    ,output          outport_peripheral3_bready_o
    ,output          outport_peripheral3_arvalid_o
    ,output [ 31:0]  outport_peripheral3_araddr_o
    ,output          outport_peripheral3_rready_o
    ,output          outport_peripheral4_awvalid_o
    ,output [ 31:0]  outport_peripheral4_awaddr_o
    ,output          outport_peripheral4_wvalid_o
    ,output [ 31:0]  outport_peripheral4_wdata_o
    ,output [  3:0]  outport_peripheral4_wstrb_o
    ,output          outport_peripheral4_bready_o
    ,output          outport_peripheral4_arvalid_o
    ,output [ 31:0]  outport_peripheral4_araddr_o
    ,output          outport_peripheral4_rready_o
);



`define ADDR_SEL_W         3
`define PERIPH0_ADDR         32'h90000000
`define PERIPH0_MASK         32'hff000000
`define PERIPH1_ADDR         32'h91000000
`define PERIPH1_MASK         32'hff000000
`define PERIPH2_ADDR         32'h92000000
`define PERIPH2_MASK         32'hff000000
`define PERIPH3_ADDR         32'h93000000
`define PERIPH3_MASK         32'hff000000
`define PERIPH4_ADDR         32'h94000000
`define PERIPH4_MASK         32'hff000000

//-----------------------------------------------------------------
// AXI: Read
//-----------------------------------------------------------------
reg [3:0]              read_pending_q;
reg [3:0]              read_pending_r;
reg [3:0]              arid_q;
reg [`ADDR_SEL_W-1:0]  read_port_q;
reg [`ADDR_SEL_W-1:0]  read_port_r;

always @ *
begin
    read_port_r = `ADDR_SEL_W'b0;
    if ((inport_araddr_i & `PERIPH0_MASK) == `PERIPH0_ADDR) read_port_r = `ADDR_SEL_W'd1;
    if ((inport_araddr_i & `PERIPH1_MASK) == `PERIPH1_ADDR) read_port_r = `ADDR_SEL_W'd2;
    if ((inport_araddr_i & `PERIPH2_MASK) == `PERIPH2_ADDR) read_port_r = `ADDR_SEL_W'd3;
    if ((inport_araddr_i & `PERIPH3_MASK) == `PERIPH3_ADDR) read_port_r = `ADDR_SEL_W'd4;
    if ((inport_araddr_i & `PERIPH4_MASK) == `PERIPH4_ADDR) read_port_r = `ADDR_SEL_W'd5;
end

wire read_incr_w = (inport_arvalid_i && inport_arready_o);
wire read_decr_w = (inport_rvalid_o  && inport_rlast_o && inport_rready_i);

always @ *
begin
    read_pending_r = read_pending_q;

    if (read_incr_w && !read_decr_w)
        read_pending_r = read_pending_r + 4'd1;
    else if (!read_incr_w && read_decr_w)
        read_pending_r = read_pending_r - 4'd1;
end

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
begin
    read_pending_q <= 4'b0;
    arid_q         <= 4'b0;
end
else 
begin
    read_pending_q <= read_pending_r;

    // Read command accepted
    if (inport_arvalid_i && inport_arready_o)
    begin
        arid_q      <= inport_arid_i;
        read_port_q <= read_port_r;
    end
end

wire read_accept_w       = (read_port_q == read_port_r && read_pending_q != 4'hF) || (read_pending_q == 4'h0);

assign outport_arvalid_o = inport_arvalid_i & read_accept_w & (read_port_r == `ADDR_SEL_W'd0);
assign outport_araddr_o  = inport_araddr_i;
assign outport_arid_o    = inport_arid_i;
assign outport_arlen_o   = inport_arlen_i;
assign outport_arburst_o = inport_arburst_i;
assign outport_rready_o  = inport_rready_i;

assign outport_peripheral0_arvalid_o = inport_arvalid_i & read_accept_w & (read_port_r == `ADDR_SEL_W'd1);
assign outport_peripheral0_araddr_o  = inport_araddr_i;
assign outport_peripheral0_rready_o  = inport_rready_i;
assign outport_peripheral1_arvalid_o = inport_arvalid_i & read_accept_w & (read_port_r == `ADDR_SEL_W'd2);
assign outport_peripheral1_araddr_o  = inport_araddr_i;
assign outport_peripheral1_rready_o  = inport_rready_i;
assign outport_peripheral2_arvalid_o = inport_arvalid_i & read_accept_w & (read_port_r == `ADDR_SEL_W'd3);
assign outport_peripheral2_araddr_o  = inport_araddr_i;
assign outport_peripheral2_rready_o  = inport_rready_i;
assign outport_peripheral3_arvalid_o = inport_arvalid_i & read_accept_w & (read_port_r == `ADDR_SEL_W'd4);
assign outport_peripheral3_araddr_o  = inport_araddr_i;
assign outport_peripheral3_rready_o  = inport_rready_i;
assign outport_peripheral4_arvalid_o = inport_arvalid_i & read_accept_w & (read_port_r == `ADDR_SEL_W'd5);
assign outport_peripheral4_araddr_o  = inport_araddr_i;
assign outport_peripheral4_rready_o  = inport_rready_i;

reg        outport_rvalid_r;
reg [31:0] outport_rdata_r;
reg [1:0]  outport_rresp_r;
reg [3:0]  outport_rid_r;
reg        outport_rlast_r;

always @ *
begin
    case (read_port_q)
    `ADDR_SEL_W'd1:
    begin
        outport_rvalid_r = outport_peripheral0_rvalid_i;
        outport_rdata_r  = outport_peripheral0_rdata_i;
        outport_rresp_r  = outport_peripheral0_rresp_i;
        outport_rid_r    = arid_q;
        outport_rlast_r  = 1'b1;
    end
    `ADDR_SEL_W'd2:
    begin
        outport_rvalid_r = outport_peripheral1_rvalid_i;
        outport_rdata_r  = outport_peripheral1_rdata_i;
        outport_rresp_r  = outport_peripheral1_rresp_i;
        outport_rid_r    = arid_q;
        outport_rlast_r  = 1'b1;
    end
    `ADDR_SEL_W'd3:
    begin
        outport_rvalid_r = outport_peripheral2_rvalid_i;
        outport_rdata_r  = outport_peripheral2_rdata_i;
        outport_rresp_r  = outport_peripheral2_rresp_i;
        outport_rid_r    = arid_q;
        outport_rlast_r  = 1'b1;
    end
    `ADDR_SEL_W'd4:
    begin
        outport_rvalid_r = outport_peripheral3_rvalid_i;
        outport_rdata_r  = outport_peripheral3_rdata_i;
        outport_rresp_r  = outport_peripheral3_rresp_i;
        outport_rid_r    = arid_q;
        outport_rlast_r  = 1'b1;
    end
    `ADDR_SEL_W'd5:
    begin
        outport_rvalid_r = outport_peripheral4_rvalid_i;
        outport_rdata_r  = outport_peripheral4_rdata_i;
        outport_rresp_r  = outport_peripheral4_rresp_i;
        outport_rid_r    = arid_q;
        outport_rlast_r  = 1'b1;
    end
    default:
    begin
        outport_rvalid_r = outport_rvalid_i;
        outport_rdata_r  = outport_rdata_i;
        outport_rresp_r  = outport_rresp_i;
        outport_rid_r    = outport_rid_i;
        outport_rlast_r  = outport_rlast_i;
    end
    endcase
end

assign inport_rvalid_o  = outport_rvalid_r;
assign inport_rdata_o   = outport_rdata_r;
assign inport_rresp_o   = outport_rresp_r;
assign inport_rid_o     = outport_rid_r;
assign inport_rlast_o   = outport_rlast_r;

reg inport_arready_r;
always @ *
begin
    case (read_port_r)
    `ADDR_SEL_W'd1:
        inport_arready_r = outport_peripheral0_arready_i;
    `ADDR_SEL_W'd2:
        inport_arready_r = outport_peripheral1_arready_i;
    `ADDR_SEL_W'd3:
        inport_arready_r = outport_peripheral2_arready_i;
    `ADDR_SEL_W'd4:
        inport_arready_r = outport_peripheral3_arready_i;
    `ADDR_SEL_W'd5:
        inport_arready_r = outport_peripheral4_arready_i;
    default:
        inport_arready_r = outport_arready_i;
    endcase
end

assign inport_arready_o = read_accept_w & inport_arready_r;

//-----------------------------------------------------------------
// AXI: Write
//-----------------------------------------------------------------
reg [3:0]              write_pending_q;
reg [3:0]              write_pending_r;
reg [3:0]              awid_q;
reg [`ADDR_SEL_W-1:0]  write_port_q;
reg [`ADDR_SEL_W-1:0]  write_port_r;

always @ *
begin
    write_port_r = `ADDR_SEL_W'b0;
    if ((inport_awaddr_i & `PERIPH0_MASK) == `PERIPH0_ADDR) write_port_r = `ADDR_SEL_W'd1;
    if ((inport_awaddr_i & `PERIPH1_MASK) == `PERIPH1_ADDR) write_port_r = `ADDR_SEL_W'd2;
    if ((inport_awaddr_i & `PERIPH2_MASK) == `PERIPH2_ADDR) write_port_r = `ADDR_SEL_W'd3;
    if ((inport_awaddr_i & `PERIPH3_MASK) == `PERIPH3_ADDR) write_port_r = `ADDR_SEL_W'd4;
    if ((inport_awaddr_i & `PERIPH4_MASK) == `PERIPH4_ADDR) write_port_r = `ADDR_SEL_W'd5;
end

wire write_incr_w = (inport_awvalid_i && inport_awready_o);
wire write_decr_w = (inport_bvalid_o  && inport_bready_i);

// NOTE: This IP expect AWVALID and WVALID to appear in the same cycle...
always @ *
begin
    write_pending_r = write_pending_q;

    if (write_incr_w && !write_decr_w)
        write_pending_r = write_pending_r + 4'd1;
    else if (!write_incr_w && write_decr_w)
        write_pending_r = write_pending_r - 4'd1;
end

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
begin
    write_pending_q <= 4'b0;
    awid_q          <= 4'b0;
end
else 
begin
    write_pending_q <= write_pending_r;

    // Write command accepted
    if (inport_awvalid_i && inport_awready_o)
    begin
        awid_q       <= inport_awid_i;
        write_port_q <= write_port_r;
    end
end

wire write_accept_w      = (write_port_q == write_port_r && write_pending_q != 4'hF) || (write_pending_q == 4'h0);

assign outport_awvalid_o = inport_awvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd0);
assign outport_awaddr_o  = inport_awaddr_i;
assign outport_awid_o    = inport_awid_i;
assign outport_awlen_o   = inport_awlen_i;
assign outport_awburst_o = inport_awburst_i;
assign outport_wvalid_o  = inport_wvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd0);
assign outport_wdata_o   = inport_wdata_i;
assign outport_wstrb_o   = inport_wstrb_i;
assign outport_wlast_o   = inport_wlast_i;
assign outport_bready_o  = inport_bready_i;

assign outport_peripheral0_awvalid_o = inport_awvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd1);
assign outport_peripheral0_awaddr_o  = inport_awaddr_i;
assign outport_peripheral0_wvalid_o  = inport_wvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd1);
assign outport_peripheral0_wdata_o   = inport_wdata_i;
assign outport_peripheral0_wstrb_o   = inport_wstrb_i;
assign outport_peripheral0_bready_o  = inport_bready_i;
assign outport_peripheral1_awvalid_o = inport_awvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd2);
assign outport_peripheral1_awaddr_o  = inport_awaddr_i;
assign outport_peripheral1_wvalid_o  = inport_wvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd2);
assign outport_peripheral1_wdata_o   = inport_wdata_i;
assign outport_peripheral1_wstrb_o   = inport_wstrb_i;
assign outport_peripheral1_bready_o  = inport_bready_i;
assign outport_peripheral2_awvalid_o = inport_awvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd3);
assign outport_peripheral2_awaddr_o  = inport_awaddr_i;
assign outport_peripheral2_wvalid_o  = inport_wvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd3);
assign outport_peripheral2_wdata_o   = inport_wdata_i;
assign outport_peripheral2_wstrb_o   = inport_wstrb_i;
assign outport_peripheral2_bready_o  = inport_bready_i;
assign outport_peripheral3_awvalid_o = inport_awvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd4);
assign outport_peripheral3_awaddr_o  = inport_awaddr_i;
assign outport_peripheral3_wvalid_o  = inport_wvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd4);
assign outport_peripheral3_wdata_o   = inport_wdata_i;
assign outport_peripheral3_wstrb_o   = inport_wstrb_i;
assign outport_peripheral3_bready_o  = inport_bready_i;
assign outport_peripheral4_awvalid_o = inport_awvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd5);
assign outport_peripheral4_awaddr_o  = inport_awaddr_i;
assign outport_peripheral4_wvalid_o  = inport_wvalid_i & write_accept_w & (write_port_r == `ADDR_SEL_W'd5);
assign outport_peripheral4_wdata_o   = inport_wdata_i;
assign outport_peripheral4_wstrb_o   = inport_wstrb_i;
assign outport_peripheral4_bready_o  = inport_bready_i;

reg        outport_bvalid_r;
reg [1:0]  outport_bresp_r;
reg [3:0]  outport_bid_r;

always @ *
begin
    case (write_port_q)
    `ADDR_SEL_W'd1:
    begin
        outport_bvalid_r = outport_peripheral0_bvalid_i;
        outport_bresp_r  = outport_peripheral0_bresp_i;
        outport_bid_r    = awid_q;
    end
    `ADDR_SEL_W'd2:
    begin
        outport_bvalid_r = outport_peripheral1_bvalid_i;
        outport_bresp_r  = outport_peripheral1_bresp_i;
        outport_bid_r    = awid_q;
    end
    `ADDR_SEL_W'd3:
    begin
        outport_bvalid_r = outport_peripheral2_bvalid_i;
        outport_bresp_r  = outport_peripheral2_bresp_i;
        outport_bid_r    = awid_q;
    end
    `ADDR_SEL_W'd4:
    begin
        outport_bvalid_r = outport_peripheral3_bvalid_i;
        outport_bresp_r  = outport_peripheral3_bresp_i;
        outport_bid_r    = awid_q;
    end
    `ADDR_SEL_W'd5:
    begin
        outport_bvalid_r = outport_peripheral4_bvalid_i;
        outport_bresp_r  = outport_peripheral4_bresp_i;
        outport_bid_r    = awid_q;
    end
    default:
    begin
        outport_bvalid_r = outport_bvalid_i;
        outport_bresp_r  = outport_bresp_i;
        outport_bid_r    = outport_bid_i;
    end
    endcase
end

assign inport_bvalid_o  = outport_bvalid_r;
assign inport_bresp_o   = outport_bresp_r;
assign inport_bid_o     = outport_bid_r;

reg inport_awready_r;
reg inport_wready_r;

// NOTE: This IP expects AWREADY and WREADY to follow each other....
always @ *
begin
    case (write_port_r)
    `ADDR_SEL_W'd1:
    begin
        inport_awready_r = outport_peripheral0_awready_i;
        inport_wready_r  = outport_peripheral0_wready_i;
    end
    `ADDR_SEL_W'd2:
    begin
        inport_awready_r = outport_peripheral1_awready_i;
        inport_wready_r  = outport_peripheral1_wready_i;
    end
    `ADDR_SEL_W'd3:
    begin
        inport_awready_r = outport_peripheral2_awready_i;
        inport_wready_r  = outport_peripheral2_wready_i;
    end
    `ADDR_SEL_W'd4:
    begin
        inport_awready_r = outport_peripheral3_awready_i;
        inport_wready_r  = outport_peripheral3_wready_i;
    end
    `ADDR_SEL_W'd5:
    begin
        inport_awready_r = outport_peripheral4_awready_i;
        inport_wready_r  = outport_peripheral4_wready_i;
    end
    default:
    begin
        inport_awready_r = outport_awready_i;
        inport_wready_r  = outport_wready_i;
    end        
    endcase
end

assign inport_awready_o = write_accept_w & inport_awready_r;
assign inport_wready_o  = write_accept_w & inport_wready_r;


endmodule
