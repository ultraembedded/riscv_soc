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

`include "irq_ctrl_defs.v"

//-----------------------------------------------------------------
// Module:  IRQ Controller
//-----------------------------------------------------------------
module irq_ctrl
(
    // Inputs
     input          clk_i
    ,input          rst_i
    ,input          cfg_awvalid_i
    ,input  [31:0]  cfg_awaddr_i
    ,input          cfg_wvalid_i
    ,input  [31:0]  cfg_wdata_i
    ,input  [3:0]   cfg_wstrb_i
    ,input          cfg_bready_i
    ,input          cfg_arvalid_i
    ,input  [31:0]  cfg_araddr_i
    ,input          cfg_rready_i
    ,input          interrupt0_i
    ,input          interrupt1_i
    ,input          interrupt2_i
    ,input          interrupt3_i

    // Outputs
    ,output         cfg_awready_o
    ,output         cfg_wready_o
    ,output         cfg_bvalid_o
    ,output [1:0]   cfg_bresp_o
    ,output         cfg_arready_o
    ,output         cfg_rvalid_o
    ,output [31:0]  cfg_rdata_o
    ,output [1:0]   cfg_rresp_o
    ,output         intr_o
);

//-----------------------------------------------------------------
// Retime write data
//-----------------------------------------------------------------
reg [31:0] wr_data_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    wr_data_q <= 32'b0;
else
    wr_data_q <= cfg_wdata_i;

//-----------------------------------------------------------------
// Request Logic
//-----------------------------------------------------------------
wire read_en_w  = cfg_arvalid_i & cfg_arready_o;
wire write_en_w = cfg_awvalid_i & cfg_awready_o;

//-----------------------------------------------------------------
// Accept Logic
//-----------------------------------------------------------------
assign cfg_arready_o = ~cfg_rvalid_o;
assign cfg_awready_o = ~cfg_bvalid_o && ~cfg_arvalid_i; 
assign cfg_wready_o  = cfg_awready_o;


//-----------------------------------------------------------------
// Register irq_isr
//-----------------------------------------------------------------
reg irq_isr_wr_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_isr_wr_q <= 1'b0;
else if (write_en_w && (cfg_awaddr_i[7:0] == `IRQ_ISR))
    irq_isr_wr_q <= 1'b1;
else
    irq_isr_wr_q <= 1'b0;

// irq_isr_status [external]
wire [3:0]  irq_isr_status_out_w = wr_data_q[`IRQ_ISR_STATUS_R];


//-----------------------------------------------------------------
// Register irq_ipr
//-----------------------------------------------------------------
reg irq_ipr_wr_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_ipr_wr_q <= 1'b0;
else if (write_en_w && (cfg_awaddr_i[7:0] == `IRQ_IPR))
    irq_ipr_wr_q <= 1'b1;
else
    irq_ipr_wr_q <= 1'b0;


