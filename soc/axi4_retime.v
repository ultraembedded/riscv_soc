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

module axi4_retime
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




//-----------------------------------------------------------------
// Write Command Request
//-----------------------------------------------------------------
wire [45:0] write_cmd_req_out_w;

axi4retime_fifo2x46
u_write_cmd_req
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    .push_i(inport_awvalid_i),
    .data_in_i({inport_awaddr_i, inport_awid_i, inport_awlen_i, inport_awburst_i}),
    .accept_o(inport_awready_o),

    .valid_o(outport_awvalid_o),
    .data_out_o(write_cmd_req_out_w),
    .pop_i(outport_awready_i)
);

assign {outport_awaddr_o, outport_awid_o, outport_awlen_o, outport_awburst_o} = write_cmd_req_out_w;

//-----------------------------------------------------------------
// Write Data Request
//-----------------------------------------------------------------
wire [36:0] write_data_req_out_w;

axi4retime_fifo2x37
u_write_data_req
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    .push_i(inport_wvalid_i),
    .data_in_i({inport_wlast_i, inport_wstrb_i, inport_wdata_i}),
    .accept_o(inport_wready_o),

    .valid_o(outport_wvalid_o),
    .data_out_o(write_data_req_out_w),
    .pop_i(outport_wready_i)
);

assign {outport_wlast_o, outport_wstrb_o, outport_wdata_o} = write_data_req_out_w;

//-----------------------------------------------------------------
// Write Response
//-----------------------------------------------------------------
wire [5:0] write_resp_out_w;

axi4retime_fifo2x6
u_write_resp
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    .push_i(outport_bvalid_i),
    .data_in_i({outport_bresp_i, outport_bid_i}),
    .accept_o(outport_bready_o),

    .valid_o(inport_bvalid_o),
    .data_out_o(write_resp_out_w),
    .pop_i(inport_bready_i)
);

assign {inport_bresp_o, inport_bid_o} = write_resp_out_w;

//-----------------------------------------------------------------
// Read Request
//-----------------------------------------------------------------
wire [45:0] read_req_out_w;

axi4retime_fifo2x46
u_read_req
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    .push_i(inport_arvalid_i),
    .data_in_i({inport_araddr_i, inport_arid_i, inport_arlen_i, inport_arburst_i}),
    .accept_o(inport_arready_o),

    .valid_o(outport_arvalid_o),
    .data_out_o(read_req_out_w),
    .pop_i(outport_arready_i)
);

assign {outport_araddr_o, outport_arid_o, outport_arlen_o, outport_arburst_o} = read_req_out_w;

//-----------------------------------------------------------------
// Read Response
//-----------------------------------------------------------------
wire [38:0] read_resp_out_w;

axi4retime_fifo2x39
u_read_resp
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    .push_i(outport_rvalid_i),
    .data_in_i({outport_rdata_i, outport_rresp_i, outport_rid_i, outport_rlast_i}),
    .accept_o(outport_rready_o),

    .valid_o(inport_rvalid_o),
    .data_out_o(read_resp_out_w),
    .pop_i(inport_rready_i)
);

assign {inport_rdata_o, inport_rresp_o, inport_rid_o, inport_rlast_o} = read_resp_out_w;

endmodule

//-----------------------------------------------------------------
//                       FIFO modules
//-----------------------------------------------------------------

module axi4retime_fifo2x37
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input  [ 36:0]  data_in_i
    ,input           push_i
    ,input           pop_i

    // Outputs
    ,output [ 36:0]  data_out_o
    ,output          accept_o
    ,output          valid_o
);



//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
reg [36:0]    ram_q[1:0];
reg [0:0]   rd_ptr_q;
reg [0:0]   wr_ptr_q;
reg [1:0]  count_q;

