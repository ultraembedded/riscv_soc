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

`define GPIO_DIRECTION    8'h0

    `define GPIO_DIRECTION_OUTPUT_DEFAULT    0
    `define GPIO_DIRECTION_OUTPUT_B          0
    `define GPIO_DIRECTION_OUTPUT_T          31
    `define GPIO_DIRECTION_OUTPUT_W          32
    `define GPIO_DIRECTION_OUTPUT_R          31:0

`define GPIO_INPUT    8'h4

    `define GPIO_INPUT_VALUE_DEFAULT    0
    `define GPIO_INPUT_VALUE_B          0
    `define GPIO_INPUT_VALUE_T          31
    `define GPIO_INPUT_VALUE_W          32
    `define GPIO_INPUT_VALUE_R          31:0

`define GPIO_OUTPUT    8'h8

    `define GPIO_OUTPUT_DATA_DEFAULT    0
    `define GPIO_OUTPUT_DATA_B          0
    `define GPIO_OUTPUT_DATA_T          31
    `define GPIO_OUTPUT_DATA_W          32
    `define GPIO_OUTPUT_DATA_R          31:0

`define GPIO_OUTPUT_SET    8'hc

    `define GPIO_OUTPUT_SET_DATA_DEFAULT    0
    `define GPIO_OUTPUT_SET_DATA_B          0
    `define GPIO_OUTPUT_SET_DATA_T          31
    `define GPIO_OUTPUT_SET_DATA_W          32
    `define GPIO_OUTPUT_SET_DATA_R          31:0

`define GPIO_OUTPUT_CLR    8'h10

    `define GPIO_OUTPUT_CLR_DATA_DEFAULT    0
    `define GPIO_OUTPUT_CLR_DATA_B          0
    `define GPIO_OUTPUT_CLR_DATA_T          31
    `define GPIO_OUTPUT_CLR_DATA_W          32
    `define GPIO_OUTPUT_CLR_DATA_R          31:0

`define GPIO_INT_MASK    8'h14

    `define GPIO_INT_MASK_ENABLE_DEFAULT    0
    `define GPIO_INT_MASK_ENABLE_B          0
    `define GPIO_INT_MASK_ENABLE_T          31
    `define GPIO_INT_MASK_ENABLE_W          32
    `define GPIO_INT_MASK_ENABLE_R          31:0

`define GPIO_INT_SET    8'h18

    `define GPIO_INT_SET_SW_IRQ_DEFAULT    0
    `define GPIO_INT_SET_SW_IRQ_B          0
    `define GPIO_INT_SET_SW_IRQ_T          31
    `define GPIO_INT_SET_SW_IRQ_W          32
    `define GPIO_INT_SET_SW_IRQ_R          31:0

`define GPIO_INT_CLR    8'h1c

    `define GPIO_INT_CLR_ACK_DEFAULT    0
    `define GPIO_INT_CLR_ACK_B          0
    `define GPIO_INT_CLR_ACK_T          31
    `define GPIO_INT_CLR_ACK_W          32
    `define GPIO_INT_CLR_ACK_R          31:0

`define GPIO_INT_STATUS    8'h20

    `define GPIO_INT_STATUS_RAW_DEFAULT    0
    `define GPIO_INT_STATUS_RAW_B          0
    `define GPIO_INT_STATUS_RAW_T          31
    `define GPIO_INT_STATUS_RAW_W          32
    `define GPIO_INT_STATUS_RAW_R          31:0

`define GPIO_INT_LEVEL    8'h24

    `define GPIO_INT_LEVEL_ACTIVE_HIGH_DEFAULT    0
    `define GPIO_INT_LEVEL_ACTIVE_HIGH_B          0
    `define GPIO_INT_LEVEL_ACTIVE_HIGH_T          31
    `define GPIO_INT_LEVEL_ACTIVE_HIGH_W          32
    `define GPIO_INT_LEVEL_ACTIVE_HIGH_R          31:0

`define GPIO_INT_MODE    8'h28

    `define GPIO_INT_MODE_EDGE_DEFAULT    0
    `define GPIO_INT_MODE_EDGE_B          0
    `define GPIO_INT_MODE_EDGE_T          31
    `define GPIO_INT_MODE_EDGE_W          32
    `define GPIO_INT_MODE_EDGE_R          31:0

