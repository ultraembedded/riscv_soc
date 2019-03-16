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

`define ULITE_RX    8'h0

    `define ULITE_RX_DATA_DEFAULT    0
    `define ULITE_RX_DATA_B          0
    `define ULITE_RX_DATA_T          7
    `define ULITE_RX_DATA_W          8
    `define ULITE_RX_DATA_R          7:0

`define ULITE_TX    8'h4

    `define ULITE_TX_DATA_DEFAULT    0
    `define ULITE_TX_DATA_B          0
    `define ULITE_TX_DATA_T          7
    `define ULITE_TX_DATA_W          8
    `define ULITE_TX_DATA_R          7:0

`define ULITE_STATUS    8'h8

    `define ULITE_STATUS_IE      4
    `define ULITE_STATUS_IE_DEFAULT    0
    `define ULITE_STATUS_IE_B          4
    `define ULITE_STATUS_IE_T          4
    `define ULITE_STATUS_IE_W          1
    `define ULITE_STATUS_IE_R          4:4

    `define ULITE_STATUS_TXFULL      3
    `define ULITE_STATUS_TXFULL_DEFAULT    0
    `define ULITE_STATUS_TXFULL_B          3
    `define ULITE_STATUS_TXFULL_T          3
    `define ULITE_STATUS_TXFULL_W          1
    `define ULITE_STATUS_TXFULL_R          3:3

    `define ULITE_STATUS_TXEMPTY      2
    `define ULITE_STATUS_TXEMPTY_DEFAULT    0
    `define ULITE_STATUS_TXEMPTY_B          2
    `define ULITE_STATUS_TXEMPTY_T          2
    `define ULITE_STATUS_TXEMPTY_W          1
    `define ULITE_STATUS_TXEMPTY_R          2:2

    `define ULITE_STATUS_RXFULL      1
    `define ULITE_STATUS_RXFULL_DEFAULT    0
    `define ULITE_STATUS_RXFULL_B          1
    `define ULITE_STATUS_RXFULL_T          1
    `define ULITE_STATUS_RXFULL_W          1
    `define ULITE_STATUS_RXFULL_R          1:1

    `define ULITE_STATUS_RXVALID      0
    `define ULITE_STATUS_RXVALID_DEFAULT    0
    `define ULITE_STATUS_RXVALID_B          0
    `define ULITE_STATUS_RXVALID_T          0
    `define ULITE_STATUS_RXVALID_W          1
    `define ULITE_STATUS_RXVALID_R          0:0

`define ULITE_CONTROL    8'hc

    `define ULITE_CONTROL_IE      4
    `define ULITE_CONTROL_IE_DEFAULT    0
    `define ULITE_CONTROL_IE_B          4
    `define ULITE_CONTROL_IE_T          4
    `define ULITE_CONTROL_IE_W          1
    `define ULITE_CONTROL_IE_R          4:4

    `define ULITE_CONTROL_RST_RX      1
    `define ULITE_CONTROL_RST_RX_DEFAULT    0
    `define ULITE_CONTROL_RST_RX_B          1
    `define ULITE_CONTROL_RST_RX_T          1
    `define ULITE_CONTROL_RST_RX_W          1
    `define ULITE_CONTROL_RST_RX_R          1:1

    `define ULITE_CONTROL_RST_TX      0
    `define ULITE_CONTROL_RST_TX_DEFAULT    0
    `define ULITE_CONTROL_RST_TX_B          0
    `define ULITE_CONTROL_RST_TX_T          0
    `define ULITE_CONTROL_RST_TX_W          1
    `define ULITE_CONTROL_RST_TX_R          0:0