//-----------------------------------------------------------------
// Sequential
//-----------------------------------------------------------------
always @ (posedge clk_i or posedge rst_i)
begin
    if (rst_i == 1'b1)
    begin
        count_q   <= 2'b0;
        rd_ptr_q  <= 1'b0;
        wr_ptr_q  <= 1'b0;
    end
    else
    begin
        // Push
        if (push_i & accept_o)
        begin
            ram_q[wr_ptr_q] <= data_in_i;
            wr_ptr_q        <= wr_ptr_q + 1'd1;
        end

        // Pop
        if (pop_i & valid_o)
        begin
            rd_ptr_q      <= rd_ptr_q + 1'd1;
        end

        // Count up
        if ((push_i & accept_o) & ~(pop_i & valid_o))
        begin
            count_q <= count_q + 2'd1;
        end
        // Count down
        else if (~(push_i & accept_o) & (pop_i & valid_o))
        begin
            count_q <= count_q - 2'd1;
        end
    end
end

//-------------------------------------------------------------------
// Combinatorial
//-------------------------------------------------------------------
assign valid_o       = (count_q != 2'd0);
assign accept_o      = (count_q != 2'd2);




assign data_out_o    = ram_q[rd_ptr_q];



endmodule

module axi4retime_fifo2x39
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input  [ 38:0]  data_in_i
    ,input           push_i
    ,input           pop_i

    // Outputs
    ,output [ 38:0]  data_out_o
    ,output          accept_o
    ,output          valid_o
);



//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
reg [38:0]    ram_q[1:0];
reg [0:0]   rd_ptr_q;
reg [0:0]   wr_ptr_q;
reg [1:0]  count_q;

//-----------------------------------------------------------------
// Sequential
//-----------------------------------------------------------------
always @ (posedge clk_i or posedge rst_i)
begin
    if (rst_i == 1'b1)
    begin
        count_q   <= 2'b0;
        rd_ptr_q  <= 1'b0;
        wr_ptr_q  <= 1'b0;
    end
    else
    begin
        // Push
        if (push_i & accept_o)
        begin
            ram_q[wr_ptr_q] <= data_in_i;
            wr_ptr_q        <= wr_ptr_q + 1'd1;
        end

        // Pop
        if (pop_i & valid_o)
        begin
            rd_ptr_q      <= rd_ptr_q + 1'd1;
        end

        // Count up
        if ((push_i & accept_o) & ~(pop_i & valid_o))
        begin
            count_q <= count_q + 2'd1;
        end
        // Count down
        else if (~(push_i & accept_o) & (pop_i & valid_o))
        begin
            count_q <= count_q - 2'd1;
        end
    end
end

//-------------------------------------------------------------------
// Combinatorial
//-------------------------------------------------------------------
assign valid_o       = (count_q != 2'd0);
assign accept_o      = (count_q != 2'd2);




assign data_out_o    = ram_q[rd_ptr_q];



endmodule


module axi4retime_fifo2x46
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input  [ 45:0]  data_in_i
    ,input           push_i
    ,input           pop_i

    // Outputs
    ,output [ 45:0]  data_out_o
    ,output          accept_o
    ,output          valid_o
);



//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
reg [45:0]    ram_q[1:0];
reg [0:0]   rd_ptr_q;
reg [0:0]   wr_ptr_q;
reg [1:0]  count_q;

//-----------------------------------------------------------------
// Sequential
//-----------------------------------------------------------------
always @ (posedge clk_i or posedge rst_i)
begin
    if (rst_i == 1'b1)
    begin
        count_q   <= 2'b0;
        rd_ptr_q  <= 1'b0;
        wr_ptr_q  <= 1'b0;
    end
    else
    begin
        // Push
        if (push_i & accept_o)
        begin
            ram_q[wr_ptr_q] <= data_in_i;
            wr_ptr_q        <= wr_ptr_q + 1'd1;
        end

        // Pop
        if (pop_i & valid_o)
        begin
            rd_ptr_q      <= rd_ptr_q + 1'd1;
        end

        // Count up
        if ((push_i & accept_o) & ~(pop_i & valid_o))
        begin
            count_q <= count_q + 2'd1;
        end
        // Count down
        else if (~(push_i & accept_o) & (pop_i & valid_o))
        begin
            count_q <= count_q - 2'd1;
        end
    end
end

//-------------------------------------------------------------------
// Combinatorial
//-------------------------------------------------------------------
assign valid_o       = (count_q != 2'd0);
assign accept_o      = (count_q != 2'd2);




assign data_out_o    = ram_q[rd_ptr_q];



endmodule

module axi4retime_fifo2x6
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input  [  5:0]  data_in_i
    ,input           push_i
    ,input           pop_i

    // Outputs
    ,output [  5:0]  data_out_o
    ,output          accept_o
    ,output          valid_o
);



//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
reg [5:0]    ram_q[1:0];
reg [0:0]   rd_ptr_q;
reg [0:0]   wr_ptr_q;
reg [1:0]  count_q;

//-----------------------------------------------------------------
// Sequential
//-----------------------------------------------------------------
always @ (posedge clk_i or posedge rst_i)
begin
    if (rst_i == 1'b1)
    begin
        count_q   <= 2'b0;
        rd_ptr_q  <= 1'b0;
        wr_ptr_q  <= 1'b0;
    end
    else
    begin
        // Push
        if (push_i & accept_o)
        begin
            ram_q[wr_ptr_q] <= data_in_i;
            wr_ptr_q        <= wr_ptr_q + 1'd1;
        end

        // Pop
        if (pop_i & valid_o)
        begin
            rd_ptr_q      <= rd_ptr_q + 1'd1;
        end

        // Count up
        if ((push_i & accept_o) & ~(pop_i & valid_o))
        begin
            count_q <= count_q + 2'd1;
        end
        // Count down
        else if (~(push_i & accept_o) & (pop_i & valid_o))
        begin
            count_q <= count_q - 2'd1;
        end
    end
end

//-------------------------------------------------------------------
// Combinatorial
//-------------------------------------------------------------------
assign valid_o       = (count_q != 2'd0);
assign accept_o      = (count_q != 2'd2);




assign data_out_o    = ram_q[rd_ptr_q];




endmodule