//-----------------------------------------------------------------
// Register irq_ier
//-----------------------------------------------------------------
reg irq_ier_wr_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_ier_wr_q <= 1'b0;
else if (write_en_w && (cfg_awaddr_i[7:0] == `IRQ_IER))
    irq_ier_wr_q <= 1'b1;
else
    irq_ier_wr_q <= 1'b0;

// irq_ier_enable [external]
wire [3:0]  irq_ier_enable_out_w = wr_data_q[`IRQ_IER_ENABLE_R];


//-----------------------------------------------------------------
// Register irq_iar
//-----------------------------------------------------------------
reg irq_iar_wr_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_iar_wr_q <= 1'b0;
else if (write_en_w && (cfg_awaddr_i[7:0] == `IRQ_IAR))
    irq_iar_wr_q <= 1'b1;
else
    irq_iar_wr_q <= 1'b0;

// irq_iar_ack [auto_clr]
reg [3:0]  irq_iar_ack_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_iar_ack_q <= 4'd`IRQ_IAR_ACK_DEFAULT;
else if (write_en_w && (cfg_awaddr_i[7:0] == `IRQ_IAR))
    irq_iar_ack_q <= cfg_wdata_i[`IRQ_IAR_ACK_R];
else
    irq_iar_ack_q <= 4'd`IRQ_IAR_ACK_DEFAULT;

wire [3:0]  irq_iar_ack_out_w = irq_iar_ack_q;


//-----------------------------------------------------------------
// Register irq_sie
//-----------------------------------------------------------------
reg irq_sie_wr_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_sie_wr_q <= 1'b0;
else if (write_en_w && (cfg_awaddr_i[7:0] == `IRQ_SIE))
    irq_sie_wr_q <= 1'b1;
else
    irq_sie_wr_q <= 1'b0;

// irq_sie_set [external]
wire [3:0]  irq_sie_set_out_w = wr_data_q[`IRQ_SIE_SET_R];


//-----------------------------------------------------------------
// Register irq_cie
//-----------------------------------------------------------------
reg irq_cie_wr_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_cie_wr_q <= 1'b0;
else if (write_en_w && (cfg_awaddr_i[7:0] == `IRQ_CIE))
    irq_cie_wr_q <= 1'b1;
else
    irq_cie_wr_q <= 1'b0;

// irq_cie_clr [external]
wire [3:0]  irq_cie_clr_out_w = wr_data_q[`IRQ_CIE_CLR_R];


//-----------------------------------------------------------------
// Register irq_ivr
//-----------------------------------------------------------------
reg irq_ivr_wr_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_ivr_wr_q <= 1'b0;
else if (write_en_w && (cfg_awaddr_i[7:0] == `IRQ_IVR))
    irq_ivr_wr_q <= 1'b1;
else
    irq_ivr_wr_q <= 1'b0;

// irq_ivr_vector [external]
wire [31:0]  irq_ivr_vector_out_w = wr_data_q[`IRQ_IVR_VECTOR_R];


//-----------------------------------------------------------------
// Register irq_mer
//-----------------------------------------------------------------
reg irq_mer_wr_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_mer_wr_q <= 1'b0;
else if (write_en_w && (cfg_awaddr_i[7:0] == `IRQ_MER))
    irq_mer_wr_q <= 1'b1;
else
    irq_mer_wr_q <= 1'b0;

// irq_mer_me [internal]
reg        irq_mer_me_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_mer_me_q <= 1'd`IRQ_MER_ME_DEFAULT;
else if (write_en_w && (cfg_awaddr_i[7:0] == `IRQ_MER))
    irq_mer_me_q <= cfg_wdata_i[`IRQ_MER_ME_R];

wire        irq_mer_me_out_w = irq_mer_me_q;


wire [3:0]  irq_isr_status_in_w;
wire [3:0]  irq_ipr_pending_in_w;
wire [3:0]  irq_ier_enable_in_w;
wire [31:0]  irq_ivr_vector_in_w;


//-----------------------------------------------------------------
// Read mux
//-----------------------------------------------------------------
reg [31:0] data_r;

always @ *
begin
    data_r = 32'b0;

    case (cfg_araddr_i[7:0])

    `IRQ_ISR:
    begin
        data_r[`IRQ_ISR_STATUS_R] = irq_isr_status_in_w;
    end
    `IRQ_IPR:
    begin
        data_r[`IRQ_IPR_PENDING_R] = irq_ipr_pending_in_w;
    end
    `IRQ_IER:
    begin
        data_r[`IRQ_IER_ENABLE_R] = irq_ier_enable_in_w;
    end
    `IRQ_IVR:
    begin
        data_r[`IRQ_IVR_VECTOR_R] = irq_ivr_vector_in_w;
    end
    `IRQ_MER:
    begin
        data_r[`IRQ_MER_ME_R] = irq_mer_me_q;
    end
    default :
        data_r = 32'b0;
    endcase
end

//-----------------------------------------------------------------
// RVALID
//-----------------------------------------------------------------
reg rvalid_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    rvalid_q <= 1'b0;
else if (read_en_w)
    rvalid_q <= 1'b1;
else if (cfg_rready_i)
    rvalid_q <= 1'b0;

assign cfg_rvalid_o = rvalid_q;

//-----------------------------------------------------------------
// Retime read response
//-----------------------------------------------------------------
reg [31:0] rd_data_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    rd_data_q <= 32'b0;
else if (!cfg_rvalid_o || cfg_rready_i)
    rd_data_q <= data_r;

assign cfg_rdata_o = rd_data_q;
assign cfg_rresp_o = 2'b0;

//-----------------------------------------------------------------
// BVALID
//-----------------------------------------------------------------
reg bvalid_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    bvalid_q <= 1'b0;
else if (write_en_w)
    bvalid_q <= 1'b1;
else if (cfg_bready_i)
    bvalid_q <= 1'b0;

assign cfg_bvalid_o = bvalid_q;
assign cfg_bresp_o  = 2'b0;


wire irq_isr_wr_req_w = irq_isr_wr_q;
wire irq_ier_wr_req_w = irq_ier_wr_q;
wire irq_sie_wr_req_w = irq_sie_wr_q;
wire irq_cie_wr_req_w = irq_cie_wr_q;
wire irq_ivr_wr_req_w = irq_ivr_wr_q;

wire [3:0] irq_input_w;

assign irq_input_w[0] = interrupt0_i;
assign irq_input_w[1] = interrupt1_i;
assign irq_input_w[2] = interrupt2_i;
assign irq_input_w[3] = interrupt3_i;

//-----------------------------------------------------------------
// IRQ Enable
//-----------------------------------------------------------------
reg [3:0] irq_enable_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_enable_q <= 4'b0;
else if (irq_ier_wr_req_w)
    irq_enable_q <= irq_ier_enable_out_w;
else if (irq_sie_wr_req_w)
    irq_enable_q <= irq_enable_q | irq_sie_set_out_w;
else if (irq_cie_wr_req_w)
    irq_enable_q <= irq_enable_q & ~irq_cie_clr_out_w;

assign irq_ier_enable_in_w = irq_enable_q;

//-----------------------------------------------------------------
// IRQ Pending
//-----------------------------------------------------------------
reg [3:0] irq_pending_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    irq_pending_q <= 4'b0;
else
    irq_pending_q <= irq_input_w | (irq_pending_q & ~irq_iar_ack_out_w);

assign irq_isr_status_in_w  = irq_pending_q;
assign irq_ipr_pending_in_w = irq_pending_q & irq_enable_q;

//-----------------------------------------------------------------
// IRQ Vector
//-----------------------------------------------------------------
reg [31:0] ivr_vector_r;
always @ *
begin
    ivr_vector_r = 32'hffffffff;

    if (irq_ipr_pending_in_w[0])
        ivr_vector_r = 32'd0;
    else
    if (irq_ipr_pending_in_w[1])
        ivr_vector_r = 32'd1;
    else
    if (irq_ipr_pending_in_w[2])
        ivr_vector_r = 32'd2;
    else
    if (irq_ipr_pending_in_w[3])
        ivr_vector_r = 32'd3;
    else
        ivr_vector_r = 32'hffffffff;
end

assign irq_ivr_vector_in_w = ivr_vector_r;

//-----------------------------------------------------------------
// IRQ output
//-----------------------------------------------------------------
reg intr_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    intr_q <= 1'b0;
else
    intr_q <= irq_mer_me_out_w ? (|irq_ipr_pending_in_w) : 1'b0;

//-----------------------------------------------------------------
// Assignments
//-----------------------------------------------------------------
assign intr_o = intr_q;



endmodule
