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

`define SPI_DGIER    8'h1c

    `define SPI_DGIER_GIE      31
    `define SPI_DGIER_GIE_DEFAULT    0
    `define SPI_DGIER_GIE_B          31
    `define SPI_DGIER_GIE_T          31
    `define SPI_DGIER_GIE_W          1
    `define SPI_DGIER_GIE_R          31:31

`define SPI_IPISR    8'h20

    `define SPI_IPISR_TX_EMPTY      2
    `define SPI_IPISR_TX_EMPTY_DEFAULT    0
    `define SPI_IPISR_TX_EMPTY_B          2
    `define SPI_IPISR_TX_EMPTY_T          2
    `define SPI_IPISR_TX_EMPTY_W          1
    `define SPI_IPISR_TX_EMPTY_R          2:2

`define SPI_IPIER    8'h28

    `define SPI_IPIER_TX_EMPTY      2
    `define SPI_IPIER_TX_EMPTY_DEFAULT    0
    `define SPI_IPIER_TX_EMPTY_B          2
    `define SPI_IPIER_TX_EMPTY_T          2
    `define SPI_IPIER_TX_EMPTY_W          1
    `define SPI_IPIER_TX_EMPTY_R          2:2

`define SPI_SRR    8'h40

    `define SPI_SRR_RESET_DEFAULT    0
    `define SPI_SRR_RESET_B          0
    `define SPI_SRR_RESET_T          31
    `define SPI_SRR_RESET_W          32
    `define SPI_SRR_RESET_R          31:0

`define SPI_CR    8'h60

    `define SPI_CR_LOOP      0
    `define SPI_CR_LOOP_DEFAULT    0
    `define SPI_CR_LOOP_B          0
    `define SPI_CR_LOOP_T          0
    `define SPI_CR_LOOP_W          1
    `define SPI_CR_LOOP_R          0:0

    `define SPI_CR_SPE      1
    `define SPI_CR_SPE_DEFAULT    0
    `define SPI_CR_SPE_B          1
    `define SPI_CR_SPE_T          1
    `define SPI_CR_SPE_W          1
    `define SPI_CR_SPE_R          1:1

    `define SPI_CR_MASTER      2
    `define SPI_CR_MASTER_DEFAULT    0
    `define SPI_CR_MASTER_B          2
    `define SPI_CR_MASTER_T          2
    `define SPI_CR_MASTER_W          1
    `define SPI_CR_MASTER_R          2:2

    `define SPI_CR_CPOL      3
    `define SPI_CR_CPOL_DEFAULT    0
    `define SPI_CR_CPOL_B          3
    `define SPI_CR_CPOL_T          3
    `define SPI_CR_CPOL_W          1
    `define SPI_CR_CPOL_R          3:3

    `define SPI_CR_CPHA      4
    `define SPI_CR_CPHA_DEFAULT    0
    `define SPI_CR_CPHA_B          4
    `define SPI_CR_CPHA_T          4
    `define SPI_CR_CPHA_W          1
    `define SPI_CR_CPHA_R          4:4

    `define SPI_CR_TXFIFO_RST      5
    `define SPI_CR_TXFIFO_RST_DEFAULT    0
    `define SPI_CR_TXFIFO_RST_B          5
    `define SPI_CR_TXFIFO_RST_T          5
    `define SPI_CR_TXFIFO_RST_W          1
    `define SPI_CR_TXFIFO_RST_R          5:5

    `define SPI_CR_RXFIFO_RST      6
    `define SPI_CR_RXFIFO_RST_DEFAULT    0
    `define SPI_CR_RXFIFO_RST_B          6
    `define SPI_CR_RXFIFO_RST_T          6
    `define SPI_CR_RXFIFO_RST_W          1
    `define SPI_CR_RXFIFO_RST_R          6:6

    `define SPI_CR_MANUAL_SS      7
    `define SPI_CR_MANUAL_SS_DEFAULT    0
    `define SPI_CR_MANUAL_SS_B          7
    `define SPI_CR_MANUAL_SS_T          7
    `define SPI_CR_MANUAL_SS_W          1
    `define SPI_CR_MANUAL_SS_R          7:7

    `define SPI_CR_TRANS_INHIBIT      8
    `define SPI_CR_TRANS_INHIBIT_DEFAULT    0
    `define SPI_CR_TRANS_INHIBIT_B          8
    `define SPI_CR_TRANS_INHIBIT_T          8
    `define SPI_CR_TRANS_INHIBIT_W          1
    `define SPI_CR_TRANS_INHIBIT_R          8:8

    `define SPI_CR_LSB_FIRST      9
    `define SPI_CR_LSB_FIRST_DEFAULT    0
    `define SPI_CR_LSB_FIRST_B          9
    `define SPI_CR_LSB_FIRST_T          9
    `define SPI_CR_LSB_FIRST_W          1
    `define SPI_CR_LSB_FIRST_R          9:9

`define SPI_SR    8'h64

    `define SPI_SR_RX_EMPTY      0
    `define SPI_SR_RX_EMPTY_DEFAULT    0
    `define SPI_SR_RX_EMPTY_B          0
    `define SPI_SR_RX_EMPTY_T          0
    `define SPI_SR_RX_EMPTY_W          1
    `define SPI_SR_RX_EMPTY_R          0:0

    `define SPI_SR_RX_FULL      1
    `define SPI_SR_RX_FULL_DEFAULT    0
    `define SPI_SR_RX_FULL_B          1
    `define SPI_SR_RX_FULL_T          1
    `define SPI_SR_RX_FULL_W          1
    `define SPI_SR_RX_FULL_R          1:1

    `define SPI_SR_TX_EMPTY      2
    `define SPI_SR_TX_EMPTY_DEFAULT    0
    `define SPI_SR_TX_EMPTY_B          2
    `define SPI_SR_TX_EMPTY_T          2
    `define SPI_SR_TX_EMPTY_W          1
    `define SPI_SR_TX_EMPTY_R          2:2

    `define SPI_SR_TX_FULL      3
    `define SPI_SR_TX_FULL_DEFAULT    0
    `define SPI_SR_TX_FULL_B          3
    `define SPI_SR_TX_FULL_T          3
    `define SPI_SR_TX_FULL_W          1
    `define SPI_SR_TX_FULL_R          3:3

`define SPI_DTR    8'h68

    `define SPI_DTR_DATA_DEFAULT    0
    `define SPI_DTR_DATA_B          0
    `define SPI_DTR_DATA_T          7
    `define SPI_DTR_DATA_W          8
    `define SPI_DTR_DATA_R          7:0

`define SPI_DRR    8'h6c

    `define SPI_DRR_DATA_DEFAULT    0
    `define SPI_DRR_DATA_B          0
    `define SPI_DRR_DATA_T          7
    `define SPI_DRR_DATA_W          8
    `define SPI_DRR_DATA_R          7:0

`define SPI_SSR    8'h70

    `define SPI_SSR_VALUE      0
    `define SPI_SSR_VALUE_DEFAULT    1
    `define SPI_SSR_VALUE_B          0
    `define SPI_SSR_VALUE_T          0
    `define SPI_SSR_VALUE_W          1
    `define SPI_SSR_VALUE_R          0:0

